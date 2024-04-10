/*
    This file is part of darktable,
    Copyright (C) 2009-2021 darktable developers.
    darktable is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    darktable is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with darktable.  If not, see <http://www.gnu.org/licenses/>.
*/
/** this is the view for the lighttable module.  */
#include "bauhaus/bauhaus.h"
#include "common/collection.h"
#include "common/colorlabels.h"
#include "common/darktable.h"
#include "common/debug.h"
#include "common/file_location.h"
#include "common/focus_peaking.h"
#include "common/grouping.h"
#include "common/history.h"
#include "common/image_cache.h"
#include "common/ratings.h"
#include "common/selection.h"
#include "common/undo.h"
#include "control/conf.h"
#include "control/control.h"
#include "control/jobs.h"
#include "control/settings.h"
#include "dtgtk/button.h"
#include "dtgtk/culling.h"
#include "dtgtk/thumbtable.h"
#include "gui/accelerators.h"
#include "gui/drag_and_drop.h"
#include "gui/draw.h"
#include "gui/gtk.h"
#include "libs/lib.h"
#include "views/view.h"
#include "views/view_api.h"

#ifdef USE_LUA
#include "lua/image.h"
#endif

#include <assert.h>
#include <dirent.h>
#include <errno.h>
#include <gdk/gdkkeysyms.h>
#include <math.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

DT_MODULE(1)

/**
 * this organises the whole library:
 * previously imported film rolls..
 */
typedef struct dt_library_t
{
  // culling and preview struct.
  dt_culling_t *culling;
  dt_culling_t *preview;

  dt_lighttable_layout_t current_layout;

  int preview_sticky;       // are we in sticky preview mode
  gboolean preview_state;   // are we in preview mode (always combined with another layout)
  gboolean already_started; // is it the first start of lighttable. Used by culling
  int thumbtable_offset;    // last thumbtable offset before entering culling

  GtkWidget *profile_floating_window;
} dt_library_t;

const char *name(const dt_view_t *self)
{
  return _("lighttable");
}


uint32_t view(const dt_view_t *self)
{
  return DT_VIEW_LIGHTTABLE;
}

// exit the full preview mode
static void _preview_quit(dt_view_t *self)
{
  dt_library_t *lib = (dt_library_t *)self->data;
  gtk_widget_hide(lib->preview->widget);
  if(lib->preview->selection_sync)
  {
    dt_selection_select_single(darktable.selection, lib->preview->offset_imgid);
  }
  lib->preview_state = FALSE;
  // restore panels
  dt_ui_restore_panels(darktable.gui->ui);

  // show/hide filmstrip & timeline when entering the view
  if(lib->current_layout == DT_LIGHTTABLE_LAYOUT_CULLING
     || lib->current_layout == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
  {
    // update thumbtable, to indicate if we navigate inside selection or not
    // this is needed as collection change is handle there
    dt_ui_thumbtable(darktable.gui->ui)->navigate_inside_selection = lib->culling->navigate_inside_selection;

    dt_lib_set_visible(darktable.view_manager->proxy.timeline.module, FALSE); // not available in this layouts
    dt_lib_set_visible(darktable.view_manager->proxy.filmstrip.module,
                       TRUE); // always on, visibility is driven by panel state

    dt_culling_update_active_images_list(lib->culling);
  }
  else
  {
    dt_ui_thumbtable(darktable.gui->ui)->navigate_inside_selection = FALSE;
    dt_lib_set_visible(darktable.view_manager->proxy.filmstrip.module, FALSE); // not available in this layouts
    dt_lib_set_visible(darktable.view_manager->proxy.timeline.module,
                       TRUE); // always on, visibility is driven by panel state

    // set offset back
    dt_thumbtable_set_offset(dt_ui_thumbtable(darktable.gui->ui), lib->thumbtable_offset, TRUE);

    // we need to show thumbtable
    if(lib->current_layout == DT_LIGHTTABLE_LAYOUT_FILEMANAGER)
    {
      dt_thumbtable_set_parent(dt_ui_thumbtable(darktable.gui->ui), dt_ui_center_base(darktable.gui->ui),
                               DT_THUMBTABLE_MODE_FILEMANAGER);
    }
    else if(lib->current_layout == DT_LIGHTTABLE_LAYOUT_ZOOMABLE)
    {
      dt_thumbtable_set_parent(dt_ui_thumbtable(darktable.gui->ui), dt_ui_center_base(darktable.gui->ui),
                               DT_THUMBTABLE_MODE_ZOOM);
    }
    gtk_widget_show(dt_ui_thumbtable(darktable.gui->ui)->widget);
    dt_thumbtable_full_redraw(dt_ui_thumbtable(darktable.gui->ui), TRUE);
  }
}

// check if we need to change the layout, and apply the change if needed
static void _lighttable_check_layout(dt_view_t *self)
{
  dt_library_t *lib = (dt_library_t *)self->data;
  const dt_lighttable_layout_t layout = dt_view_lighttable_get_layout(darktable.view_manager);
  const dt_lighttable_layout_t layout_old = lib->current_layout;

  if(lib->current_layout == layout) return;

  // if we are in full preview mode, we first need to exit this mode
  if(lib->preview_state) _preview_quit(self);

  lib->current_layout = layout;

  // layout has changed, let restore panels
  dt_ui_restore_panels(darktable.gui->ui);

  if(layout == DT_LIGHTTABLE_LAYOUT_FILEMANAGER || layout == DT_LIGHTTABLE_LAYOUT_ZOOMABLE)
  {
    dt_ui_thumbtable(darktable.gui->ui)->navigate_inside_selection = FALSE;
    gtk_widget_hide(lib->preview->widget);
    gtk_widget_hide(lib->culling->widget);
    gtk_widget_hide(dt_ui_thumbtable(darktable.gui->ui)->widget);

    // if we arrive from culling, we just need to ensure the offset is right
    if(layout_old == DT_LIGHTTABLE_LAYOUT_CULLING || layout_old == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
    {
      dt_thumbtable_set_offset(dt_ui_thumbtable(darktable.gui->ui), lib->thumbtable_offset, FALSE);
    }
    // we want to reacquire the thumbtable if needed
    if(layout == DT_LIGHTTABLE_LAYOUT_FILEMANAGER)
    {
      dt_thumbtable_set_parent(dt_ui_thumbtable(darktable.gui->ui), dt_ui_center_base(darktable.gui->ui),
                               DT_THUMBTABLE_MODE_FILEMANAGER);
    }
    else
    {
      dt_thumbtable_set_parent(dt_ui_thumbtable(darktable.gui->ui), dt_ui_center_base(darktable.gui->ui),
                               DT_THUMBTABLE_MODE_ZOOM);
    }
    dt_thumbtable_full_redraw(dt_ui_thumbtable(darktable.gui->ui), TRUE);
    gtk_widget_show(dt_ui_thumbtable(darktable.gui->ui)->widget);
  }
  else if(layout == DT_LIGHTTABLE_LAYOUT_CULLING || layout == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
  {
    // record thumbtable offset
    lib->thumbtable_offset = dt_thumbtable_get_offset(dt_ui_thumbtable(darktable.gui->ui));

    if(!lib->already_started)
    {
      int id = lib->thumbtable_offset;
      sqlite3_stmt *stmt;
      gchar *query = g_strdup_printf("SELECT rowid FROM memory.collected_images WHERE imgid=%d",
                                     dt_conf_get_int("plugins/lighttable/culling_last_id"));
      DT_DEBUG_SQLITE3_PREPARE_V2(dt_database_get(darktable.db), query, -1, &stmt, NULL);
      if(sqlite3_step(stmt) == SQLITE_ROW)
      {
        id = sqlite3_column_int(stmt, 0);
      }
      g_free(query);
      sqlite3_finalize(stmt);

      dt_culling_init(lib->culling, id);
    }
    else
      dt_culling_init(lib->culling, -1);


    // ensure that thumbtable is not visible in the main view
    gtk_widget_hide(dt_ui_thumbtable(darktable.gui->ui)->widget);
    gtk_widget_hide(lib->preview->widget);
    gtk_widget_show(lib->culling->widget);

    dt_ui_thumbtable(darktable.gui->ui)->navigate_inside_selection = lib->culling->navigate_inside_selection;
  }

  lib->already_started = TRUE;

  if(layout == DT_LIGHTTABLE_LAYOUT_CULLING || layout == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC || lib->preview_state)
  {
    dt_thumbtable_set_parent(dt_ui_thumbtable(darktable.gui->ui), dt_ui_center_base(darktable.gui->ui),
                             DT_THUMBTABLE_MODE_NONE);
    dt_lib_set_visible(darktable.view_manager->proxy.timeline.module, FALSE); // not available in this layouts
    dt_lib_set_visible(darktable.view_manager->proxy.filmstrip.module,
                       TRUE); // always on, visibility is driven by panel state
    dt_ui_scrollbars_show(darktable.gui->ui, FALSE);
    dt_thumbtable_set_offset_image(dt_ui_thumbtable(darktable.gui->ui), lib->culling->offset_imgid, TRUE);
    dt_culling_update_active_images_list(lib->culling);
  }
  else
  {
    dt_lib_set_visible(darktable.view_manager->proxy.filmstrip.module, FALSE); // not available in this layouts
    dt_lib_set_visible(darktable.view_manager->proxy.timeline.module,
                       TRUE); // always on, visibility is driven by panel state
  }
}

static void _lighttable_change_offset(dt_view_t *self, gboolean reset, gint imgid)
{
  dt_library_t *lib = (dt_library_t *)self->data;

  // full_preview change
  if(lib->preview_state)
  {
    // we only do the change if the offset is different
    if(lib->culling->offset_imgid != imgid) dt_culling_change_offset_image(lib->preview, imgid);
  }

  // culling change (note that full_preview can be combined with culling)
  if(lib->current_layout == DT_LIGHTTABLE_LAYOUT_CULLING
     || lib->current_layout == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
  {
    dt_culling_change_offset_image(lib->culling, imgid);
  }
}

static void _culling_reinit(dt_view_t *self)
{
  dt_library_t *lib = (dt_library_t *)self->data;
  dt_culling_init(lib->culling, lib->culling->offset);
}

static void _culling_preview_reload_overlays(dt_view_t *self)
{
  dt_library_t *lib = (dt_library_t *)self->data;

  // change overlays if needed for culling and preview
  gchar *otxt = g_strdup_printf("plugins/lighttable/overlays/culling/%d", DT_CULLING_MODE_CULLING);
  dt_thumbnail_overlay_t over = dt_conf_get_int(otxt);
  dt_culling_set_overlays_mode(lib->culling, over);
  g_free(otxt);
  otxt = g_strdup_printf("plugins/lighttable/overlays/culling/%d", DT_CULLING_MODE_PREVIEW);
  over = dt_conf_get_int(otxt);
  dt_culling_set_overlays_mode(lib->preview, over);
  g_free(otxt);
}

static void _culling_preview_refresh(dt_view_t *self)
{
  dt_library_t *lib = (dt_library_t *)self->data;

  // change overlays if needed for culling and preview
  _culling_preview_reload_overlays(self);

  // full_preview change
  if(lib->preview_state)
  {
    dt_culling_full_redraw(lib->preview, TRUE);
  }

  // culling change (note that full_preview can be combined with culling)
  if(lib->current_layout == DT_LIGHTTABLE_LAYOUT_CULLING
     || lib->current_layout == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
  {
    dt_culling_full_redraw(lib->culling, TRUE);
  }
}

static gboolean _preview_get_state(dt_view_t *self)
{
  dt_library_t *lib = (dt_library_t *)self->data;
  return lib->preview_state;
}

#ifdef USE_LUA

static int set_image_visible_cb(lua_State *L)
{
  dt_lua_image_t imgid = -1;
  dt_view_t *self = lua_touserdata(L, lua_upvalueindex(1));  //check were in lighttable view
  if(view(self) == DT_VIEW_LIGHTTABLE)
  {
    //check we are in file manager or zoomable
    dt_library_t *lib = (dt_library_t *)self->data;
    const dt_lighttable_layout_t layout = lib->current_layout;
    if(layout == DT_LIGHTTABLE_LAYOUT_FILEMANAGER || layout == DT_LIGHTTABLE_LAYOUT_ZOOMABLE)
    {
      if(luaL_testudata(L, 1, "dt_lua_image_t"))
      {
        luaA_to(L, dt_lua_image_t, &imgid, 1);
        dt_thumbtable_set_offset_image(dt_ui_thumbtable(darktable.gui->ui), imgid, TRUE);
        return 0;
      }
      else
        return luaL_error(L, "no image specified");
    }
    else
      return luaL_error(L, "must be in file manager or zoomable lighttable mode");
  }
  else
    return luaL_error(L, "must be in lighttable view");
}

static gboolean is_image_visible_cb(lua_State *L)
{
  dt_lua_image_t imgid = -1;
  dt_view_t *self = lua_touserdata(L, lua_upvalueindex(1));  //check were in lighttable view
  //check we are in file manager or zoomable
  if(view(self) == DT_VIEW_LIGHTTABLE)
  {
    //check we are in file manager or zoomable
    dt_library_t *lib = (dt_library_t *)self->data;
    const dt_lighttable_layout_t layout = lib->current_layout;
    if(layout == DT_LIGHTTABLE_LAYOUT_FILEMANAGER || layout == DT_LIGHTTABLE_LAYOUT_ZOOMABLE)
    {
      if(luaL_testudata(L, 1, "dt_lua_image_t"))
      {
        luaA_to(L, dt_lua_image_t, &imgid, 1);
        lua_pushboolean(L, dt_thumbtable_check_imgid_visibility(dt_ui_thumbtable(darktable.gui->ui), imgid));
        return 1;
      }
      else
        return luaL_error(L, "no image specified");
    }
    else
      return luaL_error(L, "must be in file manager or zoomable lighttable mode");
  }
  else
    return luaL_error(L, "must be in lighttable view");
}

#endif

void cleanup(dt_view_t *self)
{
  dt_library_t *lib = (dt_library_t *)self->data;
  free(lib->culling);
  free(lib->preview);
  free(self->data);
}

void expose(dt_view_t *self, cairo_t *cr, int32_t width, int32_t height, int32_t pointerx, int32_t pointery)
{
  dt_library_t *lib = (dt_library_t *)self->data;

  const double start = dt_get_wtime();
  const dt_lighttable_layout_t layout = dt_view_lighttable_get_layout(darktable.view_manager);

  // Let's show full preview if in that state...
  _lighttable_check_layout(self);

  if(!darktable.collection || darktable.collection->count <= 0)
  {
    // thumbtable displays an help message
  }
  else if(lib->preview_state)
  {
    if(!gtk_widget_get_visible(lib->preview->widget)) gtk_widget_show(lib->preview->widget);
    gtk_widget_hide(lib->culling->widget);
  }
  else // we do pass on expose to manager or zoomable
  {
    switch(layout)
    {
      case DT_LIGHTTABLE_LAYOUT_ZOOMABLE:
      case DT_LIGHTTABLE_LAYOUT_FILEMANAGER:
        if(!gtk_widget_get_visible(dt_ui_thumbtable(darktable.gui->ui)->widget))
          gtk_widget_show(dt_ui_thumbtable(darktable.gui->ui)->widget);
        break;
      case DT_LIGHTTABLE_LAYOUT_CULLING:
      case DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC:
        if(!gtk_widget_get_visible(lib->culling->widget)) gtk_widget_show(lib->culling->widget);
        gtk_widget_hide(lib->preview->widget);
        break;
      case DT_LIGHTTABLE_LAYOUT_PREVIEW:
        break;
      case DT_LIGHTTABLE_LAYOUT_FIRST:
      case DT_LIGHTTABLE_LAYOUT_LAST:
        break;
    }
  }

  // we have started the first expose
  lib->already_started = TRUE;

  const double end = dt_get_wtime();
  if(darktable.unmuted & DT_DEBUG_PERF)
    dt_print(DT_DEBUG_LIGHTTABLE, "[lighttable] expose took %0.04f sec\n", end - start);
}

void enter(dt_view_t *self)
{
  dt_library_t *lib = (dt_library_t *)self->data;
  const dt_lighttable_layout_t layout = dt_view_lighttable_get_layout(darktable.view_manager);

  // we want to reacquire the thumbtable if needed
  if(!lib->preview_state)
  {
    if(layout == DT_LIGHTTABLE_LAYOUT_FILEMANAGER)
    {
      dt_thumbtable_set_parent(dt_ui_thumbtable(darktable.gui->ui), dt_ui_center_base(darktable.gui->ui),
                               DT_THUMBTABLE_MODE_FILEMANAGER);
      gtk_widget_show(dt_ui_thumbtable(darktable.gui->ui)->widget);
    }
    else if(layout == DT_LIGHTTABLE_LAYOUT_ZOOMABLE)
    {
      dt_thumbtable_set_parent(dt_ui_thumbtable(darktable.gui->ui), dt_ui_center_base(darktable.gui->ui),
                               DT_THUMBTABLE_MODE_ZOOM);
      gtk_widget_show(dt_ui_thumbtable(darktable.gui->ui)->widget);
    }
  }

  // clean the undo list
  dt_undo_clear(darktable.undo, DT_UNDO_LIGHTTABLE);

  gtk_widget_grab_focus(dt_ui_center(darktable.gui->ui));

  dt_collection_hint_message(darktable.collection);

  // show/hide filmstrip & timeline when entering the view
  if(layout == DT_LIGHTTABLE_LAYOUT_CULLING || layout == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC || lib->preview_state)
  {
    dt_lib_set_visible(darktable.view_manager->proxy.timeline.module, FALSE); // not available in this layouts
    dt_lib_set_visible(darktable.view_manager->proxy.filmstrip.module,
                       TRUE); // always on, visibility is driven by panel state

    if(lib->preview_state)
      dt_culling_update_active_images_list(lib->preview);
    else
      dt_culling_update_active_images_list(lib->culling);
  }
  else
  {
    dt_lib_set_visible(darktable.view_manager->proxy.filmstrip.module, FALSE); // not available in this layouts
    dt_lib_set_visible(darktable.view_manager->proxy.timeline.module,
                       TRUE); // always on, visibility is driven by panel state
  }

  // restore panels
  dt_ui_restore_panels(darktable.gui->ui);
}

static void _preview_enter(dt_view_t *self, gboolean sticky, gboolean focus, int32_t mouse_over_id)
{
  dt_library_t *lib = (dt_library_t *)self->data;

  // record current offset
  lib->thumbtable_offset = dt_thumbtable_get_offset(dt_ui_thumbtable(darktable.gui->ui));
  // ensure that thumbtable or culling is not visible in the main view
  gtk_widget_hide(dt_ui_thumbtable(darktable.gui->ui)->widget);
  gtk_widget_hide(lib->culling->widget);

  lib->preview_sticky = sticky;
  lib->preview->focus = focus;
  lib->preview_state = TRUE;
  dt_culling_init(lib->preview, -1);
  gtk_widget_show(lib->preview->widget);

  dt_ui_thumbtable(darktable.gui->ui)->navigate_inside_selection = lib->preview->navigate_inside_selection;

  // show/hide filmstrip & timeline when entering the view
  dt_thumbtable_set_parent(dt_ui_thumbtable(darktable.gui->ui), dt_ui_center_base(darktable.gui->ui),
                           DT_THUMBTABLE_MODE_NONE);
  dt_lib_set_visible(darktable.view_manager->proxy.timeline.module, FALSE); // not available in this layouts
  dt_lib_set_visible(darktable.view_manager->proxy.filmstrip.module,
                     TRUE); // always on, visibility is driven by panel state
  dt_thumbtable_set_offset_image(dt_ui_thumbtable(darktable.gui->ui), lib->preview->offset_imgid, TRUE);

  // set the active image
  g_slist_free(darktable.view_manager->active_images);
  darktable.view_manager->active_images = g_slist_prepend(NULL, GINT_TO_POINTER(lib->preview->offset_imgid));
  DT_DEBUG_CONTROL_SIGNAL_RAISE(darktable.signals, DT_SIGNAL_ACTIVE_IMAGES_CHANGE);

  // restore panels
  dt_ui_restore_panels(darktable.gui->ui);

  // we don't need the scrollbars
  dt_ui_scrollbars_show(darktable.gui->ui, FALSE);
}

static void _preview_set_state(dt_view_t *self, gboolean state, gboolean focus)
{
  if(state)
    _preview_enter(self, TRUE, focus, dt_control_get_mouse_over_id());
  else
    _preview_quit(self);
}

void init(dt_view_t *self)
{
  self->data = calloc(1, sizeof(dt_library_t));

  darktable.view_manager->proxy.lighttable.get_preview_state = _preview_get_state;
  darktable.view_manager->proxy.lighttable.set_preview_state = _preview_set_state;
  darktable.view_manager->proxy.lighttable.view = self;
  darktable.view_manager->proxy.lighttable.change_offset = _lighttable_change_offset;
  darktable.view_manager->proxy.lighttable.culling_init_mode = _culling_reinit;
  darktable.view_manager->proxy.lighttable.culling_preview_refresh = _culling_preview_refresh;
  darktable.view_manager->proxy.lighttable.culling_preview_reload_overlays = _culling_preview_reload_overlays;

  // ensure the memory table is up to date
  dt_collection_memory_update();

#ifdef USE_LUA
  lua_State *L = darktable.lua_state.state;
  const int my_type = dt_lua_module_entry_get_type(L, "view", self->module_name);

  lua_pushlightuserdata(L, self);
  lua_pushcclosure(L, set_image_visible_cb, 1);
  dt_lua_gtk_wrap(L);
  lua_pushcclosure(L, dt_lua_type_member_common, 1);
  dt_lua_type_register_const_type(L, my_type, "set_image_visible");

  lua_pushlightuserdata(L, self);
  lua_pushcclosure(L, is_image_visible_cb, 1);
  dt_lua_gtk_wrap(L);
  lua_pushcclosure(L, dt_lua_type_member_common, 1);
  dt_lua_type_register_const_type(L, my_type, "is_image_visible");
#endif
}

void leave(dt_view_t *self)
{
  dt_library_t *lib = (dt_library_t *)self->data;

  // ensure we have no active image remaining
  if(darktable.view_manager->active_images)
  {
    g_slist_free(darktable.view_manager->active_images);
    darktable.view_manager->active_images = NULL;
    DT_DEBUG_CONTROL_SIGNAL_RAISE(darktable.signals, DT_SIGNAL_ACTIVE_IMAGES_CHANGE);
  }

  // we hide culling and preview too
  gtk_widget_hide(lib->culling->widget);
  gtk_widget_hide(lib->preview->widget);

  // exit preview mode if non-sticky
  if(lib->preview_state && lib->preview_sticky == 0)
  {
    _preview_quit(self);
  }

  // we remove the thumbtable from main view
  dt_thumbtable_set_parent(dt_ui_thumbtable(darktable.gui->ui), NULL, DT_THUMBTABLE_MODE_NONE);

  dt_ui_scrollbars_show(darktable.gui->ui, FALSE);
}

void reset(dt_view_t *self)
{
  dt_control_set_mouse_over_id(-1);
}


void scrollbar_changed(dt_view_t *self, double x, double y)
{
  const dt_lighttable_layout_t layout = dt_view_lighttable_get_layout(darktable.view_manager);

  switch(layout)
  {
    case DT_LIGHTTABLE_LAYOUT_FILEMANAGER:
    case DT_LIGHTTABLE_LAYOUT_ZOOMABLE:
    {
      dt_thumbtable_scrollbar_changed(dt_ui_thumbtable(darktable.gui->ui), x, y);
      break;
    }
    default:
      break;
  }
}

enum
{
  DT_ACTION_ELEMENT_FOCUS_DETECT = 1,
};

static float _action_process_preview(gpointer target, dt_action_element_t element, dt_action_effect_t effect, float move_size)
{
  dt_view_t *self = darktable.view_manager->proxy.lighttable.view;
  dt_library_t *lib = (dt_library_t *)self->data;

  if(!isnan(move_size))
  {
    if(lib->preview_state)
    {
      if(effect != DT_ACTION_EFFECT_ON)
        _preview_quit(self);
    }
    else
    {
      if(effect != DT_ACTION_EFFECT_OFF)
      {
        const int32_t mouse_over_id = dt_control_get_mouse_over_id();
        if(mouse_over_id != -1)
        {
          gboolean focus = element == DT_ACTION_ELEMENT_FOCUS_DETECT;

          _preview_enter(self, FALSE, focus, mouse_over_id);
        }
      }
    }
  }

  return lib->preview_state;
}

const dt_action_element_def_t _action_elements_preview[]
  = { { "normal", dt_action_effect_hold },
      { "focus detection", dt_action_effect_hold },
      { NULL } };

const dt_action_def_t dt_action_def_preview
  = { N_("preview"),
      _action_process_preview,
      _action_elements_preview,
      NULL, TRUE };

enum
{
  DT_ACTION_ELEMENT_MOVE = 0,
  DT_ACTION_ELEMENT_SELECT = 1,
};

enum
{
  _ACTION_TABLE_MOVE_STARTEND = 0,
  _ACTION_TABLE_MOVE_LEFTRIGHT = 1,
  _ACTION_TABLE_MOVE_UPDOWN = 2,
  _ACTION_TABLE_MOVE_PAGE = 3,
};

static float _action_process_move(gpointer target, dt_action_element_t element, dt_action_effect_t effect, float move_size)
{
  if(isnan(move_size)) return 0; // FIXME return should be relative position

  int action = GPOINTER_TO_INT(target);

  dt_library_t *lib = (dt_library_t *)darktable.view_manager->proxy.lighttable.view->data;
  const dt_lighttable_layout_t layout = dt_view_lighttable_get_layout(darktable.view_manager);

  // navigation accels for thumbtable layouts
  // this can't be "normal" key accels because it's usually arrow keys and lot of other widgets
  // will capture them before the usual accel is triggered
  if(!lib->preview_state && (layout == DT_LIGHTTABLE_LAYOUT_FILEMANAGER || layout == DT_LIGHTTABLE_LAYOUT_ZOOMABLE))
  {
    dt_thumbtable_move_t move = DT_THUMBTABLE_MOVE_NONE;
    gboolean select = element == DT_ACTION_ELEMENT_SELECT;
    if(action == _ACTION_TABLE_MOVE_LEFTRIGHT && effect == DT_ACTION_EFFECT_PREVIOUS)
      move = DT_THUMBTABLE_MOVE_LEFT;
    else if(action == _ACTION_TABLE_MOVE_UPDOWN && effect == DT_ACTION_EFFECT_NEXT)
      move = DT_THUMBTABLE_MOVE_UP;
    else if(action == _ACTION_TABLE_MOVE_LEFTRIGHT && effect == DT_ACTION_EFFECT_NEXT)
      move = DT_THUMBTABLE_MOVE_RIGHT;
    else if(action == _ACTION_TABLE_MOVE_UPDOWN && effect == DT_ACTION_EFFECT_PREVIOUS)
      move = DT_THUMBTABLE_MOVE_DOWN;
    else if(action == _ACTION_TABLE_MOVE_PAGE && effect == DT_ACTION_EFFECT_NEXT)
      move = DT_THUMBTABLE_MOVE_PAGEUP;
    else if(action == _ACTION_TABLE_MOVE_PAGE && effect == DT_ACTION_EFFECT_PREVIOUS)
      move = DT_THUMBTABLE_MOVE_PAGEDOWN;
    else if(action == _ACTION_TABLE_MOVE_STARTEND && effect == DT_ACTION_EFFECT_PREVIOUS)
      move = DT_THUMBTABLE_MOVE_START;
    else if(action == _ACTION_TABLE_MOVE_STARTEND && effect == DT_ACTION_EFFECT_NEXT)
      move = DT_THUMBTABLE_MOVE_END;
    else
    {
      // MIDDLE
    }

    if(move != DT_THUMBTABLE_MOVE_NONE)
    {
      // for this layout navigation keys are managed directly by thumbtable
      dt_thumbtable_key_move(dt_ui_thumbtable(darktable.gui->ui), move, select);
      gtk_widget_queue_draw(dt_ui_center(darktable.gui->ui));
    }
  }
  else if(lib->preview_state || layout == DT_LIGHTTABLE_LAYOUT_CULLING
          || layout == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
  {
    dt_culling_move_t move = DT_CULLING_MOVE_NONE;
    if(action == _ACTION_TABLE_MOVE_LEFTRIGHT && effect == DT_ACTION_EFFECT_PREVIOUS)
      move = DT_CULLING_MOVE_LEFT;
    else if(action == _ACTION_TABLE_MOVE_UPDOWN && effect == DT_ACTION_EFFECT_NEXT)
      move = DT_CULLING_MOVE_UP;
    else if(action == _ACTION_TABLE_MOVE_LEFTRIGHT && effect == DT_ACTION_EFFECT_NEXT)
      move = DT_CULLING_MOVE_RIGHT;
    else if(action == _ACTION_TABLE_MOVE_UPDOWN && effect == DT_ACTION_EFFECT_PREVIOUS)
      move = DT_CULLING_MOVE_DOWN;
    else if(action == _ACTION_TABLE_MOVE_PAGE && effect == DT_ACTION_EFFECT_NEXT)
      move = DT_CULLING_MOVE_PAGEUP;
    else if(action == _ACTION_TABLE_MOVE_PAGE && effect == DT_ACTION_EFFECT_PREVIOUS)
      move = DT_CULLING_MOVE_PAGEDOWN;
    else if(action == _ACTION_TABLE_MOVE_STARTEND && effect == DT_ACTION_EFFECT_PREVIOUS)
      move = DT_CULLING_MOVE_START;
    else if(action == _ACTION_TABLE_MOVE_STARTEND && effect == DT_ACTION_EFFECT_NEXT)
      move = DT_CULLING_MOVE_END;

    if(move != DT_CULLING_MOVE_NONE)
    {
      // for this layout navigation keys are managed directly by thumbtable
      if(lib->preview_state)
        dt_culling_key_move(lib->preview, move);
      else
        dt_culling_key_move(lib->culling, move);
      gtk_widget_queue_draw(dt_ui_center(darktable.gui->ui));
    }
  }

  return 0; // FIXME return should be relative position
}

const gchar *_action_effect_move[]
  = { N_("middle"),
      N_("next"),
      N_("previous"),
      NULL };

const dt_action_element_def_t _action_elements_move[]
  = { { N_("move"  ), _action_effect_move },
      { N_("select"), _action_effect_move },
      { NULL } };

static const dt_shortcut_fallback_t _action_fallbacks_move[]
  = { { .mods = GDK_SHIFT_MASK, .element = DT_ACTION_ELEMENT_SELECT },
      { } };

const dt_action_def_t _action_def_move
  = { N_("move"),
      _action_process_move,
      _action_elements_move,
      _action_fallbacks_move,
      TRUE };

static gboolean zoom_in_callback(GtkAccelGroup *accel_group, GObject *acceleratable, guint keyval,
                                           GdkModifierType modifier, gpointer data)
{
  int zoom = dt_view_lighttable_get_zoom(darktable.view_manager);

  zoom--;
  if(zoom < 1) zoom = 1;

  dt_view_lighttable_set_zoom(darktable.view_manager, zoom);
  return TRUE;
}

static gboolean zoom_out_callback(GtkAccelGroup *accel_group, GObject *acceleratable, guint keyval,
                                           GdkModifierType modifier, gpointer data)
{
  int zoom = dt_view_lighttable_get_zoom(darktable.view_manager);

  zoom++;
  if(zoom > 2 * DT_LIGHTTABLE_MAX_ZOOM) zoom = 2 * DT_LIGHTTABLE_MAX_ZOOM;

  dt_view_lighttable_set_zoom(darktable.view_manager, zoom);
  return TRUE;
}

static gboolean zoom_max_callback(GtkAccelGroup *accel_group, GObject *acceleratable, guint keyval,
                                           GdkModifierType modifier, gpointer data)
{
  dt_view_lighttable_set_zoom(darktable.view_manager, 1);
  return TRUE;
}

static gboolean zoom_min_callback(GtkAccelGroup *accel_group, GObject *acceleratable, guint keyval,
                                           GdkModifierType modifier, gpointer data)
{
  dt_view_lighttable_set_zoom(darktable.view_manager, DT_LIGHTTABLE_MAX_ZOOM);
  return TRUE;
}

void init_key_accels(dt_view_t *self)
{
  dt_accel_register_view(self, NC_("accel", "align images to grid"), 0, 0);
  dt_accel_register_view(self, NC_("accel", "reset first image offset"), 0, 0);
  dt_accel_register_view(self, NC_("accel", "select toggle image"), GDK_KEY_space, 0);
  dt_accel_register_view(self, NC_("accel", "select single image"), GDK_KEY_Return, 0);

  // undo/redo
  dt_accel_register_view(self, NC_("accel", "undo"), GDK_KEY_z, GDK_CONTROL_MASK);
  dt_accel_register_view(self, NC_("accel", "redo"), GDK_KEY_y, GDK_CONTROL_MASK);

  // zoom for full culling & preview
  dt_accel_register_view(self, NC_("accel", "preview zoom 100%"), 0, 0);
  dt_accel_register_view(self, NC_("accel", "preview zoom fit"), 0, 0);

  // zoom in/out/min/max
  dt_accel_register_view(self, NC_("accel", "zoom in"), GDK_KEY_plus, GDK_CONTROL_MASK);
  dt_accel_register_view(self, NC_("accel", "zoom max"), GDK_KEY_plus, GDK_MOD1_MASK);
  dt_accel_register_view(self, NC_("accel", "zoom out"), GDK_KEY_minus, GDK_CONTROL_MASK);
  dt_accel_register_view(self, NC_("accel", "zoom min"), GDK_KEY_minus, GDK_MOD1_MASK);
}

static gboolean _lighttable_undo_callback(GtkAccelGroup *accel_group, GObject *acceleratable, guint keyval,
                                          GdkModifierType modifier, gpointer data)
{
  dt_undo_do_undo(darktable.undo, DT_UNDO_LIGHTTABLE);
  return TRUE;
}

static gboolean _lighttable_redo_callback(GtkAccelGroup *accel_group, GObject *acceleratable, guint keyval,
                                          GdkModifierType modifier, gpointer data)
{
  dt_undo_do_redo(darktable.undo, DT_UNDO_LIGHTTABLE);
  return TRUE;
}

static gboolean _accel_align_to_grid(GtkAccelGroup *accel_group, GObject *acceleratable, guint keyval,
                                     GdkModifierType modifier, gpointer data)
{
  const dt_lighttable_layout_t layout = dt_view_lighttable_get_layout(darktable.view_manager);

  if(layout == DT_LIGHTTABLE_LAYOUT_ZOOMABLE)
  {
    return dt_thumbtable_key_move(dt_ui_thumbtable(darktable.gui->ui), DT_THUMBTABLE_MOVE_ALIGN, FALSE);
  }
  return FALSE;
}
static gboolean _accel_reset_first_offset(GtkAccelGroup *accel_group, GObject *acceleratable, guint keyval,
                                          GdkModifierType modifier, gpointer data)
{
  const dt_lighttable_layout_t layout = dt_view_lighttable_get_layout(darktable.view_manager);

  if(layout == DT_LIGHTTABLE_LAYOUT_FILEMANAGER || layout == DT_LIGHTTABLE_LAYOUT_ZOOMABLE)
  {
    return dt_thumbtable_reset_first_offset(dt_ui_thumbtable(darktable.gui->ui));
  }
  return FALSE;
}

static gboolean _accel_culling_zoom_100(GtkAccelGroup *accel_group, GObject *acceleratable, guint keyval,
                                        GdkModifierType modifier, gpointer data)
{
  dt_view_t *self = darktable.view_manager->proxy.lighttable.view;
  dt_library_t *lib = (dt_library_t *)self->data;

  if(lib->preview_state)
    dt_culling_zoom_max(lib->preview);
  else if(dt_view_lighttable_get_layout(darktable.view_manager) == DT_LIGHTTABLE_LAYOUT_CULLING
          || dt_view_lighttable_get_layout(darktable.view_manager) == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
    dt_culling_zoom_max(lib->culling);
  else
    return FALSE;

  return TRUE;
}

static gboolean _accel_culling_zoom_fit(GtkAccelGroup *accel_group, GObject *acceleratable, guint keyval,
                                        GdkModifierType modifier, gpointer data)
{
  dt_view_t *self = darktable.view_manager->proxy.lighttable.view;
  dt_library_t *lib = (dt_library_t *)self->data;

  if(lib->preview_state)
    dt_culling_zoom_fit(lib->preview);
  else if(dt_view_lighttable_get_layout(darktable.view_manager) == DT_LIGHTTABLE_LAYOUT_CULLING
          || dt_view_lighttable_get_layout(darktable.view_manager) == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
    dt_culling_zoom_fit(lib->culling);
  else
    return FALSE;

  return TRUE;
}

static gboolean _accel_select_toggle(GtkAccelGroup *accel_group, GObject *acceleratable, guint keyval,
                                     GdkModifierType modifier, gpointer data)
{
  const int32_t id = dt_control_get_mouse_over_id();
  dt_selection_toggle(darktable.selection, id);
  return TRUE;
}

static gboolean _accel_select_single(GtkAccelGroup *accel_group, GObject *acceleratable, guint keyval,
                                     GdkModifierType modifier, gpointer data)
{
  const int32_t id = dt_control_get_mouse_over_id();
  dt_selection_select_single(darktable.selection, id);
  return TRUE;
}

void connect_key_accels(dt_view_t *self)
{
  GClosure *closure;

  // Navigation keys
  closure = g_cclosure_new(G_CALLBACK(_accel_select_toggle), (gpointer)self, NULL);
  dt_accel_connect_view(self, "select toggle image", closure);
  closure = g_cclosure_new(G_CALLBACK(_accel_select_single), (gpointer)self, NULL);
  dt_accel_connect_view(self, "select single image", closure);
  closure = g_cclosure_new(G_CALLBACK(_accel_align_to_grid), (gpointer)self, NULL);
  dt_accel_connect_view(self, "align images to grid", closure);
  closure = g_cclosure_new(G_CALLBACK(_accel_reset_first_offset), (gpointer)self, NULL);
  dt_accel_connect_view(self, "reset first image offset", closure);

  // undo/redo
  closure = g_cclosure_new(G_CALLBACK(_lighttable_undo_callback), (gpointer)self, NULL);
  dt_accel_connect_view(self, "undo", closure);
  closure = g_cclosure_new(G_CALLBACK(_lighttable_redo_callback), (gpointer)self, NULL);
  dt_accel_connect_view(self, "redo", closure);

  // culling & preview zoom
  closure = g_cclosure_new(G_CALLBACK(_accel_culling_zoom_100), (gpointer)self, NULL);
  dt_accel_connect_view(self, "preview zoom 100%", closure);
  closure = g_cclosure_new(G_CALLBACK(_accel_culling_zoom_fit), (gpointer)self, NULL);
  dt_accel_connect_view(self, "preview zoom fit", closure);

  // zoom in/out/min/max
  closure = g_cclosure_new(G_CALLBACK(zoom_in_callback), (gpointer)self, NULL);
  dt_accel_connect_view(self, "zoom in", closure);
  closure = g_cclosure_new(G_CALLBACK(zoom_out_callback), (gpointer)self, NULL);
  dt_accel_connect_view(self, "zoom out", closure);
  closure = g_cclosure_new(G_CALLBACK(zoom_min_callback), (gpointer)self, NULL);
  dt_accel_connect_view(self, "zoom min", closure);
  closure = g_cclosure_new(G_CALLBACK(zoom_max_callback), (gpointer)self, NULL);
  dt_accel_connect_view(self, "zoom max", closure);
}

GSList *mouse_actions(const dt_view_t *self)
{
  dt_library_t *lib = (dt_library_t *)self->data;
  GSList *lm = NULL;

  lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_DOUBLE_LEFT, 0, _("open image in darkroom"));

  if(lib->preview_state)
  {
    lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_SCROLL, 0, _("switch to next/previous image"));
    lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_SCROLL, GDK_CONTROL_MASK, _("zoom in the image"));
    /* xgettext:no-c-format */
    lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_MIDDLE, 0, _("zoom to 100% and back"));
  }
  else if(lib->current_layout == DT_LIGHTTABLE_LAYOUT_FILEMANAGER)
  {
    lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_SCROLL, 0, _("scroll the collection"));
    lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_SCROLL, GDK_CONTROL_MASK,
                                       _("change number of images per row"));

    if(darktable.collection->params.sort == DT_COLLECTION_SORT_CUSTOM_ORDER)
    {
      lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_DRAG_DROP, GDK_BUTTON1_MASK, _("change image order"));
    }
  }
  else if(lib->current_layout == DT_LIGHTTABLE_LAYOUT_CULLING
          || lib->current_layout == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
  {
    lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_SCROLL, 0, _("scroll the collection"));
    lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_SCROLL, GDK_CONTROL_MASK, _("zoom all the images"));
    lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_LEFT_DRAG, 0, _("pan inside all the images"));
    lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_SCROLL, GDK_CONTROL_MASK | GDK_SHIFT_MASK,
                                       _("zoom current image"));
    lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_LEFT_DRAG, GDK_SHIFT_MASK, _("pan inside current image"));
    /* xgettext:no-c-format */
    lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_MIDDLE, 0, _("zoom to 100% and back"));
    lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_MIDDLE, GDK_SHIFT_MASK,
                                       /* xgettext:no-c-format */
                                       _("zoom current image to 100% and back"));
  }
  else if(lib->current_layout == DT_LIGHTTABLE_LAYOUT_ZOOMABLE)
  {
    lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_SCROLL, 0, _("zoom the main view"));
    lm = dt_mouse_action_create_simple(lm, DT_MOUSE_ACTION_LEFT_DRAG, 0, _("pan inside the main view"));
  }

  return lm;
}

static void _profile_display_intent_callback(GtkWidget *combo, gpointer user_data)
{
  const int pos = dt_bauhaus_combobox_get(combo);

  dt_iop_color_intent_t new_intent = darktable.color_profiles->display_intent;

  // we are not using the int value directly so it's robust against changes on lcms' side
  switch(pos)
  {
    case 0:
      new_intent = DT_INTENT_PERCEPTUAL;
      break;
    case 1:
      new_intent = DT_INTENT_RELATIVE_COLORIMETRIC;
      break;
    case 2:
      new_intent = DT_INTENT_SATURATION;
      break;
    case 3:
      new_intent = DT_INTENT_ABSOLUTE_COLORIMETRIC;
      break;
  }

  if(new_intent != darktable.color_profiles->display_intent)
  {
    darktable.color_profiles->display_intent = new_intent;
    pthread_rwlock_rdlock(&darktable.color_profiles->xprofile_lock);
    dt_colorspaces_update_display_transforms();
    pthread_rwlock_unlock(&darktable.color_profiles->xprofile_lock);
    dt_control_queue_redraw_center();
  }
}

static void _profile_display2_intent_callback(GtkWidget *combo, gpointer user_data)
{
  const int pos = dt_bauhaus_combobox_get(combo);

  dt_iop_color_intent_t new_intent = darktable.color_profiles->display2_intent;

  // we are not using the int value directly so it's robust against changes on lcms' side
  switch(pos)
  {
    case 0:
      new_intent = DT_INTENT_PERCEPTUAL;
      break;
    case 1:
      new_intent = DT_INTENT_RELATIVE_COLORIMETRIC;
      break;
    case 2:
      new_intent = DT_INTENT_SATURATION;
      break;
    case 3:
      new_intent = DT_INTENT_ABSOLUTE_COLORIMETRIC;
      break;
  }

  if(new_intent != darktable.color_profiles->display2_intent)
  {
    darktable.color_profiles->display2_intent = new_intent;
    pthread_rwlock_rdlock(&darktable.color_profiles->xprofile_lock);
    dt_colorspaces_update_display2_transforms();
    pthread_rwlock_unlock(&darktable.color_profiles->xprofile_lock);
    dt_control_queue_redraw_center();
  }
}

static void _profile_display_profile_callback(GtkWidget *combo, gpointer user_data)
{
  gboolean profile_changed = FALSE;
  const int pos = dt_bauhaus_combobox_get(combo);
  for(GList *profiles = darktable.color_profiles->profiles; profiles; profiles = g_list_next(profiles))
  {
    dt_colorspaces_color_profile_t *pp = (dt_colorspaces_color_profile_t *)profiles->data;
    if(pp->display_pos == pos)
    {
      if(darktable.color_profiles->display_type != pp->type
        || (darktable.color_profiles->display_type == DT_COLORSPACE_FILE
        && strcmp(darktable.color_profiles->display_filename, pp->filename)))
      {
        darktable.color_profiles->display_type = pp->type;
        g_strlcpy(darktable.color_profiles->display_filename, pp->filename,
                  sizeof(darktable.color_profiles->display_filename));
        profile_changed = TRUE;
      }
      goto end;
    }
  }

  // profile not found, fall back to system display profile. shouldn't happen
  fprintf(stderr, "can't find display profile `%s', using system display profile instead\n", dt_bauhaus_combobox_get_text(combo));
  profile_changed = darktable.color_profiles->display_type != DT_COLORSPACE_DISPLAY;
  darktable.color_profiles->display_type = DT_COLORSPACE_DISPLAY;
  darktable.color_profiles->display_filename[0] = '\0';

end:
  if(profile_changed)
  {
    pthread_rwlock_rdlock(&darktable.color_profiles->xprofile_lock);
    dt_colorspaces_update_display_transforms();
    pthread_rwlock_unlock(&darktable.color_profiles->xprofile_lock);
    DT_DEBUG_CONTROL_SIGNAL_RAISE(darktable.signals, DT_SIGNAL_CONTROL_PROFILE_USER_CHANGED,
                            DT_COLORSPACES_PROFILE_TYPE_DISPLAY);
    dt_control_queue_redraw_center();
  }
}

static void _profile_display2_profile_callback(GtkWidget *combo, gpointer user_data)
{
  gboolean profile_changed = FALSE;
  const int pos = dt_bauhaus_combobox_get(combo);
  for(GList *profiles = darktable.color_profiles->profiles; profiles; profiles = g_list_next(profiles))
  {
    dt_colorspaces_color_profile_t *pp = (dt_colorspaces_color_profile_t *)profiles->data;
    if(pp->display2_pos == pos)
    {
      if(darktable.color_profiles->display2_type != pp->type
         || (darktable.color_profiles->display2_type == DT_COLORSPACE_FILE
             && strcmp(darktable.color_profiles->display2_filename, pp->filename)))
      {
        darktable.color_profiles->display2_type = pp->type;
        g_strlcpy(darktable.color_profiles->display2_filename, pp->filename,
                  sizeof(darktable.color_profiles->display2_filename));
        profile_changed = TRUE;
      }
      goto end;
    }
  }

  // profile not found, fall back to system display2 profile. shouldn't happen
  fprintf(stderr, "can't find preview display profile `%s', using system display profile instead\n",
          dt_bauhaus_combobox_get_text(combo));
  profile_changed = darktable.color_profiles->display2_type != DT_COLORSPACE_DISPLAY2;
  darktable.color_profiles->display2_type = DT_COLORSPACE_DISPLAY2;
  darktable.color_profiles->display2_filename[0] = '\0';

end:
  if(profile_changed)
  {
    pthread_rwlock_rdlock(&darktable.color_profiles->xprofile_lock);
    dt_colorspaces_update_display2_transforms();
    pthread_rwlock_unlock(&darktable.color_profiles->xprofile_lock);
    DT_DEBUG_CONTROL_SIGNAL_RAISE(darktable.signals, DT_SIGNAL_CONTROL_PROFILE_USER_CHANGED,
                            DT_COLORSPACES_PROFILE_TYPE_DISPLAY2);
    dt_control_queue_redraw_center();
  }
}

static void _profile_update_display_cmb(GtkWidget *cmb_display_profile)
{
  for(const GList *l = darktable.color_profiles->profiles; l; l = g_list_next(l))
  {
    dt_colorspaces_color_profile_t *prof = (dt_colorspaces_color_profile_t *)l->data;
    if(prof->display_pos > -1)
    {
      if(prof->type == darktable.color_profiles->display_type
         && (prof->type != DT_COLORSPACE_FILE
             || !strcmp(prof->filename, darktable.color_profiles->display_filename)))
      {
        if(dt_bauhaus_combobox_get(cmb_display_profile) != prof->display_pos)
        {
          dt_bauhaus_combobox_set(cmb_display_profile, prof->display_pos);
          break;
        }
      }
    }
  }
}

static void _profile_update_display2_cmb(GtkWidget *cmb_display_profile)
{
  for(const GList *l = darktable.color_profiles->profiles; l; l = g_list_next(l))
  {
    dt_colorspaces_color_profile_t *prof = (dt_colorspaces_color_profile_t *)l->data;
    if(prof->display2_pos > -1)
    {
      if(prof->type == darktable.color_profiles->display2_type
         && (prof->type != DT_COLORSPACE_FILE
             || !strcmp(prof->filename, darktable.color_profiles->display2_filename)))
      {
        if(dt_bauhaus_combobox_get(cmb_display_profile) != prof->display2_pos)
        {
          dt_bauhaus_combobox_set(cmb_display_profile, prof->display2_pos);
          break;
        }
      }
    }
  }
}

static void _profile_display_changed(gpointer instance, uint8_t profile_type, gpointer user_data)
{
  GtkWidget *cmb_display_profile = GTK_WIDGET(user_data);

  _profile_update_display_cmb(cmb_display_profile);
}

static void _profile_display2_changed(gpointer instance, uint8_t profile_type, gpointer user_data)
{
  GtkWidget *cmb_display_profile = GTK_WIDGET(user_data);

  _profile_update_display2_cmb(cmb_display_profile);
}

void gui_init(dt_view_t *self)
{
  dt_library_t *lib = (dt_library_t *)self->data;

  lib->culling = dt_culling_new(DT_CULLING_MODE_CULLING);
  lib->preview = dt_culling_new(DT_CULLING_MODE_PREVIEW);

  // add culling and preview to the center widget
  gtk_overlay_add_overlay(GTK_OVERLAY(dt_ui_center_base(darktable.gui->ui)), lib->culling->widget);
  gtk_overlay_add_overlay(GTK_OVERLAY(dt_ui_center_base(darktable.gui->ui)), lib->preview->widget);
  gtk_overlay_reorder_overlay(GTK_OVERLAY(dt_ui_center_base(darktable.gui->ui)),
                              gtk_widget_get_parent(dt_ui_log_msg(darktable.gui->ui)), -1);
  gtk_overlay_reorder_overlay(GTK_OVERLAY(dt_ui_center_base(darktable.gui->ui)),
                              gtk_widget_get_parent(dt_ui_toast_msg(darktable.gui->ui)), -1);

  /* add the global focus peaking button in toolbox */
  dt_view_manager_module_toolbox_add(darktable.view_manager, darktable.gui->focus_peaking_button,
                                     DT_VIEW_LIGHTTABLE | DT_VIEW_DARKROOM);

  // create display profile button
  GtkWidget *const profile_button = dtgtk_button_new(dtgtk_cairo_paint_display, CPF_STYLE_FLAT, NULL);
  gtk_widget_set_tooltip_text(profile_button, _("set display profile"));
  dt_view_manager_module_toolbox_add(darktable.view_manager, profile_button, DT_VIEW_LIGHTTABLE);

  // and the popup window
  lib->profile_floating_window = gtk_popover_new(profile_button);

  gtk_widget_set_size_request(GTK_WIDGET(lib->profile_floating_window), 550, -1);
  g_object_set(G_OBJECT(lib->profile_floating_window), "transitions-enabled", FALSE, NULL);
  g_signal_connect_swapped(G_OBJECT(profile_button), "button-press-event", G_CALLBACK(gtk_widget_show_all), lib->profile_floating_window);

  GtkWidget *vbox = gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);

  gtk_container_add(GTK_CONTAINER(lib->profile_floating_window), vbox);

  /** let's fill the encapsulating widgets */
  char datadir[PATH_MAX] = { 0 };
  char confdir[PATH_MAX] = { 0 };
  dt_loc_get_user_config_dir(confdir, sizeof(confdir));
  dt_loc_get_datadir(datadir, sizeof(datadir));

  GtkWidget *display_intent = dt_bauhaus_combobox_new(NULL);
  dt_bauhaus_widget_set_label(display_intent, NULL, N_("intent"));
  dt_bauhaus_combobox_add(display_intent, _("perceptual"));
  dt_bauhaus_combobox_add(display_intent, _("relative colorimetric"));
  dt_bauhaus_combobox_add(display_intent, C_("rendering intent", "saturation"));
  dt_bauhaus_combobox_add(display_intent, _("absolute colorimetric"));

  GtkWidget *display2_intent = dt_bauhaus_combobox_new(NULL);
  dt_bauhaus_widget_set_label(display2_intent, NULL, N_("intent"));
  dt_bauhaus_combobox_add(display2_intent, _("perceptual"));
  dt_bauhaus_combobox_add(display2_intent, _("relative colorimetric"));
  dt_bauhaus_combobox_add(display2_intent, C_("rendering intent", "saturation"));
  dt_bauhaus_combobox_add(display2_intent, _("absolute colorimetric"));

  GtkWidget *display_profile = dt_bauhaus_combobox_new(NULL);
  dt_bauhaus_widget_set_label(display_profile, NULL, N_("display profile"));

  GtkWidget *display2_profile = dt_bauhaus_combobox_new(NULL);
  dt_bauhaus_widget_set_label(display2_profile, NULL, N_("preview display profile"));

  // pack entries
  gtk_box_pack_start(GTK_BOX(vbox), display_profile, TRUE, TRUE, 0);
  gtk_box_pack_start(GTK_BOX(vbox), display_intent, TRUE, TRUE, 0);
  gtk_box_pack_start(GTK_BOX(vbox), gtk_separator_new(GTK_ORIENTATION_HORIZONTAL), TRUE, TRUE, 0);
  gtk_box_pack_start(GTK_BOX(vbox), display2_profile, TRUE, TRUE, 0);
  gtk_box_pack_start(GTK_BOX(vbox), display2_intent, TRUE, TRUE, 0);

  for(GList *profiles = darktable.color_profiles->profiles; profiles; profiles = g_list_next(profiles))
  {
    dt_colorspaces_color_profile_t *prof = (dt_colorspaces_color_profile_t *)profiles->data;
    if(prof->display_pos > -1)
    {
      dt_bauhaus_combobox_add(display_profile, prof->name);
      if(prof->type == darktable.color_profiles->display_type
        && (prof->type != DT_COLORSPACE_FILE
        || !strcmp(prof->filename, darktable.color_profiles->display_filename)))
      {
        dt_bauhaus_combobox_set(display_profile, prof->display_pos);
      }
    }
    if(prof->display2_pos > -1)
    {
      dt_bauhaus_combobox_add(display2_profile, prof->name);
      if(prof->type == darktable.color_profiles->display2_type
         && (prof->type != DT_COLORSPACE_FILE
             || !strcmp(prof->filename, darktable.color_profiles->display2_filename)))
      {
        dt_bauhaus_combobox_set(display2_profile, prof->display2_pos);
      }
    }
  }

  char *system_profile_dir = g_build_filename(datadir, "color", "out", NULL);
  char *user_profile_dir = g_build_filename(confdir, "color", "out", NULL);
  char *tooltip = g_strdup_printf(_("display ICC profiles in %s or %s"), user_profile_dir, system_profile_dir);
  gtk_widget_set_tooltip_text(display_profile, tooltip);
  g_free(tooltip);
  tooltip = g_strdup_printf(_("preview display ICC profiles in %s or %s"), user_profile_dir, system_profile_dir);
  gtk_widget_set_tooltip_text(display2_profile, tooltip);
  g_free(tooltip);
  g_free(system_profile_dir);
  g_free(user_profile_dir);

  g_signal_connect(G_OBJECT(display_intent), "value-changed", G_CALLBACK(_profile_display_intent_callback), NULL);
  g_signal_connect(G_OBJECT(display_profile), "value-changed", G_CALLBACK(_profile_display_profile_callback), NULL);

  g_signal_connect(G_OBJECT(display2_intent), "value-changed", G_CALLBACK(_profile_display2_intent_callback), NULL);
  g_signal_connect(G_OBJECT(display2_profile), "value-changed", G_CALLBACK(_profile_display2_profile_callback),
                   NULL);

  // update the gui when profiles change
  DT_DEBUG_CONTROL_SIGNAL_CONNECT(darktable.signals, DT_SIGNAL_CONTROL_PROFILE_USER_CHANGED,
                            G_CALLBACK(_profile_display_changed), (gpointer)display_profile);
  DT_DEBUG_CONTROL_SIGNAL_CONNECT(darktable.signals, DT_SIGNAL_CONTROL_PROFILE_USER_CHANGED,
                            G_CALLBACK(_profile_display2_changed), (gpointer)display2_profile);

  dt_action_t *sa = &self->actions, *ac = NULL;

  ac = dt_action_define(sa, N_("move"), N_("whole"), GINT_TO_POINTER(_ACTION_TABLE_MOVE_STARTEND), &_action_def_move);
  dt_accel_register_shortcut(ac, NULL, DT_ACTION_ELEMENT_MOVE, DT_ACTION_EFFECT_PREVIOUS, GDK_KEY_Home, 0);
  dt_accel_register_shortcut(ac, NULL, DT_ACTION_ELEMENT_MOVE, DT_ACTION_EFFECT_NEXT    , GDK_KEY_End, 0);

  ac = dt_action_define(sa, N_("move"), N_("horizontal"), GINT_TO_POINTER(_ACTION_TABLE_MOVE_LEFTRIGHT), &_action_def_move);
  dt_accel_register_shortcut(ac, NULL, DT_ACTION_ELEMENT_MOVE, DT_ACTION_EFFECT_PREVIOUS, GDK_KEY_Left, 0);
  dt_accel_register_shortcut(ac, NULL, DT_ACTION_ELEMENT_MOVE, DT_ACTION_EFFECT_NEXT    , GDK_KEY_Right, 0);

  ac = dt_action_define(sa, N_("move"), N_("vertical"), GINT_TO_POINTER(_ACTION_TABLE_MOVE_UPDOWN), &_action_def_move);
  dt_accel_register_shortcut(ac, NULL, DT_ACTION_ELEMENT_MOVE, DT_ACTION_EFFECT_PREVIOUS, GDK_KEY_Down, 0);
  dt_accel_register_shortcut(ac, NULL, DT_ACTION_ELEMENT_MOVE, DT_ACTION_EFFECT_NEXT    , GDK_KEY_Up, 0);

  ac = dt_action_define(sa, N_("move"), N_("page"), GINT_TO_POINTER(_ACTION_TABLE_MOVE_PAGE), &_action_def_move);
  dt_accel_register_shortcut(ac, NULL, DT_ACTION_ELEMENT_MOVE, DT_ACTION_EFFECT_PREVIOUS, GDK_KEY_Page_Down, 0);
  dt_accel_register_shortcut(ac, NULL, DT_ACTION_ELEMENT_MOVE, DT_ACTION_EFFECT_NEXT    , GDK_KEY_Page_Up, 0);

  // Preview key
  dt_accel_register_shortcut(sa, NC_("accel", "preview"), DT_ACTION_ELEMENT_DEFAULT, DT_ACTION_EFFECT_HOLD, GDK_KEY_w, 0);
  dt_accel_register_shortcut(sa, NC_("accel", "preview"), DT_ACTION_ELEMENT_FOCUS_DETECT, DT_ACTION_EFFECT_HOLD, GDK_KEY_w, GDK_CONTROL_MASK);
  dt_action_define(sa, NULL, "preview", NULL, &dt_action_def_preview);
}

// modelines: These editor modelines have been set for all relevant files by tools/update_modelines.sh
// vim: shiftwidth=2 expandtab tabstop=2 cindent
// kate: tab-indents: off; indent-width 2; replace-tabs on; indent-mode cstyle; remove-trailing-spaces modified;
