/*
    This file is part of darktable,
    Copyright (C) 2011-2021 darktable developers.

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

#include <gdk/gdkkeysyms.h>

#include "common/collection.h"
#include "common/debug.h"
#include "common/selection.h"
#include "control/conf.h"
#include "control/control.h"
#include "dtgtk/thumbtable.h"
#include "gui/accelerators.h"
#include "gui/gtk.h"
#include "libs/lib.h"
#include "libs/lib_api.h"

DT_MODULE(1)

typedef struct dt_lib_tool_lighttable_t
{
  GtkWidget *zoom;
  GtkWidget *zoom_entry;
  GtkWidget *layout_box;
  GtkWidget *layout_filemanager;
  GtkWidget *layout_zoomable;
  GtkWidget *layout_culling_dynamic;
  GtkWidget *layout_culling_fix;
  GtkWidget *layout_preview;
  dt_lighttable_layout_t layout, base_layout;
  int current_zoom;
  gboolean fullpreview;
  gboolean fullpreview_focus;
  gboolean combo_evt_reset;
} dt_lib_tool_lighttable_t;

/* set zoom proxy function */
static void _lib_lighttable_set_zoom(dt_lib_module_t *self, gint zoom);
static gint _lib_lighttable_get_zoom(dt_lib_module_t *self);

/* get/set layout proxy function */
static dt_lighttable_layout_t _lib_lighttable_get_layout(dt_lib_module_t *self);

/* zoom slider change callback */
static void _lib_lighttable_zoom_slider_changed(GtkRange *range, gpointer user_data);
/* zoom entry change callback */
static gboolean _lib_lighttable_zoom_entry_changed(GtkWidget *entry, GdkEventKey *event,
                                                   dt_lib_module_t *self);

static void _set_zoom(dt_lib_module_t *self, int zoom);

const char *name(dt_lib_module_t *self)
{
  return _("lighttable");
}

const char **views(dt_lib_module_t *self)
{
  static const char *v[] = {"lighttable", NULL};
  return v;
}

uint32_t container(dt_lib_module_t *self)
{
  return DT_UI_CONTAINER_PANEL_CENTER_BOTTOM_CENTER;
}

int expandable(dt_lib_module_t *self)
{
  return 0;
}

int position()
{
  return 1001;
}

static void _lib_lighttable_update_btn(dt_lib_module_t *self)
{
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)self->data;

  // which btn should be active ?
  GtkWidget *active = d->layout_filemanager;
  if(d->fullpreview)
    active = d->layout_preview;
  else if(d->layout == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
    active = d->layout_culling_dynamic;
  else if(d->layout == DT_LIGHTTABLE_LAYOUT_CULLING)
    active = d->layout_culling_fix;
  else if(d->layout == DT_LIGHTTABLE_LAYOUT_ZOOMABLE)
    active = d->layout_zoomable;

  GList *children = gtk_container_get_children(GTK_CONTAINER(d->layout_box));
  for(const GList *l = children; l; l = g_list_next(l))
  {
    GtkWidget *w = (GtkWidget *)l->data;
    gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(w), (w == active));
  }
  g_list_free(children);

  // and now we set the tooltips
  if(d->fullpreview)
    gtk_widget_set_tooltip_text(d->layout_preview, _("click to exit from full preview layout."));
  else
    gtk_widget_set_tooltip_text(d->layout_preview, _("click to enter full preview layout."));

  if(d->layout != DT_LIGHTTABLE_LAYOUT_CULLING || d->fullpreview)
    gtk_widget_set_tooltip_text(d->layout_culling_fix, _("click to enter culling layout in fixed mode."));
  else
    gtk_widget_set_tooltip_text(d->layout_culling_fix, _("click to exit culling layout."));

  if(d->layout != DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC || d->fullpreview)
    gtk_widget_set_tooltip_text(d->layout_culling_dynamic, _("click to enter culling layout in dynamic mode."));
  else
    gtk_widget_set_tooltip_text(d->layout_culling_dynamic, _("click to exit culling layout."));
}

static void _lib_lighttable_set_layout(dt_lib_module_t *self, dt_lighttable_layout_t layout)
{
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)self->data;

  // we deal with fullpreview first.
  if(!d->fullpreview && layout == DT_LIGHTTABLE_LAYOUT_PREVIEW)
  {
    // special case for preview : we don't change previous values, just show full preview
    d->fullpreview = TRUE;
    _lib_lighttable_update_btn(self);
    dt_view_lighttable_set_preview_state(darktable.view_manager, TRUE, d->fullpreview_focus);
    return;
  }
  else if(d->fullpreview && layout != DT_LIGHTTABLE_LAYOUT_PREVIEW)
  {
    d->fullpreview = FALSE;
    dt_view_lighttable_set_preview_state(darktable.view_manager, FALSE, FALSE);
    // and we continue to select the right layout...
  }

  const int current_layout = dt_conf_get_int("plugins/lighttable/layout");
  d->layout = layout;

  if(current_layout != layout)
  {
    if(d->layout == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
    {
      d->current_zoom = MAX(1, MIN(30, dt_collection_get_selected_count(darktable.collection)));
      if(d->current_zoom == 1) d->current_zoom = dt_conf_get_int("plugins/lighttable/culling_num_images");
    }
    else if(d->layout == DT_LIGHTTABLE_LAYOUT_CULLING)
    {
      d->current_zoom = dt_conf_get_int("plugins/lighttable/culling_num_images");
    }
    else
    {
      d->current_zoom = dt_conf_get_int("plugins/lighttable/images_in_row");
    }

    gtk_widget_set_sensitive(d->zoom_entry, (d->layout != DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC && !d->fullpreview));
    gtk_widget_set_sensitive(d->zoom, (d->layout != DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC && !d->fullpreview));
    gtk_range_set_value(GTK_RANGE(d->zoom), d->current_zoom);

    dt_conf_set_int("plugins/lighttable/layout", layout);
    if(layout == DT_LIGHTTABLE_LAYOUT_FILEMANAGER || layout == DT_LIGHTTABLE_LAYOUT_ZOOMABLE)
    {
      d->base_layout = layout;
      dt_conf_set_int("plugins/lighttable/base_layout", layout);
    }

    dt_control_queue_redraw_center();
  }
  else
  {
    dt_control_queue_redraw_center();
  }

  _lib_lighttable_update_btn(self);
}

static gboolean _lib_lighttable_layout_btn_release(GtkWidget *w, GdkEventButton *event, dt_lib_module_t *self)
{
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)self->data;
  if(d->combo_evt_reset) return FALSE;

  const gboolean active
      = gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(w)); // note : this is the state before the change
  dt_lighttable_layout_t new_layout = DT_LIGHTTABLE_LAYOUT_FILEMANAGER;
  if(!active)
  {
    // that means we want to activate the button
    if(w == d->layout_preview)
    {
      d->fullpreview_focus = dt_modifier_is(event->state, GDK_CONTROL_MASK);
      new_layout = DT_LIGHTTABLE_LAYOUT_PREVIEW;
    }
    else if(w == d->layout_culling_fix)
      new_layout = DT_LIGHTTABLE_LAYOUT_CULLING;
    else if(w == d->layout_culling_dynamic)
      new_layout = DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC;
    else if(w == d->layout_zoomable)
      new_layout = DT_LIGHTTABLE_LAYOUT_ZOOMABLE;
  }
  else
  {
    // that means we want to deactivate the button
    if(w == d->layout_preview)
      new_layout = d->layout;
    else if(w == d->layout_culling_dynamic || w == d->layout_culling_fix)
      new_layout = d->base_layout;
    else
    {
      // we can't exit from filemanager or zoomable
      return TRUE;
    }
  }

  _lib_lighttable_set_layout(self, new_layout);
  return TRUE;
}

void gui_init(dt_lib_module_t *self)
{
  /* initialize ui widgets */
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)g_malloc0(sizeof(dt_lib_tool_lighttable_t));
  self->data = (void *)d;

  self->widget = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
  d->layout = MIN(DT_LIGHTTABLE_LAYOUT_LAST - 1, dt_conf_get_int("plugins/lighttable/layout"));
  d->base_layout = MIN(DT_LIGHTTABLE_LAYOUT_LAST - 1, dt_conf_get_int("plugins/lighttable/base_layout"));

  if(d->layout == DT_LIGHTTABLE_LAYOUT_CULLING)
    d->current_zoom = dt_conf_get_int("plugins/lighttable/culling_num_images");
  else if(d->layout == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
  {
    d->current_zoom = MAX(1, MIN(DT_LIGHTTABLE_MAX_ZOOM, dt_collection_get_selected_count(darktable.collection)));
    if(d->current_zoom == 1) d->current_zoom = dt_conf_get_int("plugins/lighttable/culling_num_images");
  }
  else
    d->current_zoom = dt_conf_get_int("plugins/lighttable/images_in_row");

  // create the layouts icon list
  d->layout_box = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
  gtk_widget_set_name(d->layout_box, "lighttable_layouts_box");
  gtk_box_pack_start(GTK_BOX(self->widget), d->layout_box, TRUE, TRUE, 0);

  d->layout_filemanager = dtgtk_togglebutton_new(dtgtk_cairo_paint_lt_mode_grid, CPF_STYLE_FLAT, NULL);
  dt_action_define(&darktable.view_manager->proxy.lighttable.view->actions, NULL,
                   "toggle filemanager layout", d->layout_filemanager, NULL);
  dt_gui_add_help_link(d->layout_filemanager, dt_get_help_url("layout_filemanager"));
  gtk_widget_set_tooltip_text(d->layout_filemanager, _("click to enter filemanager layout."));
  g_signal_connect(G_OBJECT(d->layout_filemanager), "button-release-event",
                   G_CALLBACK(_lib_lighttable_layout_btn_release), self);
  gtk_box_pack_start(GTK_BOX(d->layout_box), d->layout_filemanager, TRUE, TRUE, 0);

  d->layout_zoomable = dtgtk_togglebutton_new(dtgtk_cairo_paint_lt_mode_zoom, CPF_STYLE_FLAT, NULL);
  dt_action_define(&darktable.view_manager->proxy.lighttable.view->actions, NULL,
                   "toggle zoomable lighttable layout", d->layout_zoomable, NULL);
  dt_gui_add_help_link(d->layout_zoomable, dt_get_help_url("layout_zoomable"));
  gtk_widget_set_tooltip_text(d->layout_zoomable, _("click to enter zoomable lighttable layout."));
  g_signal_connect(G_OBJECT(d->layout_zoomable), "button-release-event",
                   G_CALLBACK(_lib_lighttable_layout_btn_release), self);
  gtk_box_pack_start(GTK_BOX(d->layout_box), d->layout_zoomable, TRUE, TRUE, 0);

  d->layout_culling_fix = dtgtk_togglebutton_new(dtgtk_cairo_paint_lt_mode_culling_fixed, CPF_STYLE_FLAT, NULL);
  dt_action_define(&darktable.view_manager->proxy.lighttable.view->actions, NULL,
                   "toggle culling mode", d->layout_culling_fix, NULL);
  dt_gui_add_help_link(d->layout_culling_fix, dt_get_help_url("layout_culling"));
  g_signal_connect(G_OBJECT(d->layout_culling_fix), "button-release-event",
                   G_CALLBACK(_lib_lighttable_layout_btn_release), self);
  gtk_box_pack_start(GTK_BOX(d->layout_box), d->layout_culling_fix, TRUE, TRUE, 0);

  d->layout_culling_dynamic
      = dtgtk_togglebutton_new(dtgtk_cairo_paint_lt_mode_culling_dynamic, CPF_STYLE_FLAT, NULL);
  dt_action_define(&darktable.view_manager->proxy.lighttable.view->actions, NULL,
                   "toggle culling dynamic mode", d->layout_culling_dynamic, NULL);
  dt_gui_add_help_link(d->layout_culling_dynamic, dt_get_help_url("layout_culling"));
  g_signal_connect(G_OBJECT(d->layout_culling_dynamic), "button-release-event",
                   G_CALLBACK(_lib_lighttable_layout_btn_release), self);
  gtk_box_pack_start(GTK_BOX(d->layout_box), d->layout_culling_dynamic, TRUE, TRUE, 0);

  d->layout_preview = dtgtk_togglebutton_new(dtgtk_cairo_paint_lt_mode_fullpreview, CPF_STYLE_FLAT, NULL);
  dt_action_define(&darktable.view_manager->proxy.lighttable.view->actions, NULL,
                   "toggle sticky preview mode", d->layout_preview, NULL);
  dt_gui_add_help_link(d->layout_preview, dt_get_help_url("layout_preview"));
  g_signal_connect(G_OBJECT(d->layout_preview), "button-release-event",
                   G_CALLBACK(_lib_lighttable_layout_btn_release), self);
  gtk_box_pack_start(GTK_BOX(d->layout_box), d->layout_preview, TRUE, TRUE, 0);

  _lib_lighttable_update_btn(self);

  /* create horizontal zoom slider */
  d->zoom = gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 1, DT_LIGHTTABLE_MAX_ZOOM, 1);
  gtk_widget_set_size_request(GTK_WIDGET(d->zoom), DT_PIXEL_APPLY_DPI(140), -1);
  gtk_scale_set_draw_value(GTK_SCALE(d->zoom), FALSE);
  gtk_range_set_increments(GTK_RANGE(d->zoom), 1, 1);
  gtk_box_pack_start(GTK_BOX(self->widget), d->zoom, TRUE, TRUE, 0);

  /* manual entry of the zoom level */
  d->zoom_entry = gtk_entry_new();
  gtk_entry_set_alignment(GTK_ENTRY(d->zoom_entry), 1.0);
  gtk_entry_set_max_length(GTK_ENTRY(d->zoom_entry), 2);
  gtk_entry_set_width_chars(GTK_ENTRY(d->zoom_entry), 3);
  gtk_entry_set_max_width_chars(GTK_ENTRY(d->zoom_entry), 3);
  gtk_box_pack_start(GTK_BOX(self->widget), d->zoom_entry, TRUE, TRUE, 0);

  g_signal_connect(G_OBJECT(d->zoom), "value-changed", G_CALLBACK(_lib_lighttable_zoom_slider_changed),
                   (gpointer)self);
  g_signal_connect(d->zoom_entry, "key-press-event", G_CALLBACK(_lib_lighttable_zoom_entry_changed), self);
  gtk_range_set_value(GTK_RANGE(d->zoom), d->current_zoom);

  _lib_lighttable_zoom_slider_changed(GTK_RANGE(d->zoom), self); // the slider defaults to 1 and GTK doesn't
                                                                 // fire a value-changed signal when setting
                                                                 // it to 1 => empty text box

  gtk_widget_set_sensitive(d->zoom_entry, (d->layout != DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC && !d->fullpreview));
  gtk_widget_set_sensitive(d->zoom, (d->layout != DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC && !d->fullpreview));

  darktable.view_manager->proxy.lighttable.module = self;
  darktable.view_manager->proxy.lighttable.set_zoom = _lib_lighttable_set_zoom;
  darktable.view_manager->proxy.lighttable.get_zoom = _lib_lighttable_get_zoom;
  darktable.view_manager->proxy.lighttable.get_layout = _lib_lighttable_get_layout;
  darktable.view_manager->proxy.lighttable.set_layout = _lib_lighttable_set_layout;
}

void gui_cleanup(dt_lib_module_t *self)
{
  g_free(self->data);
  self->data = NULL;
}

static void _set_zoom(dt_lib_module_t *self, int zoom)
{
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)self->data;
  if(d->layout == DT_LIGHTTABLE_LAYOUT_CULLING)
  {
    dt_conf_set_int("plugins/lighttable/culling_num_images", zoom);
    dt_control_queue_redraw_center();
  }
  else if(d->layout == DT_LIGHTTABLE_LAYOUT_FILEMANAGER || d->layout == DT_LIGHTTABLE_LAYOUT_ZOOMABLE)
  {
    dt_conf_set_int("plugins/lighttable/images_in_row", zoom);
    dt_thumbtable_zoom_changed(dt_ui_thumbtable(darktable.gui->ui), d->current_zoom, zoom);
  }
}

static void _lib_lighttable_zoom_slider_changed(GtkRange *range, gpointer user_data)
{
  dt_lib_module_t *self = (dt_lib_module_t *)user_data;
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)self->data;

  const int i = gtk_range_get_value(range);
  gchar *i_as_str = g_strdup_printf("%d", i);
  gtk_entry_set_text(GTK_ENTRY(d->zoom_entry), i_as_str);
  _set_zoom(self, i);
  d->current_zoom = i;
  g_free(i_as_str);
}

static gboolean _lib_lighttable_zoom_entry_changed(GtkWidget *entry, GdkEventKey *event, dt_lib_module_t *self)
{
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)self->data;
  switch(event->keyval)
  {
    case GDK_KEY_Escape:
    case GDK_KEY_Tab:
    {
      // reset
      int i = 0;
      if(d->layout == DT_LIGHTTABLE_LAYOUT_CULLING || d->layout == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
        i = dt_conf_get_int("plugins/lighttable/culling_num_images");
      else
        i = dt_conf_get_int("plugins/lighttable/images_in_row");
      gchar *i_as_str = g_strdup_printf("%d", i);
      gtk_entry_set_text(GTK_ENTRY(d->zoom_entry), i_as_str);
      g_free(i_as_str);
      gtk_window_set_focus(GTK_WINDOW(dt_ui_main_window(darktable.gui->ui)), NULL);
      return FALSE;
    }

    case GDK_KEY_Return:
    case GDK_KEY_KP_Enter:
    {
      // apply zoom level
      const gchar *value = gtk_entry_get_text(GTK_ENTRY(d->zoom_entry));
      int i = atoi(value);
      gtk_range_set_value(GTK_RANGE(d->zoom), i);
      gtk_window_set_focus(GTK_WINDOW(dt_ui_main_window(darktable.gui->ui)), NULL);
      return FALSE;
    }

    // allow 0 .. 9, left/right movement using arrow keys and del/backspace
    case GDK_KEY_0:
    case GDK_KEY_KP_0:
    case GDK_KEY_1:
    case GDK_KEY_KP_1:
    case GDK_KEY_2:
    case GDK_KEY_KP_2:
    case GDK_KEY_3:
    case GDK_KEY_KP_3:
    case GDK_KEY_4:
    case GDK_KEY_KP_4:
    case GDK_KEY_5:
    case GDK_KEY_KP_5:
    case GDK_KEY_6:
    case GDK_KEY_KP_6:
    case GDK_KEY_7:
    case GDK_KEY_KP_7:
    case GDK_KEY_8:
    case GDK_KEY_KP_8:
    case GDK_KEY_9:
    case GDK_KEY_KP_9:

    case GDK_KEY_Left:
    case GDK_KEY_Right:
    case GDK_KEY_Delete:
    case GDK_KEY_BackSpace:
      return FALSE;

    default: // block everything else
      return TRUE;
  }
}

static dt_lighttable_layout_t _lib_lighttable_get_layout(dt_lib_module_t *self)
{
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)self->data;
  return d->layout;
}

static void _lib_lighttable_set_zoom(dt_lib_module_t *self, gint zoom)
{
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)self->data;
  gtk_range_set_value(GTK_RANGE(d->zoom), zoom);
  d->current_zoom = zoom;
}

static gint _lib_lighttable_get_zoom(dt_lib_module_t *self)
{
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)self->data;
  return d->current_zoom;
}

static gboolean _lib_lighttable_key_accel_toggle_filemanager(GtkAccelGroup *accel_group, GObject *acceleratable,
                                                             guint keyval, GdkModifierType modifier, gpointer data)
{
  dt_lib_module_t *self = (dt_lib_module_t *)data;
  _lib_lighttable_set_layout(self, DT_LIGHTTABLE_LAYOUT_FILEMANAGER);
  return TRUE;
}

static gboolean _lib_lighttable_key_accel_toggle_zoomable(GtkAccelGroup *accel_group, GObject *acceleratable,
                                                          guint keyval, GdkModifierType modifier, gpointer data)
{
  dt_lib_module_t *self = (dt_lib_module_t *)data;
  _lib_lighttable_set_layout(self, DT_LIGHTTABLE_LAYOUT_ZOOMABLE);
  return TRUE;
}

static gboolean _lib_lighttable_key_accel_toggle_preview(GtkAccelGroup *accel_group, GObject *acceleratable,
                                                         guint keyval, GdkModifierType modifier, gpointer data)
{
  dt_lib_module_t *self = (dt_lib_module_t *)data;
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)self->data;

  if(d->fullpreview)
    _lib_lighttable_set_layout(self, d->layout);
  else
  {
    d->fullpreview_focus = FALSE;
    _lib_lighttable_set_layout(self, DT_LIGHTTABLE_LAYOUT_PREVIEW);
  }

  return TRUE;
}

static gboolean _lib_lighttable_key_accel_toggle_preview_focus(GtkAccelGroup *accel_group, GObject *acceleratable,
                                                               guint keyval, GdkModifierType modifier,
                                                               gpointer data)
{
  dt_lib_module_t *self = (dt_lib_module_t *)data;
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)self->data;

  if(d->fullpreview)
    _lib_lighttable_set_layout(self, d->layout);
  else
  {
    d->fullpreview_focus = TRUE;
    _lib_lighttable_set_layout(self, DT_LIGHTTABLE_LAYOUT_PREVIEW);
  }

  return TRUE;
}

static gboolean _lib_lighttable_key_accel_toggle_culling_dynamic_mode(GtkAccelGroup *accel_group,
                                                                      GObject *acceleratable, guint keyval,
                                                                      GdkModifierType modifier, gpointer data)
{
  dt_lib_module_t *self = (dt_lib_module_t *)data;
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)self->data;

  // if we are already in any culling layout, we return to the base layout
  if(d->layout != DT_LIGHTTABLE_LAYOUT_CULLING && d->layout != DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
    _lib_lighttable_set_layout(self, DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC);
  else
    _lib_lighttable_set_layout(self, d->base_layout);

  dt_control_queue_redraw_center();
  return TRUE;
}

static gboolean _lib_lighttable_key_accel_toggle_culling_mode(GtkAccelGroup *accel_group, GObject *acceleratable,
                                                              guint keyval, GdkModifierType modifier,
                                                              gpointer data)
{
  dt_lib_module_t *self = (dt_lib_module_t *)data;
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)self->data;

  // if we are already in any culling layout, we return to the base layout
  if(d->layout != DT_LIGHTTABLE_LAYOUT_CULLING && d->layout != DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
    _lib_lighttable_set_layout(self, DT_LIGHTTABLE_LAYOUT_CULLING);
  else
    _lib_lighttable_set_layout(self, d->base_layout);

  dt_control_queue_redraw_center();
  return TRUE;
}

static gboolean _lib_lighttable_key_accel_toggle_culling_zoom_mode(GtkAccelGroup *accel_group,
                                                                   GObject *acceleratable, guint keyval,
                                                                   GdkModifierType modifier, gpointer data)
{
  dt_lib_module_t *self = (dt_lib_module_t *)data;
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)self->data;

  if(d->layout == DT_LIGHTTABLE_LAYOUT_CULLING)
    _lib_lighttable_set_layout(self, DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC);
  else if(d->layout == DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC)
    _lib_lighttable_set_layout(self, DT_LIGHTTABLE_LAYOUT_CULLING);

  return TRUE;
}

static gboolean _lib_lighttable_key_accel_exit_layout(GtkAccelGroup *accel_group, GObject *acceleratable,
                                                      guint keyval, GdkModifierType modifier, gpointer data)
{
  dt_lib_module_t *self = (dt_lib_module_t *)data;
  dt_lib_tool_lighttable_t *d = (dt_lib_tool_lighttable_t *)self->data;

  if(d->fullpreview)
    _lib_lighttable_set_layout(self, d->layout);
  else if(d->layout != d->base_layout)
    _lib_lighttable_set_layout(self, d->base_layout);

  return TRUE;
}

void init_key_accels(dt_lib_module_t *self)
{
  // view accels
  dt_accel_register_lib_as_view("lighttable", NC_("accel", "toggle filemanager layout"), 0, 0);
  dt_accel_register_lib_as_view("lighttable", NC_("accel", "toggle zoomable lighttable layout"), 0, 0);
  dt_accel_register_lib_as_view("lighttable", NC_("accel", "toggle culling mode"), GDK_KEY_x, 0);
  dt_accel_register_lib_as_view("lighttable", NC_("accel", "toggle culling dynamic mode"), GDK_KEY_x,
                                GDK_CONTROL_MASK);
  dt_accel_register_lib_as_view("lighttable", NC_("accel", "toggle culling zoom mode"), GDK_KEY_less, 0);
  dt_accel_register_lib_as_view("lighttable", NC_("accel", "toggle sticky preview mode"), GDK_KEY_f, 0);
  dt_accel_register_lib_as_view("lighttable", NC_("accel", "toggle sticky preview mode with focus detection"), 0,
                                0);
  dt_accel_register_lib_as_view("lighttable", NC_("accel", "exit current layout"), GDK_KEY_Escape, 0);
}

void connect_key_accels(dt_lib_module_t *self)
{
  /* setup key accelerators */

  // view accels
  dt_accel_connect_lib_as_view(
      self, "lighttable", "toggle filemanager layout",
      g_cclosure_new(G_CALLBACK(_lib_lighttable_key_accel_toggle_filemanager), self, NULL));
  dt_accel_connect_lib_as_view(self, "lighttable", "toggle zoomable lighttable layout",
                               g_cclosure_new(G_CALLBACK(_lib_lighttable_key_accel_toggle_zoomable), self, NULL));
  dt_accel_connect_lib_as_view(
      self, "lighttable", "toggle culling dynamic mode",
      g_cclosure_new(G_CALLBACK(_lib_lighttable_key_accel_toggle_culling_dynamic_mode), self, NULL));
  dt_accel_connect_lib_as_view(
      self, "lighttable", "toggle culling mode",
      g_cclosure_new(G_CALLBACK(_lib_lighttable_key_accel_toggle_culling_mode), self, NULL));
  dt_accel_connect_lib_as_view(
      self, "lighttable", "toggle culling zoom mode",
      g_cclosure_new(G_CALLBACK(_lib_lighttable_key_accel_toggle_culling_zoom_mode), self, NULL));
  dt_accel_connect_lib_as_view(self, "lighttable", "toggle sticky preview mode",
                               g_cclosure_new(G_CALLBACK(_lib_lighttable_key_accel_toggle_preview), self, NULL));
  dt_accel_connect_lib_as_view(
      self, "lighttable", "toggle sticky preview mode with focus detection",
      g_cclosure_new(G_CALLBACK(_lib_lighttable_key_accel_toggle_preview_focus), self, NULL));

  dt_accel_connect_lib_as_view(self, "lighttable", "exit current layout",
                               g_cclosure_new(G_CALLBACK(_lib_lighttable_key_accel_exit_layout), self, NULL));
}

#ifdef USE_LUA
static int layout_cb(lua_State *L)
{
  dt_lib_module_t *self = lua_touserdata(L, lua_upvalueindex(1));
  const dt_lighttable_layout_t tmp = _lib_lighttable_get_layout(self);
  if(lua_gettop(L) > 0){
    dt_lighttable_layout_t value;
    luaA_to(L, dt_lighttable_layout_t, &value, 1);
    _lib_lighttable_set_layout(self, value);
  }
  luaA_push(L, dt_lighttable_layout_t, &tmp);
  return 1;
}
static int zoom_level_cb(lua_State *L)
{
  dt_lib_module_t *self = lua_touserdata(L, lua_upvalueindex(1));
  const gint tmp = _lib_lighttable_get_zoom(self);
  if(lua_gettop(L) > 0){
    int value;
    luaA_to(L, int, &value, 1);
    _lib_lighttable_set_zoom(self, value);
  }
  luaA_push(L, int, &tmp);
  return 1;
}

void init(struct dt_lib_module_t *self)
{
  lua_State *L = darktable.lua_state.state;
  int my_type = dt_lua_module_entry_get_type(L, "lib", self->plugin_name);
  lua_pushlightuserdata(L, self);
  lua_pushcclosure(L, layout_cb, 1);
  dt_lua_gtk_wrap(L);
  lua_pushcclosure(L, dt_lua_type_member_common, 1);
  dt_lua_type_register_const_type(L, my_type, "layout");
  lua_pushlightuserdata(L, self);
  lua_pushcclosure(L, zoom_level_cb, 1);
  dt_lua_gtk_wrap(L);
  lua_pushcclosure(L, dt_lua_type_member_common, 1);
  dt_lua_type_register_const_type(L, my_type, "zoom_level");

  luaA_enum(L,dt_lighttable_layout_t);
  luaA_enum_value(L, dt_lighttable_layout_t, DT_LIGHTTABLE_LAYOUT_FIRST);
  luaA_enum_value(L, dt_lighttable_layout_t, DT_LIGHTTABLE_LAYOUT_ZOOMABLE);
  luaA_enum_value(L, dt_lighttable_layout_t, DT_LIGHTTABLE_LAYOUT_FILEMANAGER);
  luaA_enum_value(L, dt_lighttable_layout_t, DT_LIGHTTABLE_LAYOUT_CULLING);
  luaA_enum_value(L, dt_lighttable_layout_t, DT_LIGHTTABLE_LAYOUT_CULLING_DYNAMIC);
  luaA_enum_value(L, dt_lighttable_layout_t, DT_LIGHTTABLE_LAYOUT_PREVIEW);
  luaA_enum_value(L, dt_lighttable_layout_t, DT_LIGHTTABLE_LAYOUT_LAST);
}
#endif
// modelines: These editor modelines have been set for all relevant files by tools/update_modelines.sh
// vim: shiftwidth=2 expandtab tabstop=2 cindent
// kate: tab-indents: off; indent-width 2; replace-tabs on; indent-mode cstyle; remove-trailing-spaces modified;
