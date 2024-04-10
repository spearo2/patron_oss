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

   $Id: cccd.h,v 0.3.3.1 1998/08/20 16:09:09 jochen Exp $
 */

#ifndef CCCD_CCCD_H
#define CCCD_CCCD_H

enum Timemodes {
  ABS_DONE, ABS_REMAIN, REL_DONE, REL_REMAIN
};
enum Playmodes {
  NORMAL, LOOP_TRACK, LOOP_CD, RANDOM
};
enum Drivestatus {
  PLAYING, PAUSED, STOPPED, NO_STATUS, ERROR, EJECTED
};

struct control {
  struct audio_cd cd;
  char devicename[40];
  int pipeline[2];
  int looking;			/* 0: we are not looking for cddb data, 1: we are looking, 2: looking just finished */
  enum Playmodes playmode;
  enum Drivestatus drivestatus;
  int tray_open;
};

struct display {
  GtkWidget *progress_bar, *drawing_area;
  GdkPixmap *pixmap;
  GdkGC *gc;
  GdkFont *title_font, *status_font, *time_font;
  char *cd_title, *track_title, *status_string, *time_string, *mode_string;
  int timeout;
  enum Timemodes timemode;
};

/* init functions */
void init_gui(void);
int init_cd(int handle);
int init_display(GtkWidget * widget, GdkEvent * event, gpointer callback_data);

/* callback functions for the GUI */
void destroy_callback(GtkWidget *, gpointer);
void prev_callback(GtkWidget *, gpointer);
void play_callback(GtkWidget *, gpointer);
void next_callback(GtkWidget *, gpointer);
void pause_callback(GtkWidget *, gpointer);
void stop_callback(GtkWidget *, gpointer);
void eject_callback(GtkWidget *, gpointer);
void info_callback(GtkWidget *, gpointer);


/* event handlers */
gint update_display(gpointer data);

/* misc functions */
void switch_timemode(void);
void switch_playmode(void);
void update_status_string(void);

/* GUI button sizes */
#define GUI_BUTTON_X 28
#define GUI_BUTTON_Y 25

/* display.status_string magic number */
#define STATUS_STRING_MAXLEN 9

#endif /* CCCD_CCCD_H */
