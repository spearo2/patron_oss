/*
   This file is part of cccd - a CDDB capable CD player
   Copyright (c) 1998 by Jochen Stein, jst@writeme.com
   Copyright (c) 1998 by Sven Riedel, Sven.Riedel@heim8.tu-clausthal.de

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

   (See the included file COPYING / GPL-2.0)

   $Id: info.c,v 0.3.3.4 2002/01/06 22:44:52 jst Exp $
 */

#include <ctype.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <gtk/gtk.h>

#include "general.h"
#include "misc.h"
#include "cd.h"
#include "cddb.h"
#include "options.h"
#include "cccd.h"
#include "info.h"

/* global vars */
static struct info_dialog info;
/* XX is pointer to original data, tmp_XX is local working copy */
static struct audio_cd *cd, tmp_cd;
static struct options *opt, tmp_opt;
static int info_changed;

/* code for the info/options dialog */
int info_dialog_init(struct audio_cd *given_cd, struct options *given_opt)
{
  GtkWidget *window, *mainbox, *notebook, *frame, *label, *button;

  if (info.open)		/* only allow one info dialog to be open at a time */
    return -1;
  info_changed = FALSE;

  /* first initialize the global vars */
  opt = given_opt;
  /*save the current cd state for undos */
  cd_clear(&tmp_cd);
  options_clear(&tmp_opt);
  options_copy(&tmp_opt, opt);

  info_dialog_set_cd(given_cd);

  info.selected_track = -1;
  info.open = 1;


  info.colormap = gdk_colormap_new(gdk_visual_get_best(), FALSE);
  info.playcolor = (GdkColor *) malloc(sizeof(GdkColor));
  info.playcolor->red = info.playcolor->blue = info.playcolor->green = 58000;
  gdk_color_alloc(info.colormap, info.playcolor);
  info.notplaycolor = (GdkColor *) malloc(sizeof(GdkColor));
  info.notplaycolor->red = info.notplaycolor->blue =
    info.notplaycolor->green = 35000;
  gdk_color_alloc(info.colormap, info.notplaycolor);

  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_window_set_title(GTK_WINDOW(window), "cccd Infos");
  gtk_signal_connect(GTK_OBJECT(window), "destroy",
		     GTK_SIGNAL_FUNC(info_dialog_destroy), NULL);

  mainbox = gtk_vbox_new(FALSE, 0);
  gtk_container_add(GTK_CONTAINER(window), mainbox);


  notebook = gtk_notebook_new();

  frame = init_cd_page();
  label = gtk_label_new("CD");
  gtk_widget_show(frame);
  gtk_widget_show(label);
  gtk_notebook_append_page(GTK_NOTEBOOK(notebook), frame, label);

  frame = init_cddb_page();
  label = gtk_label_new("Cddb");
  gtk_widget_show(frame);
  gtk_widget_show(label);
  gtk_notebook_append_page(GTK_NOTEBOOK(notebook), frame, label);

  frame = init_about_page();
  label = gtk_label_new("About");
  gtk_widget_show(frame);
  gtk_widget_show(label);
  gtk_notebook_append_page(GTK_NOTEBOOK(notebook), frame, label);

  gtk_box_pack_start(GTK_BOX(mainbox), notebook, TRUE, TRUE, 0);
  gtk_widget_set_usize(notebook, 310, 390);
  gtk_widget_show(notebook);


  button = gtk_button_new_with_label("Close");
  gtk_signal_connect_object(GTK_OBJECT(button), "clicked",
			    GTK_SIGNAL_FUNC(gtk_widget_destroy),
			    GTK_OBJECT(window));
  gtk_box_pack_start(GTK_BOX(mainbox), button, FALSE, TRUE, 0);
  gtk_widget_show(button);

  gtk_widget_show(mainbox);
  gtk_widget_set_usize(window, 320, 400);
  gtk_widget_show(window);

  return 1;
}


GtkWidget *init_cd_page(void)
{
  GtkWidget *frame, *box, *clist, *entry, *button, *hbox;
  gchar *titles[2] =
  {"Track", "Title"};


  frame = gtk_frame_new("");
  box = gtk_vbox_new(FALSE, 0);
  gtk_container_add(GTK_CONTAINER(frame), box);

  entry = gtk_entry_new_with_max_length(80);
  info.title_entry = entry;
  gtk_signal_connect(GTK_OBJECT(entry), "activate",
		     (GtkSignalFunc) title_changed, NULL);
  gtk_box_pack_start(GTK_BOX(box), entry, FALSE, TRUE, 0);
  gtk_widget_show(entry);

  clist = gtk_clist_new_with_titles(2, titles);
  gtk_clist_column_titles_passive(GTK_CLIST(clist));

  info.clist = clist;
  gtk_widget_set_events(clist, gtk_widget_get_events(clist) |
			GDK_BUTTON_PRESS_MASK);
  gtk_signal_connect(GTK_OBJECT(clist), "select_row",
		     (GtkSignalFunc) track_selected, NULL);
  gtk_clist_set_selection_mode(GTK_CLIST(clist), GTK_SELECTION_SINGLE);

  gtk_clist_set_column_width(GTK_CLIST(clist), 0, 40);
  gtk_clist_set_column_justification(GTK_CLIST(clist), 0,
				     GTK_JUSTIFY_CENTER);
  gtk_clist_set_column_width(GTK_CLIST(clist), 1, 250);
  gtk_clist_set_column_justification(GTK_CLIST(clist), 1,
				     GTK_JUSTIFY_LEFT);

  gtk_box_pack_start(GTK_BOX(box), clist, TRUE, TRUE, 0);

  gtk_widget_set_usize(clist, 310, 290);
  gtk_widget_show(clist);

  entry = gtk_entry_new_with_max_length(80);
  info.track_entry = entry;
  gtk_signal_connect(GTK_OBJECT(entry), "activate",
		     (GtkSignalFunc) track_changed, NULL);
  gtk_box_pack_start(GTK_BOX(box), entry, FALSE, TRUE, 0);
  gtk_widget_show(entry);

  hbox = gtk_hbox_new(TRUE, 0);
  gtk_box_pack_start(GTK_BOX(box), hbox, FALSE, TRUE, 0);

  button = gtk_button_new_with_label("Save");
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
		     GTK_SIGNAL_FUNC(cd_save), NULL);
  gtk_box_pack_start(GTK_BOX(hbox), button, TRUE, TRUE, 0);
  gtk_widget_show(button);

  info.send_button = button = gtk_button_new_with_label("Send");
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
		     GTK_SIGNAL_FUNC(cd_send), NULL);
  gtk_box_pack_start(GTK_BOX(hbox), button, TRUE, TRUE, 0);
  gtk_widget_set_sensitive(button, FALSE);
  gtk_widget_show(button);

  button = gtk_button_new_with_label("Undo");
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
		     GTK_SIGNAL_FUNC(cd_undo), NULL);
  gtk_box_pack_start(GTK_BOX(hbox), button, TRUE, TRUE, 0);
  gtk_widget_show(button);
  gtk_widget_show(hbox);

  cd_page_display();

  gtk_widget_show(box);
  return frame;
}


GtkWidget *init_cddb_page(void)
{
  GtkWidget *frame, *box, *section, *section_box, *hbox, *entry, *label,
   *radiobutton, *checkbutton, *button;
  GSList *group;

  frame = gtk_frame_new("");
  box = gtk_vbox_new(FALSE, 0);
  gtk_container_add(GTK_CONTAINER(frame), box);

  /* Remote section */
  section = gtk_frame_new("Remote");
  section_box = gtk_vbox_new(TRUE, 0);
  gtk_container_add(GTK_CONTAINER(section), section_box);

  hbox = gtk_hbox_new(FALSE, 0);
  label = gtk_label_new("Server:");
  gtk_box_pack_start(GTK_BOX(hbox), label, FALSE, TRUE, 5);
  gtk_widget_show(label);
  info.server_entry = entry = gtk_entry_new();
  gtk_signal_connect(GTK_OBJECT(entry), "focus_out_event",
		     (GtkSignalFunc) server_changed, NULL);
  gtk_box_pack_start(GTK_BOX(hbox), entry, TRUE, TRUE, 2);
  gtk_widget_show(entry);
  label = gtk_label_new("Port:");
  gtk_box_pack_start(GTK_BOX(hbox), label, FALSE, TRUE, 5);
  gtk_widget_show(label);
  info.port_entry = entry = gtk_entry_new();
  gtk_signal_connect(GTK_OBJECT(entry), "focus_out_event",
		     (GtkSignalFunc) port_changed, NULL);
  gtk_box_pack_start(GTK_BOX(hbox), entry, TRUE, TRUE, 2);
  /* gtk_widget_set_usize( entry, 100, info.server_entry->allocation.height ); */
  gtk_widget_show(entry);
  gtk_box_pack_start(GTK_BOX(section_box), hbox, TRUE, TRUE, 0);
  gtk_widget_show(hbox);

  hbox = gtk_hbox_new(FALSE, 0);
  label = gtk_label_new("Submit email address:");
  gtk_box_pack_start(GTK_BOX(hbox), label, FALSE, TRUE, 5);
  gtk_widget_show(label);
  info.remote_submit_entry = entry = gtk_entry_new();
  gtk_signal_connect(GTK_OBJECT(entry), "focus_out_event",
		     (GtkSignalFunc) remote_submit_changed, NULL);
  gtk_box_pack_start(GTK_BOX(hbox), entry, TRUE, TRUE, 2);
  gtk_widget_show(entry);
  gtk_box_pack_start(GTK_BOX(section_box), hbox, TRUE, TRUE, 0);
  gtk_widget_show(hbox);

  hbox = gtk_hbox_new(TRUE, 0);
  info.cddbp_radio = radiobutton = gtk_radio_button_new_with_label(NULL,
								   "CDDB");
  gtk_signal_connect(GTK_OBJECT(radiobutton), "toggled",
		     (GtkSignalFunc) protocol_changed, NULL);
  group = gtk_radio_button_group(GTK_RADIO_BUTTON(radiobutton));
  gtk_box_pack_start(GTK_BOX(hbox), radiobutton, FALSE, TRUE, 0);
  gtk_widget_show(radiobutton);
  info.http_radio = radiobutton = gtk_radio_button_new_with_label(group,
								  "HTTP");
  gtk_box_pack_start(GTK_BOX(hbox), radiobutton, FALSE, TRUE, 0);
  gtk_widget_show(radiobutton);
  gtk_box_pack_start(GTK_BOX(section_box), hbox, TRUE, TRUE, 0);
  gtk_widget_show(hbox);

  gtk_widget_show(section_box);
  gtk_box_pack_start(GTK_BOX(box), section, TRUE, TRUE, 0);
  gtk_widget_show(section);

  /* Local section */
  section = gtk_frame_new("Local");
  section_box = gtk_vbox_new(TRUE, 0);
  gtk_container_add(GTK_CONTAINER(section), section_box);

  hbox = gtk_hbox_new(FALSE, 0);
  label = gtk_label_new("Path:");
  gtk_box_pack_start(GTK_BOX(hbox), label, FALSE, TRUE, 5);
  gtk_widget_show(label);
  info.path_entry = entry = gtk_entry_new();
  gtk_signal_connect(GTK_OBJECT(entry), "focus_out_event",
		     (GtkSignalFunc) path_changed, NULL);
  gtk_box_pack_start(GTK_BOX(hbox), entry, TRUE, TRUE, 2);
  gtk_widget_show(entry);
  gtk_box_pack_start(GTK_BOX(section_box), hbox, TRUE, TRUE, 0);
  gtk_widget_show(hbox);

  gtk_widget_show(section_box);
  gtk_box_pack_start(GTK_BOX(box), section, TRUE, TRUE, 0);
  gtk_widget_show(section);

  /* Global Section */
  section = gtk_frame_new("Global");
  section_box = gtk_vbox_new(TRUE, 0);
  gtk_container_add(GTK_CONTAINER(section), section_box);

  hbox = gtk_hbox_new(TRUE, 0);
  label = gtk_label_new("Lookup order");
  gtk_box_pack_start(GTK_BOX(hbox), label, FALSE, TRUE, 0);
  gtk_widget_show(label);
  gtk_box_pack_start(GTK_BOX(section_box), hbox, TRUE, TRUE, 0);
  gtk_widget_show(hbox);

  /* add signal connects to lookup_changed */
  hbox = gtk_hbox_new(FALSE, 0);
  info.lr_radio = radiobutton =
    gtk_radio_button_new_with_label(NULL, "Local, Remote");
  group = gtk_radio_button_group(GTK_RADIO_BUTTON(radiobutton));
  gtk_signal_connect(GTK_OBJECT(radiobutton), "toggled",
		     (GtkSignalFunc) lookup_changed, NULL);
  gtk_box_pack_start(GTK_BOX(hbox), radiobutton, FALSE, TRUE, 0);
  gtk_widget_show(radiobutton);
  info.rl_radio = radiobutton =
    gtk_radio_button_new_with_label(group, "Remote, Local");
  group = gtk_radio_button_group(GTK_RADIO_BUTTON(radiobutton));
  gtk_signal_connect(GTK_OBJECT(radiobutton), "toggled",
		     (GtkSignalFunc) lookup_changed, NULL);
  gtk_box_pack_start(GTK_BOX(hbox), radiobutton, FALSE, TRUE, 0);
  gtk_widget_show(radiobutton);
  info.n_radio = radiobutton =
    gtk_radio_button_new_with_label(group, "None");
  group = gtk_radio_button_group(GTK_RADIO_BUTTON(radiobutton));
  gtk_signal_connect(GTK_OBJECT(radiobutton), "toggled",
		     (GtkSignalFunc) lookup_changed, NULL);
  gtk_box_pack_start(GTK_BOX(hbox), radiobutton, FALSE, TRUE, 0);
  gtk_widget_show(radiobutton);
  gtk_box_pack_start(GTK_BOX(section_box), hbox, TRUE, TRUE, 0);
  gtk_widget_show(hbox);

  hbox = gtk_hbox_new(FALSE, 0);
  info.l_radio = radiobutton =
    gtk_radio_button_new_with_label(group, "Local");
  group = gtk_radio_button_group(GTK_RADIO_BUTTON(radiobutton));
  gtk_signal_connect(GTK_OBJECT(radiobutton), "toggled",
		     (GtkSignalFunc) lookup_changed, NULL);
  gtk_box_pack_start(GTK_BOX(hbox), radiobutton, FALSE, TRUE, 0);
  gtk_widget_show(radiobutton);
  info.r_radio = radiobutton =
    gtk_radio_button_new_with_label(group, "Remote");
  gtk_signal_connect(GTK_OBJECT(radiobutton), "toggled",
		     (GtkSignalFunc) lookup_changed, NULL);
  gtk_box_pack_start(GTK_BOX(hbox), radiobutton, FALSE, TRUE, 0);
  gtk_widget_show(radiobutton);
  gtk_box_pack_start(GTK_BOX(section_box), hbox, TRUE, TRUE, 0);
  gtk_widget_show(hbox);

  hbox = gtk_hbox_new(TRUE, 0);
  info.local_save_button = checkbutton =
    gtk_check_button_new_with_label("Save results of remote lookup?");
  gtk_signal_connect(GTK_OBJECT(checkbutton), "toggled",
		     (GtkSignalFunc) save_changed, NULL);
  gtk_box_pack_start(GTK_BOX(hbox), checkbutton, FALSE, TRUE, 0);
  gtk_widget_show(checkbutton);
  gtk_box_pack_start(GTK_BOX(section_box), hbox, TRUE, TRUE, 0);
  gtk_widget_show(hbox);

  gtk_widget_show(section_box);
  gtk_box_pack_start(GTK_BOX(box), section, TRUE, TRUE, 0);
  gtk_widget_show(section);

  hbox = gtk_hbox_new(TRUE, 0);
  button = gtk_button_new_with_label("Save");
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
		     GTK_SIGNAL_FUNC(cddb_save), NULL);
  gtk_box_pack_start(GTK_BOX(hbox), button, TRUE, TRUE, 0);
  gtk_widget_show(button);
  button = gtk_button_new_with_label("Undo");
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
		     GTK_SIGNAL_FUNC(cddb_undo), NULL);
  gtk_box_pack_start(GTK_BOX(hbox), button, TRUE, TRUE, 0);
  gtk_widget_show(button);
  gtk_box_pack_start(GTK_BOX(box), hbox, FALSE, TRUE, 0);
  gtk_widget_show(hbox);

  /* set the values of the widgets */
  cddb_page_display();

  gtk_widget_show(box);
  return frame;
}

GtkWidget *init_about_page(void)
{
  GtkWidget *frame, *box, *label;
  char versionstring[256];

  frame = gtk_frame_new("");
  box = gtk_vbox_new(TRUE, 0);
  gtk_container_add(GTK_CONTAINER(frame), box);
  sprintf(versionstring,
	  "%s %s\nA CDDB capable CD player\n\n(C) 1998 %s\n%s\n%s",
	  NAME, VERSION, AUTHOR, EMAIL, HOMEPAGE);
  label = gtk_label_new(versionstring);
  gtk_box_pack_start(GTK_BOX(box), label, FALSE, TRUE, 5);
  gtk_widget_show(label);
  gtk_widget_show(box);
  gtk_widget_show(frame);
  return frame;
}

void info_dialog_destroy(GtkWidget * widget, gpointer data)
{
  gtk_widget_hide(widget);
  /* free the color sometime */
  gdk_colormap_unref(info.colormap);
  info.open = 0;
}


void info_dialog_set_cd(struct audio_cd *given_cd)
{
  cd = given_cd;
  audio_cd_copy(&tmp_cd, cd);
}

int info_dialog_open(void)
{
  return info.open;
}

void track_selected(GtkCList * clist, gint row, gint column,
		    GdkEventButton * event)
{
  info.selected_track = row + tmp_cd.first_track;

  if (event != NULL && event->type == GDK_2BUTTON_PRESS) {
    cd->current_track = info.selected_track;
    play_callback(NULL, NULL);
  }
  else {
    /* handle playlist stuff */
    if (!info.enter_pressed) {
      if (tmp_cd.toc[row + tmp_cd.first_track].play)
	gtk_clist_set_background(clist, row, info.notplaycolor);
      else
	gtk_clist_set_background(clist, row, info.playcolor);

      tmp_cd.toc[row + tmp_cd.first_track].play ^= 1;
    }
    info.enter_pressed = 0;
  }

  if (tmp_cd.toc[info.selected_track].title != NULL)
    gtk_entry_set_text(GTK_ENTRY(info.track_entry),
		       (gchar *) (tmp_cd.toc[info.selected_track].title));
  else
    gtk_entry_set_text(GTK_ENTRY(info.track_entry), "");
}


void track_changed(GtkEntry * entry)
{
  int row = info.selected_track - tmp_cd.first_track;
  char *title = tmp_cd.toc[info.selected_track].title, *newtitle;

  newtitle = gtk_entry_get_text(entry);
  info.enter_pressed = 1;
  if (newtitle != NULL && title != NULL) {

    if (strcmp(newtitle, title) == 0) {		/* ignore unneccessary changes */
      /* but still jump to next row */
      gtk_clist_select_row(GTK_CLIST(info.clist), row + 1, 1);
      return;
    }
  }
  if (title != NULL)
    free(title);

  title = (newtitle == NULL) ? strdup("") : strdup(newtitle);

  tmp_cd.toc[info.selected_track].title = title;

  /* after taking the changes, update the clist */
  gtk_clist_set_text(GTK_CLIST(info.clist), row, 1, title);

  /* and jump to next track to make entering cd data easier */
  gtk_clist_select_row(GTK_CLIST(info.clist), row + 1, 1);

  info_changed = TRUE;
}


void title_changed(GtkEntry * entry)
{
  char *newtitle;

  newtitle = gtk_entry_get_text(entry);

  if (tmp_cd.title != NULL && newtitle != NULL)
    if (strcmp(tmp_cd.title, newtitle) == 0)
      return;

  if (tmp_cd.title != NULL)
    free(tmp_cd.title);
  tmp_cd.title = (newtitle == NULL) ? strdup("") : strdup(newtitle);
  info_changed = TRUE;
}


void server_changed(GtkEntry * entry)
{
  char *text;

  if (tmp_opt.server != NULL)
    free(tmp_opt.server);

  text = gtk_entry_get_text(entry);
  if (strcmp(text, "") != 0)
    tmp_opt.server = strdup(text);

}


void port_changed(GtkEntry * entry)
{
  char *text;

  text = gtk_entry_get_text(entry);
  if (strcmp(text, "") != 0) {
    tmp_opt.port = 0;
    while (*text != 0 && isdigit(*text)) {
      tmp_opt.port *= 10;
      tmp_opt.port += *text - 0x30;
      text++;
    }
  }
}

void remote_submit_changed(GtkEntry * entry)
{
  char *text;

  text = gtk_entry_get_text(entry);

  if (strcmp(text, "") != 0) {
    if (tmp_opt.remote_submit != NULL) {
      free(tmp_opt.remote_submit);
    }
    tmp_opt.remote_submit = strdup(text);
  }
}

void path_changed(GtkEntry * entry)
{
  char *text;

  if (tmp_opt.path != NULL)
    free(tmp_opt.path);

  text = gtk_entry_get_text(entry);
  if (strcmp(text, "") != 0)
    tmp_opt.path = strdup(text);
}

void protocol_changed(GtkToggleButton * toggle_button)
{
  if (toggle_button->active) {
    tmp_opt.protocol = CDDBP;
    tmp_opt.port = 888;
    gtk_entry_set_text(GTK_ENTRY(info.port_entry), "888");
  }
  else {
    tmp_opt.protocol = HTTP;
    tmp_opt.port = 80;
    gtk_entry_set_text(GTK_ENTRY(info.port_entry), "80");
  }
}


void lookup_changed(GtkToggleButton * toggle_button)
{
  if (toggle_button == GTK_TOGGLE_BUTTON(info.rl_radio))
    tmp_opt.lookup = REMOTE_LOCAL;
  else if (toggle_button == GTK_TOGGLE_BUTTON(info.lr_radio))
    tmp_opt.lookup = LOCAL_REMOTE;
  else if (toggle_button == GTK_TOGGLE_BUTTON(info.l_radio))
    tmp_opt.lookup = LOCAL;
  else if (toggle_button == GTK_TOGGLE_BUTTON(info.r_radio))
    tmp_opt.lookup = REMOTE;
  else
    tmp_opt.lookup = NONE;
}


void save_changed(GtkToggleButton * toggle_button)
{
  if (toggle_button->active)
    tmp_opt.save = TRUE;
  else
    tmp_opt.save = FALSE;
}


void cd_undo(GtkWidget * widget, gpointer data)
{
  /* undo the changes in the struct */
  audio_cd_copy(&tmp_cd, cd);

  /* and now in the widgets as well */
  cd_page_display();
  info.selected_track = -1;
}


void cd_save(GtkWidget * widget, gpointer data)
{
  audio_cd_copy(cd, &tmp_cd);
  save_cd(cd, opt->path);
}

void save_cd(struct audio_cd *given_cd, const char *path)
{
  int cat_num, i;
  char *buffer = NULL, *final_cat = NULL, *filename, **category;
  FILE *file;

  if (path == NULL || given_cd == NULL)
    return;

  given_cd->revision++;
  cddb_collate_data(given_cd, &buffer);

  /* take the opt info, as this is the last confirmed data entry */
  category = (char **) malloc(1000 * sizeof(char *));
  if ((cat_num = get_subdirs(path, category)) == 0) {
    free(category);
    return;
  }

  i = alternate_list(category, cat_num);
  if (i != cat_num) {		/* user wants to save */
    final_cat = category[i];
    filename = (char *) malloc(strlen(final_cat) + 8 + 2);
    sprintf(filename, "%s/%s", final_cat, given_cd->id);

    file = fopen(filename, "wt");
    if (file == NULL) {
      g_warning("Error opening file %s\n", filename);
      return;
    }
    fputs(buffer, file);
    fflush(file);
    fclose(file);
  }				/* end of saving */
  /* clean up */
  for (i = 0; i < cat_num; i++) {
    free(category[i]);
  }
  free(category);
  free(buffer);

  /* last thing: check to see if the cd may be submitted via email or not */
  /* it is required to have proper title */
  if (given_cd->title == NULL || strlen(given_cd->title) < 1 ||
      info_changed == FALSE)
    return;
  /* it is required to have at least one track name */
  for (i = given_cd->first_track; i < given_cd->last_track + 1; i++) {
    if (given_cd->toc[i].title != NULL && strlen(given_cd->toc[i].title) > 0) {
      gtk_widget_set_sensitive(info.send_button, TRUE);
      return;
    }
  }
  /* if control reaches here, the entry may not be submitted */
  gtk_widget_set_sensitive(info.send_button, FALSE);
}


void cd_send(GtkWidget * widget, gpointer sdata)
{
  int matches, i;
  char *command, *buffer = NULL, *subject = NULL, *final_cat;
  char **category = (char **) malloc(sizeof(char *) * 1000);
  FILE *stream;

/* check is CDDB submit address given */
  if ((opt->remote_submit == NULL) || (strlen(opt->remote_submit) < 1)) {
    g_warning("Please enter CDDB submit address in config, send aborted.");
    return;
  }
/* get the remote databases categories */
  i = cddb_remote_categories(opt->server, opt->port, opt->protocol,
			     category, &matches);
  if (i != REMOTE_OK) {
    g_warning("Cannot determine remote categories, send aborted.");
    return;
  }
  i = alternate_list(category, matches);
  if (i != matches) {		/* user wants to send */
    final_cat = category[i];

    /* don't compute the id again. we compute it once after disk logged in */

    /* prepare the mail */
    cddb_collate_data(cd, &buffer);
    command = strdup(MAILPROG);

    subject = (char *) malloc(strlen(final_cat) + strlen(cd->id) + 20);
    sprintf(subject, " -s\"cddb %s %s\" ", final_cat, cd->id);
    string_append(&command, subject);
    free(subject);

    string_append(&command, opt->remote_submit);
    stream = popen(command, "w");
    fprintf(stream, "%s\r\n", buffer);
    pclose(stream);

    free(buffer);
  }				/* end of sending */
  /* clean up */
  for (i = 0; i < matches; i++) {
    if (category[i] != NULL)
      free(category[i]);
  }
  free(category);

  gtk_widget_set_sensitive(info.send_button, FALSE);
}


void cd_page_display(void)
{
  char *track_string = (char *) malloc(4), *row[2];
  int i, max_track = tmp_cd.last_track - tmp_cd.first_track + 1, track;


  if (tmp_cd.title != NULL) {
    gtk_entry_set_text(GTK_ENTRY(info.title_entry), (gchar *) tmp_cd.title);
    gtk_entry_set_position(GTK_ENTRY(info.title_entry), 0);
  }
  else
    gtk_entry_set_text(GTK_ENTRY(info.title_entry), "");


  row[0] = track_string;
  gtk_clist_clear(GTK_CLIST(info.clist));
  for (i = 0; i < max_track; i++) {
    track = i + tmp_cd.first_track;
    sprintf(row[0], "%02d", track);
    if (tmp_cd.toc[track].title != NULL)
      row[1] = (gchar *) strdup(tmp_cd.toc[track].title);
    else
      row[1] = strdup("");
    gtk_clist_append(GTK_CLIST(info.clist), row);
    free(row[1]);
    if (tmp_cd.toc[track].play)
      gtk_clist_set_background(GTK_CLIST(info.clist), i, info.playcolor);
    else
      gtk_clist_set_background(GTK_CLIST(info.clist), i, info.notplaycolor);
  }

  free(row[0]);

  gtk_entry_set_text(GTK_ENTRY(info.track_entry), "");
}


void cddb_undo(GtkWidget * widget, gpointer data)
{
  options_copy(&tmp_opt, opt);
  cddb_page_display();
}


void cddb_save(GtkWidget * widget, gpointer data)
{
  options_copy(opt, &tmp_opt);
  options_save(opt);
}

void cddb_page_display(void)
{
  char *dud = (char *) malloc(20);

  if (tmp_opt.server != NULL) {
    gtk_entry_set_text(GTK_ENTRY(info.server_entry), tmp_opt.server);
    gtk_entry_set_position(GTK_ENTRY(info.server_entry), 0);
  }
  else
    gtk_entry_set_text(GTK_ENTRY(info.server_entry), "");


  sprintf(dud, "%d", tmp_opt.port);
  gtk_entry_set_text(GTK_ENTRY(info.port_entry), dud);
  gtk_entry_set_position(GTK_ENTRY(info.port_entry), 0);

  if (tmp_opt.remote_submit != NULL) {
    gtk_entry_set_text(GTK_ENTRY(info.remote_submit_entry),
		       tmp_opt.remote_submit);
    gtk_entry_set_position(GTK_ENTRY(info.remote_submit_entry), 0);
  }

  if (tmp_opt.protocol == CDDBP)
    gtk_toggle_button_set_state(GTK_TOGGLE_BUTTON(info.cddbp_radio), TRUE);
  else
    gtk_toggle_button_set_state(GTK_TOGGLE_BUTTON(info.http_radio), TRUE);


  if (tmp_opt.path != NULL) {
    gtk_entry_set_text(GTK_ENTRY(info.path_entry), tmp_opt.path);
    gtk_entry_set_position(GTK_ENTRY(info.path_entry), 0);
  }
  else
    gtk_entry_set_text(GTK_ENTRY(info.path_entry), "");

  if (tmp_opt.save)
    gtk_toggle_button_set_state(GTK_TOGGLE_BUTTON(info.local_save_button),
				TRUE);
  else
    gtk_toggle_button_set_state(GTK_TOGGLE_BUTTON(info.local_save_button),
				FALSE);

  switch (tmp_opt.lookup) {
  case REMOTE_LOCAL:
    gtk_toggle_button_set_state(GTK_TOGGLE_BUTTON(info.rl_radio), TRUE);
    break;
  case LOCAL_REMOTE:
    gtk_toggle_button_set_state(GTK_TOGGLE_BUTTON(info.lr_radio), TRUE);
    break;
  case LOCAL:
    gtk_toggle_button_set_state(GTK_TOGGLE_BUTTON(info.l_radio), TRUE);
    break;
  case REMOTE:
    gtk_toggle_button_set_state(GTK_TOGGLE_BUTTON(info.r_radio), TRUE);
    break;
  default:
    gtk_toggle_button_set_state(GTK_TOGGLE_BUTTON(info.n_radio), TRUE);
    break;
  }

  free(dud);
}

int alternate_selected;		/* the alternative selected by the user */

int alternate_list(char **title, int matches)
/* returns matches, i.e. out of bounds value if no selection made */
{
  int i;
  char *row;
  GtkWidget *window, *box, *clist, *button;

  alternate_selected = matches;
  window = gtk_window_new(GTK_WINDOW_DIALOG);
  gtk_signal_connect(GTK_OBJECT(window), "destroy",
		     GTK_SIGNAL_FUNC(alternate_quit), NULL);
  gtk_window_set_title(GTK_WINDOW(window), "Select Category");
  gtk_widget_set_usize(window, 360, 250);

  box = gtk_vbox_new(FALSE, 0);

  clist = gtk_clist_new(1);
  gtk_signal_connect(GTK_OBJECT(clist), "select_row",
		     (GtkSignalFunc) alternate_select, NULL);
  for (i = 0; i < matches; i++) {
    row = (char *) malloc(strlen(title[i]) + 4);
    sprintf(row, "%d %s", i + 1, title[i]);
    gtk_clist_append(GTK_CLIST(clist), &row);
    free(row);
  }

  gtk_box_pack_start(GTK_BOX(box), clist, TRUE, TRUE, 0);
  gtk_widget_show(clist);

  button = gtk_button_new_with_label("OK");
  gtk_signal_connect_object(GTK_OBJECT(button), "clicked",
			    GTK_SIGNAL_FUNC(gtk_widget_destroy),
			    GTK_OBJECT(window));
  gtk_box_pack_start(GTK_BOX(box), button, FALSE, TRUE, 0);
  gtk_container_add(GTK_CONTAINER(window), box);
  gtk_widget_show(button);

  gtk_widget_show(box);
  gtk_widget_show(window);

  gtk_grab_add(window);
  gtk_main();

  return alternate_selected;
}

void alternate_select(GtkCList * clist, gint row, gint column,
		      GdkEventButton * event)
{
  alternate_selected = (int) row;
}

void alternate_quit(GtkWidget * widget, gpointer data)
{
/* it is necessary to call gtk_grab_remove() before gtk_main_quit().
 * if not, the widgets are already destroyed and we segfault */

  gtk_grab_remove(widget);
  gtk_main_quit();
}
