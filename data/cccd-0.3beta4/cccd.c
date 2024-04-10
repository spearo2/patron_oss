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

   $Id: cccd.c,v 0.3.3.6 2002/01/06 23:05:18 jst Exp $
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <time.h>
#include <sys/types.h>
#include <sys/time.h>
#include <gtk/gtk.h>
#include <signal.h>

#include "general.h"
#include "misc.h"
#include "cd.h"
#include "options.h"
#include "cddb.h"
#include "info.h"
#include "cccd.h"
#include "icons.h"

/* event handlers */
static gint configure_event(GtkWidget * widget, GdkEventConfigure * event);
static gint expose_event(GtkWidget * widget, GdkEventExpose * event);

/* global vars */
static struct control cntl;
static struct display disp;
static struct options opt;
static int startup_playing = 0;
static int startup = 1;
/* used only at startup, to add a timeout function
   if the cddrive is already playing */

/* entry point: main */
int main(int argc, char **argv)
{
  struct sigaction sa;

  sa.sa_handler = SIG_IGN;	/* just ignore the damn thing */
  sa.sa_flags = SA_NOCLDSTOP;	/* need know only when child is done */
  /* necessary for compiling with kernel 2.1.1xx, where sa_mask is an array [Petteri] */
  memset(&sa.sa_mask, 0, sizeof(sa.sa_mask)); 
  sigaction(SIGCHLD, &sa, 0);	/* activate */

  options_clear(&opt);
  options_load(&opt);

  strcpy(cntl.devicename, "/dev/cdrom");
  cntl.drivestatus = NO_STATUS;
  cntl.playmode = NORMAL;
  cntl.looking = 0;
  cntl.tray_open = 0;
  cd_clear(&cntl.cd);
  gtk_init(&argc, &argv);
  init_gui();
  gtk_main();

  return 0;
}


void init_gui(void)
{
  GtkWidget *window, *vbox, *hbox, *tophbox, *button, *pixmap;
  GdkPixmap *dpixmap;
  GdkBitmap *dmask;
  GtkTooltips *tooltip;
  GdkColor tooltipcolor;
  GdkColormap *colormap;

  /* start with the control panel window */
  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_widget_realize(window);

  /* allocate a yellowish color for the tooltips */
  colormap = gdk_window_get_colormap(window->window);
  tooltip = gtk_tooltips_new();
  tooltipcolor.red = 61669;
  tooltipcolor.green = 59113;
  tooltipcolor.blue = 35979;
  gdk_color_alloc(colormap, &tooltipcolor);

  gtk_window_set_title(GTK_WINDOW(window), "cccd Panel");
  gtk_signal_connect(GTK_OBJECT(window), "destroy",
		     GTK_SIGNAL_FUNC(destroy_callback), NULL);
  gtk_widget_set_usize(window, 5 * GUI_BUTTON_X, 2 * GUI_BUTTON_Y);
  gtk_widget_show(window);	/* we do this here, to be able to show pixmaps */

  tophbox = gtk_hbox_new(FALSE, 0);	/* this hbox contains everything */
  gtk_container_add(GTK_CONTAINER(window), tophbox);

  vbox = gtk_vbox_new(FALSE, 0);	/* this vbox will only contain quit */
  gtk_container_add(GTK_CONTAINER(tophbox), vbox);

/* this is the quit button */
  button = gtk_button_new();
  gtk_signal_connect_object(GTK_OBJECT(button), "clicked",
			    GTK_SIGNAL_FUNC(gtk_widget_destroy),
			    GTK_OBJECT(window));
  dpixmap = gdk_pixmap_create_from_xpm_d(window->window, &dmask,
				       &window->style->bg[GTK_STATE_NORMAL],
					 exit_icon);
  pixmap = gtk_pixmap_new(dpixmap, dmask);
  gtk_widget_show(pixmap);
  gtk_container_add(GTK_CONTAINER(button), pixmap);
  gtk_widget_set_usize(button, GUI_BUTTON_X, 2 * GUI_BUTTON_Y);
  gtk_box_pack_start(GTK_BOX(vbox), button, TRUE, TRUE, 0);
  gtk_tooltips_set_tip(tooltip, button, "Quit", NULL);
  gtk_widget_show(button);

  gtk_widget_show(vbox);


  vbox = gtk_vbox_new(FALSE, 0);	/* this vbox contains two hboxes with buttons */
  gtk_container_add(GTK_CONTAINER(tophbox), vbox);

  hbox = gtk_hbox_new(FALSE, 0);	/* top button row */
  gtk_container_add(GTK_CONTAINER(vbox), hbox);

/* this is the prev track button */
  button = gtk_button_new();
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
		     GTK_SIGNAL_FUNC(prev_callback), NULL);
  dpixmap = gdk_pixmap_create_from_xpm_d(window->window, &dmask,
				       &window->style->bg[GTK_STATE_NORMAL],
					 prev_icon);
  pixmap = gtk_pixmap_new(dpixmap, dmask);
  gtk_widget_show(pixmap);
  gtk_container_add(GTK_CONTAINER(button), pixmap);
  gtk_widget_set_usize(button, GUI_BUTTON_X, GUI_BUTTON_Y);
  gtk_box_pack_start(GTK_BOX(hbox), button, TRUE, TRUE, 0);
  gtk_tooltips_set_tip(tooltip, button, "Previous", NULL);
  gtk_widget_show(button);

/* this is the play button */
  button = gtk_button_new();
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
		     GTK_SIGNAL_FUNC(play_callback), NULL);
  dpixmap = gdk_pixmap_create_from_xpm_d(window->window, &dmask,
				       &window->style->bg[GTK_STATE_NORMAL],
					 play_icon);
  pixmap = gtk_pixmap_new(dpixmap, dmask);
  gtk_widget_show(pixmap);
  gtk_container_add(GTK_CONTAINER(button), pixmap);
  gtk_widget_set_usize(button, GUI_BUTTON_X, GUI_BUTTON_Y);
  gtk_box_pack_start(GTK_BOX(hbox), button, TRUE, TRUE, 0);
  gtk_tooltips_set_tip(tooltip, button, "Play/Replay", NULL);
  gtk_widget_show(button);

/* this is the next track button */
  button = gtk_button_new();
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
		     GTK_SIGNAL_FUNC(next_callback), NULL);
  dpixmap = gdk_pixmap_create_from_xpm_d(window->window, &dmask,
				       &window->style->bg[GTK_STATE_NORMAL],
					 next_icon);
  pixmap = gtk_pixmap_new(dpixmap, dmask);
  gtk_widget_show(pixmap);
  gtk_container_add(GTK_CONTAINER(button), pixmap);
  gtk_widget_set_usize(button, GUI_BUTTON_X, GUI_BUTTON_Y);
  gtk_box_pack_start(GTK_BOX(hbox), button, TRUE, TRUE, 0);
  gtk_tooltips_set_tip(tooltip, button, "Next", NULL);
  gtk_widget_show(button);

  gtk_widget_show(hbox);

  hbox = gtk_hbox_new(FALSE, 0);	/* bottom button row */
  gtk_container_add(GTK_CONTAINER(vbox), hbox);

/* this is the pause button */
  button = gtk_button_new();
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
		     GTK_SIGNAL_FUNC(pause_callback), NULL);
  dpixmap = gdk_pixmap_create_from_xpm_d(window->window, &dmask,
				       &window->style->bg[GTK_STATE_NORMAL],
					 pause_icon);
  pixmap = gtk_pixmap_new(dpixmap, dmask);
  gtk_widget_show(pixmap);
  gtk_container_add(GTK_CONTAINER(button), pixmap);
  gtk_widget_set_usize(button, GUI_BUTTON_X, GUI_BUTTON_Y);
  gtk_box_pack_start(GTK_BOX(hbox), button, TRUE, TRUE, 0);
  gtk_tooltips_set_tip(tooltip, button, "Pause", NULL);
  gtk_widget_show(button);

/* this is the stop button */
  button = gtk_button_new();
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
		     GTK_SIGNAL_FUNC(stop_callback), NULL);
  dpixmap = gdk_pixmap_create_from_xpm_d(window->window, &dmask,
				       &window->style->bg[GTK_STATE_NORMAL],
					 stop_icon);
  pixmap = gtk_pixmap_new(dpixmap, dmask);
  gtk_widget_show(pixmap);
  gtk_container_add(GTK_CONTAINER(button), pixmap);
  gtk_widget_set_usize(button, GUI_BUTTON_X, GUI_BUTTON_Y);
  gtk_box_pack_start(GTK_BOX(hbox), button, TRUE, TRUE, 0);
  gtk_tooltips_set_tip(tooltip, button, "Stop", NULL);
  gtk_widget_show(button);

/* this is the eject button */
  button = gtk_button_new();
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
		     GTK_SIGNAL_FUNC(eject_callback), NULL);
  dpixmap = gdk_pixmap_create_from_xpm_d(window->window, &dmask,
				       &window->style->bg[GTK_STATE_NORMAL],
					 eject_icon);
  pixmap = gtk_pixmap_new(dpixmap, dmask);
  gtk_widget_show(pixmap);
  gtk_container_add(GTK_CONTAINER(button), pixmap);
  gtk_widget_set_usize(button, GUI_BUTTON_X, GUI_BUTTON_Y);
  gtk_box_pack_start(GTK_BOX(hbox), button, TRUE, TRUE, 0);
  gtk_tooltips_set_tip(tooltip, button, "Eject", NULL);
  gtk_widget_show(button);

  gtk_widget_show(hbox);
  gtk_widget_show(vbox);


  vbox = gtk_vbox_new(FALSE, 0);	/* another vbox for the info button */
  gtk_container_add(GTK_CONTAINER(tophbox), vbox);

/* this is the info button */
  button = gtk_button_new();
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
		     GTK_SIGNAL_FUNC(info_callback), NULL);
  dpixmap = gdk_pixmap_create_from_xpm_d(window->window, &dmask,
				       &window->style->bg[GTK_STATE_NORMAL],
					 info_icon);
  pixmap = gtk_pixmap_new(dpixmap, dmask);
  gtk_widget_show(pixmap);
  gtk_container_add(GTK_CONTAINER(button), pixmap);
  gtk_widget_set_usize(button, GUI_BUTTON_X, 2 * GUI_BUTTON_Y);
  gtk_box_pack_start(GTK_BOX(vbox), button, TRUE, TRUE, 0);
  gtk_tooltips_set_tip(tooltip, button, "CD info/CDDB settings", NULL);
  gtk_widget_show(button);

  gtk_widget_show(vbox);
  gtk_widget_show(tophbox);
  /* gtk_widget_set_usize(window, 32+3*24, 32 ); redundant, see line 81 */

  /* init the displaying window */
  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_window_set_title(GTK_WINDOW(window), "cccd Display");
  gtk_signal_connect(GTK_OBJECT(window), "destroy",
		     GTK_SIGNAL_FUNC(destroy_callback), NULL);
  vbox = gtk_vbox_new(FALSE, 0);
  gtk_container_add(GTK_CONTAINER(window), vbox);

  /* area where all text appears */
  disp.drawing_area = gtk_drawing_area_new();
  gtk_drawing_area_size(GTK_DRAWING_AREA(disp.drawing_area), 120, 60);
  gtk_widget_add_events(disp.drawing_area,
			GDK_EXPOSURE_MASK | GDK_BUTTON_PRESS_MASK | GDK_STRUCTURE_MASK);
  gtk_signal_connect(GTK_OBJECT(disp.drawing_area), "expose_event",
		     (GtkSignalFunc) expose_event, NULL);
  gtk_signal_connect(GTK_OBJECT(disp.drawing_area), "configure_event",
		     (GtkSignalFunc) configure_event, NULL);
  gtk_signal_connect(GTK_OBJECT(disp.drawing_area), "map_event",
		     (GtkSignalFunc) init_display, NULL);
  gtk_signal_connect(GTK_OBJECT(disp.drawing_area), "button_press_event",
		     (GtkSignalFunc) switch_timemode, NULL);

  gtk_box_pack_start(GTK_BOX(vbox), disp.drawing_area, TRUE, TRUE, 0);
  gtk_widget_show(disp.drawing_area);

  /* create the progress bar */
  disp.progress_bar = gtk_progress_bar_new();
  gtk_widget_set_events(disp.progress_bar,
			gtk_widget_get_events(disp.progress_bar) |
			GDK_BUTTON_PRESS_MASK);
  gtk_signal_connect(GTK_OBJECT(disp.progress_bar), "button_press_event",
		     (GtkSignalFunc) switch_playmode, NULL);
  gtk_progress_bar_update(GTK_PROGRESS_BAR(disp.progress_bar), 0.5);
  gtk_box_pack_start(GTK_BOX(vbox), disp.progress_bar, TRUE, TRUE, 0);
  gtk_widget_show(disp.progress_bar);

  gtk_widget_show(vbox);
  gtk_widget_show(window);

  disp.pixmap = NULL;
  disp.gc = NULL;

}


int init_cd(int handle)
{
  int status, stop_player = handle, i;
  pid_t pid;
  char *data = NULL;
  FILE *stream;

  if (handle < 0) {
    handle = cd_open_device(cntl.devicename);
    cntl.cd.id = NULL;
  }
  if (cntl.cd.id != NULL)
    free(cntl.cd.id);

  status = cd_init(handle, &cntl.cd);
  if (status < 0) {		/* for example, no disc in drive on startup */
    cntl.drivestatus = ERROR;
    update_status_string();
    return status;
  }

  /* if the calling function passed a valid handle, the cd tray was ejected.
     to make sure that the drive wont start up playing, make it stop */
  if (stop_player > -1)
    cd_audio_stop(cntl.cd.handle);

  status = cd_status(cntl.cd.handle);
  switch (status) {
  case CDROM_AUDIO_PLAY:
    cntl.drivestatus = PLAYING;
    break;
  case CDROM_AUDIO_PAUSED:
    cntl.drivestatus = PAUSED;
    break;
  case CDROM_AUDIO_COMPLETED:
    cntl.drivestatus = STOPPED;
    break;
  case CDROM_AUDIO_NO_STATUS:
    cntl.drivestatus = NO_STATUS;
    break;
  case CDROM_AUDIO_INVALID:
  case CDROM_AUDIO_ERROR:
    cntl.drivestatus = ERROR;
    break;
  }
  update_status_string();

  if (status == CDROM_AUDIO_PLAY || status == CDROM_AUDIO_PAUSED)
    startup_playing = 1;

  /* we don't compute again, have already stored disk id  */

  /* FIXME: what does this mean? */
  cntl.cd.current_track = cd_audio_current_track(cntl.cd.handle);
  /* spawn a child process for looking up the cd data */
  cntl.looking = 1;
  if (disp.timeout == 0)	/* set up everything to catch the data */
    disp.timeout = gtk_timeout_add(500, update_display, NULL);

  pipe(cntl.pipeline);
  pid = fork();
  if (pid == 0) {		/* we are the child. lookup the data */
#if 0
    printf("cccd lookup: %d\n", (int) getpid());
    kill(getpid(), SIGSTOP);
#endif
    i = cddb_lookup(&cntl.cd, &data, opt.lookup, opt.server, opt.port,
		    opt.protocol, opt.path);
    stream = fdopen(cntl.pipeline[1], "w");
    if (data != NULL)
      fprintf(stream, "%s", data);
    else
      fprintf(stream, "\r\n.\r\n");
    fprintf(stream, "%d", i);	/* pass status on to caller */
    fputc(EOF, stream);
    fflush(stream);
    fclose(stream);
    free(data);
    _exit(0);
  }
  else				/* parent and error */
    return status;
}

int init_display(GtkWidget * widget, GdkEvent * event, gpointer callback_data)
{
#ifdef DEBUG_EV
  printf("init_display / map\n");
#endif
  /* TODO: implement a decent GC */
  disp.time_string = (char *) malloc(18);
  disp.time_font =
    gdk_font_load("-Adobe-Helvetica-Medium-R-Normal--*-100-*-*-*-*-*-*");
  disp.title_font = disp.status_font = disp.time_font;
  disp.gc = disp.drawing_area->style->bg_gc[GTK_STATE_NORMAL];
  disp.mode_string = (char *) malloc(7);
  disp.status_string = (char *) malloc(STATUS_STRING_MAXLEN);
  strcpy(disp.mode_string, "Normal");
  update_status_string();
  disp.timeout = gtk_timeout_add(500, update_display, NULL);
  disp.timemode = REL_DONE;

  /* Need explicit call, since map_event does not seem to cause a configure_event */
  configure_event(widget, NULL);

  return 0;
}

void destroy_callback(GtkWidget * widget, gpointer data)
{
  if (cntl.cd.handle > 0)
    close(cntl.cd.handle);
  gtk_main_quit();		/* and we are done */
}

void prev_callback(GtkWidget * widget, gpointer data)
{
  int track = cntl.cd.current_track;

  do {
    track--;
    if (track < cntl.cd.first_track)
      track = cntl.cd.last_track;
  } while (track != cntl.cd.current_track && (!cntl.cd.toc[track].play ||
					      !cntl.cd.toc[track].audio));


  cntl.cd.current_track = track;
  play_callback(NULL, NULL);
#ifdef DEBUG
  printf("call from prev\n");
#endif
}

void play_callback(GtkWidget * widget, gpointer data)
{
#ifdef DEBUG
  printf("Enter play trk %d\n", cntl.cd.current_track);
#endif
/* first we need to check if tray is open */
  if (cntl.tray_open)
    eject_callback(widget, NULL);
/* then we need to check if cd is initialized */
  if (cntl.cd.id == NULL) {
    cntl.drivestatus = ERROR;
    update_status_string();
    g_warning("No CD in drive?\n");
    return;
  }

  if (cntl.cd.toc[cntl.cd.current_track].audio &&
      cntl.cd.toc[cntl.cd.current_track].play) {
/* check to see if we can play the current track */
    cntl.drivestatus = PLAYING;
    update_status_string();
    if (cd_audio_play(cntl.cd.handle, cntl.cd.current_track) < 0) {
      g_warning("Error playing track %d!\n", cntl.cd.current_track);
      cntl.drivestatus = ERROR;
      update_status_string();
    }
    else if (disp.timeout == 0)
      disp.timeout = gtk_timeout_add(500, update_display, NULL);
  }
  else				/* otherwise play the next playable track */
    next_callback(NULL, NULL);
#ifdef DEBUG
  printf("Exit play trk %d\n", cntl.cd.current_track);
#endif
}

void next_callback(GtkWidget * widget, gpointer data)
{
  int track = cntl.cd.current_track;

/* first we need to check if cd is initialized */
  if (cntl.tray_open)
    eject_callback(widget, NULL);

  do {
    track++;
    if (track > cntl.cd.last_track)
      track = cntl.cd.first_track;
  } while (track != cntl.cd.current_track && (!cntl.cd.toc[track].play ||
					      !cntl.cd.toc[track].audio));

  cntl.cd.current_track = track;
#ifdef DEBUG
  printf("call from next\n");
#endif
  play_callback(NULL, NULL);
}

void pause_callback(GtkWidget * widget, gpointer data)
{
/* first we need to check if cd is initialized */
  if (cntl.tray_open)
    return;

  if (cd_status(cntl.cd.handle) == CDROM_AUDIO_PAUSED) {
    cd_audio_resume(cntl.cd.handle);
    cntl.drivestatus = PLAYING;
    update_status_string();
  }
  else {
    cd_audio_pause(cntl.cd.handle);
    cntl.drivestatus = PAUSED;
    update_status_string();
  }
}

void stop_callback(GtkWidget * widget, gpointer data)
{
#ifdef DEBUG
  printf("Enter stop\n");
#endif
/* first we need to check if cd is initialized */
  if (cntl.tray_open)
    return;

  cntl.drivestatus = STOPPED;
  update_status_string();
  if (cd_audio_stop(cntl.cd.handle) < 0) {
    g_warning("Error stopping the CD. This should get interesting...\n");
    cntl.drivestatus = ERROR;
    update_status_string();
  }
/* here we assume that there is no cd with audio track 0
   and misuse current_track = 0 for stop indicator */
  cntl.cd.current_track = 0;
#ifdef DEBUG
  printf("Exit stop\n");
#endif
}

void eject_callback(GtkWidget * widget, gpointer data)
{
  if (!cntl.tray_open) {
    cd_audio_stop(cntl.cd.handle);
    cd_eject(cntl.cd.handle);
    cd_deinit(&cntl.cd);
    cntl.drivestatus = EJECTED;
    update_status_string();
  }
  else {
    cd_close_tray(cntl.cd.handle);
    if (init_cd(cntl.cd.handle) < 0) {
      g_warning("Error initializing CD!\n");
      cntl.drivestatus = ERROR;
      update_status_string();
    }
    cntl.cd.current_track = cntl.cd.first_track;
  }
#ifdef DEBUG_EJ
  printf("eject, status: %x\n", cd_status(cntl.cd.handle));
#endif
  update_display(NULL);
  cntl.tray_open ^= 1;
}


void info_callback(GtkWidget * widget, gpointer data)
{
  info_dialog_init(&cntl.cd, &opt);
}


gint update_display(gpointer gdata)
{				/* UPD */
  int cdtime, next_track, lookup_status, status;
  int old_track, track_changed = 0;
  char *status_string, *data = NULL, *buffer = NULL, *track_string = NULL;
  GdkRectangle update =
  {0, 0,
   disp.drawing_area->allocation.width,
   disp.drawing_area->allocation.height};
  FILE *stream;
  struct timeval timeout;
  fd_set set;

  if (startup == 1) {
    status = init_cd(-1);
    if (status < 0) {
      g_warning("Error initializing the CD\n");
      cntl.drivestatus = ERROR;
      update_status_string();
    }
    startup = 0;
  }
  old_track = cntl.cd.current_track;
  /* Set the strings we want to display */
  status = cd_read_subchannel(&cntl.cd);	/* this also updates cntl.cd.track_time */
  /* if we did not eject the CD recently, and an error occured
   * while reading the subchannel, set state to ERROR */
  if ((cntl.drivestatus != EJECTED) && (status < 0)) {
    cntl.drivestatus = ERROR;
    update_status_string();
    disp.timeout = 0;
    return FALSE;
  }
/* 
   all knowledge of track changes is consolidated into track_changed 
   a track change has occured, when 
   a) the current track returned from subchannel != track in display
   b) the time remaining of current track is 0
   c) the CDROM says, audio playing is complete
   d) the CD is supposed to be playing, i.e. not ejected, stopped, etc
 */
  track_changed = (old_track != cntl.cd.current_track) && (cntl.cd.current_track != 0);		/* a) */
#ifdef DEBUG
  if (track_changed)
    printf("track changed!\n");
#endif
  /* handle playmodes and next tracks to play if we cross track boundary */
  track_changed |= (cntl.cd.toc[cntl.cd.current_track].length - cntl.cd.track_time == 0);	/* b) */
  track_changed |= (status == CDROM_AUDIO_COMPLETED);	/* c) */
  track_changed &= (cntl.drivestatus == PLAYING);	/* d) */
#ifdef DEBUG_TO
  cdtime = cntl.cd.toc[cntl.cd.current_track].length - cntl.cd.track_time;
  printf("cdtime: %d, status: %x, track: %d\n", cdtime, status, cntl.cd.current_track);
#endif
/* in this place it is necessary to detect if a track change takes place 
   we have options: 
   1) status changes from CDROM_AUDIO_PLAY to CDROM_AUDIO_NO_STATUS
   we would need to keep track of the current and last state. if we only check
   for status == CDROM_AUDIO_NO_STATUS, stop button does not work and autoplay
   is always on
   bad idea, tracks are skipped and stop doesn't work either
   2) cdtime == 0
   we feel it is unreliable. there is some difference between what is on the
   display, what read_subchannel returns and what play used as start/end time
   3) track returned by read_subchannel != track in display
   we remember what printed in the display
   now we have CD end not recognized any more
   4) since we hopefully have sorted out the CDROM audio status changes, it should
   be as easy as checking for CDROM_AUDIO_COMPLETED
   turns out it is not that easy, but a combo of all that works
 */
  if (track_changed) {
#ifdef DEBUG
    printf("cdtime == 0, track_changed: %s, status: %x\n", track_changed ? "TRUE" : "FALSE", status);
#endif
    cntl.cd.current_track = old_track;	/* just in case, so we don't accidentally skip tracks */
/* now handle the playmodes */
    switch (cntl.playmode) {
    case RANDOM:		/* pseudo-random mode */
      srandom(time(NULL));
      do {
	next_track = random() % (cntl.cd.last_track - cntl.cd.first_track);
      } while (!cntl.cd.toc[next_track + cntl.cd.first_track].play ||
	       !cntl.cd.toc[next_track + cntl.cd.first_track].audio);
      cntl.cd.current_track = next_track + cntl.cd.first_track;
      play_callback(NULL, NULL);
#ifdef DEBUG
      printf("call from random\n");
#endif
      break;

    case LOOP_TRACK:		/* track repeat mode */
      play_callback(NULL, NULL);
#ifdef DEBUG
      printf("call from loop\n");
#endif
      break;

    case LOOP_CD:		/* CD repeat mode */
      if ((cntl.cd.current_track != cntl.cd.last_track) && (cntl.cd.current_track != 0)
	  && (cntl.cd.toc[cntl.cd.current_track + 1].audio))
	next_callback(NULL, NULL);	/* then we have not reached end of disk */
      else {
#ifdef DEBUG
      printf("call from cd loop, disk end reached\n");
#endif
	cntl.cd.current_track =  cntl.cd.first_track;
        play_callback(NULL, NULL);
      }
      break;

    default:			/* normal play mode. play next track unless CD ended */
      if ((cntl.cd.current_track != cntl.cd.last_track) && (cntl.cd.current_track != 0)
	  && (cntl.cd.toc[cntl.cd.current_track + 1].audio))
	next_callback(NULL, NULL);	/* then we have not reached end of disk */
      else {
	stop_callback(NULL, NULL);
	cntl.cd.current_track = 0 /* cntl.cd.first_track */ ;
      }
      break;
    }
  }

  status_string = (char *) malloc(strlen(disp.status_string) +
				  strlen(disp.mode_string) + 7 + 2);
  sprintf(status_string, "%s %s", disp.status_string, disp.mode_string);

  if (cntl.looking == 1)
    strcat(status_string, " Query");


  switch (disp.timemode) {
  case ABS_DONE:
    cdtime = cntl.cd.cd_time - (cntl.cd.toc[cntl.cd.first_track].offset / 75);
    break;
  case ABS_REMAIN:
    cdtime = cntl.cd.length - cntl.cd.cd_time;
    break;
  case REL_DONE:
    cdtime = cntl.cd.track_time;
    break;
  case REL_REMAIN:
    cdtime = cntl.cd.toc[cntl.cd.current_track].length -
      (cntl.cd.track_time	/* - we don't need, its all relative
				   cntl.cd.toc[cntl.cd.first_track].offset / 75 */ );
    break;
  default:
    g_error("Timemode error!\n Please submit a bug report!\n");
    exit(-1);
  }

  sprintf(disp.time_string, "%02d:%02d", cdtime / 60, cdtime % 60);

  switch (disp.timemode) {
  case ABS_DONE:
    strcat(disp.time_string, " CD");
    break;
  case ABS_REMAIN:
    strcat(disp.time_string, " CD remain");
    break;
  case REL_DONE:
    strcat(disp.time_string, " Track");
    break;
  case REL_REMAIN:
    strcat(disp.time_string, " Track remain");
    break;
  }
  /* update the progress bar. always in absolute mode */
  if (cntl.cd.length > 0)
  gtk_progress_bar_update(GTK_PROGRESS_BAR(disp.progress_bar),
		      (float) (cntl.cd.cd_time) / (float) (cntl.cd.length));
  else 
    gtk_progress_bar_update(GTK_PROGRESS_BAR(disp.progress_bar), 0.5);


  disp.cd_title = cntl.cd.title;
  disp.track_title = cntl.cd.toc[cntl.cd.current_track].title;

  /* print at least the track number, if no info is present */
  if ((disp.track_title == NULL) || (strlen(disp.track_title) <= 0)) {
    track_string = (char *) malloc(10);
    sprintf(track_string, "Track %d", cntl.cd.current_track);
  }
  /* Clear the area */
  gdk_draw_rectangle(disp.pixmap, disp.gc,
		     TRUE, 0, 0,
		     update.width, update.height);

  /* draw the strings */
  gdk_draw_string(disp.pixmap, disp.title_font,
		  disp.drawing_area->style->black_gc,
		  0, 10,
		  (disp.cd_title == NULL) ? "Unknown" : disp.cd_title);
  gdk_draw_string(disp.pixmap, disp.title_font,
		  disp.drawing_area->style->black_gc,
		  0, 25,
		  (track_string != NULL) ? track_string : disp.track_title);
  gdk_draw_string(disp.pixmap, disp.time_font,
		  disp.drawing_area->style->black_gc,
		  0, 40, disp.time_string);
  gdk_draw_string(disp.pixmap, disp.status_font,
		  disp.drawing_area->style->black_gc,
		  0, 55, status_string);

  /* update the display */
  gtk_widget_draw(disp.drawing_area, &update);

  free(status_string);
  if (track_string != NULL)
    free(track_string);

  /* this is checked only once: at startup. if the flag is set, the drive
     is already playing, so we'll install a timout here */
  if (startup_playing == 1) {
    startup_playing = 0;
    disp.timeout = gtk_timeout_add(500, update_display, NULL);
#ifdef DEBUG
    printf("startup\n");
#endif
  }

  /* the query has just finished. we need the extra step to ensure display window is updated */
  if (cntl.looking == 2)
    cntl.looking = 0;

  if (cntl.looking == 1) {	/* we're looking. now, check if search is finished */
    timeout.tv_sec = 0;
    timeout.tv_usec = 100000;	/* wait 0.1 seconds for data */
    FD_ZERO(&set);		/* set up the set of filedescribtors to check */
    FD_SET(cntl.pipeline[0], &set);
    if (select(FD_SETSIZE, &set, NULL, NULL, &timeout) == 1) {
      /* we have data! jubelate! */

      stream = fdopen(cntl.pipeline[0], "r");
      do {
	buffer = get_string_piece(stream, '\n');
	string_append(&data, buffer);
	free(buffer);
      } while (strstr(data, "\r\n.\r\n") == NULL);
      fscanf(stream, "%d", &lookup_status);	/* we know now, where the data is from */
#ifdef DEBUG
      printf("lookup status: %d\n", lookup_status);
#endif
      fclose(stream);

      cddb_handle_data(&cntl.cd, data);		/*yes */
      cntl.looking = 2;
      free(data);

      if (info_dialog_open() != 0) {	/* if the info box is open, update it */
	info_dialog_set_cd(&cntl.cd);
	cd_page_display();
      }
      if ((opt.save != 0) && (lookup_status == REMOTE_OK))
	/* we have new data from remote, so save it for later */
	save_cd(&cntl.cd, opt.path);
    }
  }

/* we need to check again, because an operation may have changed status */
  if (track_changed)
#ifdef DEBUG
  {
#endif
    status = cd_status(cntl.cd.handle);
#ifdef DEBUG
    printf("st:%x\n", status);
  }
#endif
  if (cntl.drivestatus == EJECTED) {
    disp.timeout = 0;
    return FALSE;
  }
  if (status == CDROM_AUDIO_PLAY || status == CDROM_AUDIO_PAUSED ||
      cntl.looking != 0)
    return TRUE;

/* if CDROM reports audio play error, no longer update display */
  disp.timeout = 0;
  return FALSE;
}


static gint configure_event(GtkWidget * widget, GdkEventConfigure * event)
{
#ifdef DEBUG_EV
  printf("configure_event\n");
#endif
  if (disp.pixmap != NULL)
    gdk_pixmap_unref(disp.pixmap);

  disp.pixmap = gdk_pixmap_new(widget->window,
			       widget->allocation.width,
			       widget->allocation.height,
			       -1);

  gdk_draw_rectangle(disp.pixmap, widget->style->bg_gc[GTK_STATE_NORMAL],
		     TRUE, 0, 0,
		     widget->allocation.width, widget->allocation.height);

  return TRUE;
}



static gint expose_event(GtkWidget * widget, GdkEventExpose * event)
{
#ifdef DEBUG_EV
  printf("expose_event\n");
#endif
  gdk_draw_pixmap(widget->window,
		  widget->style->fg_gc[GTK_WIDGET_STATE(widget)],
		  disp.pixmap,
		  event->area.x, event->area.y,
		  event->area.x, event->area.y,
		  event->area.width, event->area.height);

  return FALSE;
}


void switch_timemode(void)
{
  disp.timemode++;
  disp.timemode %= 4;
  update_display(NULL);
}

void switch_playmode(void)
{
  cntl.playmode++;
  cntl.playmode %= 4;
  switch (cntl.playmode) {
  case RANDOM:
    strcpy(disp.mode_string, "Random");
    break;
  case LOOP_CD:
    strcpy(disp.mode_string, "CD");
    break;
  case LOOP_TRACK:
    strcpy(disp.mode_string, "Track");
    break;
  default:
    strcpy(disp.mode_string, "Normal");
  }
  update_display(NULL);
}

void update_status_string(void)
{
  switch (cntl.drivestatus) {
  case PLAYING:
    sprintf(disp.status_string, "%s", "Playing");
    break;
  case PAUSED:
    sprintf(disp.status_string, "%s", "Paused");
    break;
  case STOPPED:
    sprintf(disp.status_string, "%s", "Stopped");
    break;
  case NO_STATUS:
    sprintf(disp.status_string, "%s", "No Status");
    break;
  case ERROR:
    sprintf(disp.status_string, "%s", "Error");
    break;
  case EJECTED:
    sprintf(disp.status_string, "%s", "Ejected");
    break;
  }
}
