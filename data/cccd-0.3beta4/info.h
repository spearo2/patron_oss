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

   $Id: info.h,v 0.3.3.1 1998/08/20 16:09:09 jochen Exp $
 */

#ifndef CCCD_INFO_H
#define CCCD_INFO_H

struct info_dialog {
  GtkWidget *window, *send_button, *clist, *track_entry, *title_entry;
  int selected_track, open, enter_pressed;
  GtkWidget *server_entry, *port_entry, *remote_submit_entry, *path_entry,
   *local_save_button, *cddbp_radio, *http_radio, *rl_radio, *lr_radio,
   *l_radio, *r_radio, *n_radio;
  GdkColormap *colormap;
  GdkColor *notplaycolor, *playcolor;
};


int info_dialog_init(struct audio_cd *cd, struct options *opt);
GtkWidget *init_cd_page(void);
GtkWidget *init_cddb_page(void);
GtkWidget *init_about_page(void);
void info_dialog_destroy(GtkWidget *, gpointer);
int info_dialog_open(void);
void info_dialog_set_cd(struct audio_cd *cd);

void title_changed(GtkEntry * entry);
void track_selected(GtkCList * clist, gint row, gint column,
		    GdkEventButton * event);
void track_changed(GtkEntry * entry);

void server_changed(GtkEntry * entry);
void port_changed(GtkEntry * entry);
void remote_submit_changed(GtkEntry * entry);
void path_changed(GtkEntry * entry);
void protocol_changed(GtkToggleButton * toggle_button);
void lookup_changed(GtkToggleButton * toggle_button);
void save_changed(GtkToggleButton * toggle_button);

void cd_undo(GtkWidget * widget, gpointer data);
void cd_save(GtkWidget * widget, gpointer data);
void save_cd(struct audio_cd *cd, const char *path);
void cd_send(GtkWidget * widget, gpointer data);
void cd_page_display(void);

void cddb_undo(GtkWidget * widget, gpointer data);
void cddb_save(GtkWidget * widget, gpointer data);
void cddb_page_display(void);

int alternate_list(char **title, int matches);
void alternate_select(GtkCList * clist, gint row, gint column,
		      GdkEventButton * event);
void alternate_quit(GtkWidget * windget, gpointer data);

#endif /* CCCD_INFO_H */
