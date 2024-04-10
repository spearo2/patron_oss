/* xcam -- X-based camera frontend
   Uses the SANE library.
   Copyright (C) 1997 David Mosberger and Tristan Tarrant
   
   Update 2005 Gerard Klaver
   The add_text routine and font_6x11.h file are taken from the (GPLed) 
   webcam.c file, part of xawtv,   (c) 1998-2002 Gerd Knorr.
   add_text was modified for this program (xcam_add_text).

   This program is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License as
   published by the Free Software Foundation; either version 2 of the
   License, or (at your option) any later version.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.  */

#include "../include/sane/config.h"

#include "../include/lalloca.h"

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <limits.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <time.h>

/* for xcam_add-text routine  */
#include "font_6x11.h"
/*-----------------------*/


#include <sys/types.h>
#include <sys/stat.h>

#include "gtkglue.h"
#include "preferences.h"

#include <sane/sane.h>
#include <sane/saneopts.h>
#include "../include/sane/sanei.h"

#define BACKEND_NAME xcam
#include "../include/sane/sanei_debug.h"

#ifndef PATH_MAX
# define PATH_MAX	1024
#endif

#define OUTFILENAME	"out.pnm"

#define MAX_LUM		64	/* how many graylevels for 8 bit displays */

#ifndef HAVE_ATEXIT
# define atexit(func)	on_exit(func, 0)	/* works for SunOS, at least */
#endif

typedef struct Canvas
{
  GtkWidget *preview;
  GdkGC *gc;
  GdkImage *gdk_image;
  GdkColormap *graylevel_cmap;	/* for 8 bit displays */
  guint32 graylevel[MAX_LUM];	/* graylevel pixels */
  GdkColormap *cube_cmap;
  GdkColor cube_colors[5 * 6 * 5];
}
Canvas;

static const char *prog_name;
static const SANE_Device **device;
static GSGDialog *dialog;
static char device_settings_filename[1024] = "device.rc";

#define DBG_fatal 0
#define DBG_error 1
#define DBG_warning 2
#define DBG_info 3
#define DBG_debug 4

static struct
{
  GtkWidget *shell;
  GtkWidget *dialog_box;
  GtkWidget *play_stop_label;
  GtkWidget *info_label;
  GtkWidget *device_info_label;
  GtkWidget *save_frame_label;
  GtkWidget *rgb_bgr_label;
  GtkWidget *txt_label;
  struct
  {
    GtkWidget *item;		/* the menu bar item */
    GtkWidget *menu;		/* the associated menu */
  }
  devices;
  Canvas canvas;
  gint gdk_input_tag;		/* tag returned by gdk_input_add () */
  int playing;			/* are we playing video? */
  int saving;			/* are we saving to file */

  SANE_Byte *buf;
  size_t buf_backend_size;
  size_t remaining;
  SANE_Parameters params;
  gpointer data;		/* image data */
  int x, y;			/* x and y position */
  int input_tag;
/* for standalone mode: */
  GtkWidget *filename_entry;
  FILE *out;
  long header_size;
  gboolean have_odd_byte;
  guint8 odd_byte;

  int num_bytes;
  int bytes_read;
  char picmsg_ps[50];
  int value_rgb;
  int value_txt;

  double fps;
  double fps_av;
  double fps_old1;
  double fps_old2;
  double fps_old3;
  long f_count;
  time_t time1;
  time_t time2;
  int i_time;
}
win;

/* forward declarations: */
int main (int argc, char **argv);

static void rescan_devices (GtkWidget * widget, gpointer client_data,
			    gpointer call_data);
static void next_frame (void);

static void save_frame (void);

static void update_param (GSGDialog * dialog, void *arg);

static void load_defaults (int silent);

static struct option long_options[] = {
  {"help", no_argument, NULL, 'h'},
  {"version", no_argument, NULL, 'V'},
  {"buffersize", no_argument, NULL, 'B'},
  {0, 0, 0, 0}
};

/* Test if this machine is little endian (from coolscan.c) */
/* static gboolean
calc_little_endian (void)
{
  SANE_Int testvalue = 255;
  u_int8_t *firstbyte = (u_int8_t *) & testvalue;

  if (*firstbyte == 255)
    return TRUE;
  return FALSE;
} */

#define CANVAS_EVENT_MASK	GDK_BUTTON1_MOTION_MASK |	\
				GDK_EXPOSURE_MASK |		\
				GDK_BUTTON_PRESS_MASK |		\
				GDK_ENTER_NOTIFY_MASK

static void
display_image (Canvas * canvas)
{
  if (canvas->gdk_image)
    {
      gdk_draw_image (canvas->preview->window, canvas->gc, canvas->gdk_image,
		      0, 0, 0, 0,
		      canvas->gdk_image->width, canvas->gdk_image->height);
      gdk_flush ();
    }
}

static gint
canvas_events (GtkWidget * widget, GdkEvent * event)
{
  Canvas *canvas = &win.canvas;
  if (!canvas)
    return FALSE;

  switch (event->type)
    {
    case GDK_EXPOSE:
      if (!canvas->gc)
	canvas->gc = gdk_gc_new (canvas->preview->window);
      display_image (canvas);
      break;

    case GDK_BUTTON_PRESS:
      break;

    case GDK_BUTTON_RELEASE:
      break;

    case GDK_MOTION_NOTIFY:
      break;

    case GDK_ENTER_NOTIFY:
#if 0
      gdk_colors_store (win.canvas.cube_cmap, win.canvas.cube_colors,
			NELEMS (win.canvas.cube_colors));
#endif
      break;

    default:
      break;
    }
  return FALSE;
}

static void
stop_camera (void)
{
  DBG (DBG_debug, "xcam: stop_camera: enter\n");

  if (dialog)
    sane_cancel (gsg_dialog_get_device (dialog));
  if (win.gdk_input_tag >= 0)
    {
      gdk_input_remove (win.gdk_input_tag);
    }
  else
    win.playing = FALSE;
  win.gdk_input_tag = -1;
  if (!win.playing)
    gtk_label_set (GTK_LABEL (win.play_stop_label), " Play ");
  else
    gtk_label_set (GTK_LABEL (win.play_stop_label), " Stop ");

  DBG (DBG_debug, "xcam: stop_camera: exit\n");
}

static void
switch_device (const SANE_Device * dev)
{
  char buf[512];

  DBG (DBG_debug, "xcam: switch_device: enter\n");
  if (win.playing)
    {
      win.playing = FALSE;
      stop_camera ();
    }

  if (dialog)
    gsg_destroy_dialog (dialog);

  dialog = gsg_create_dialog (GTK_WIDGET (win.dialog_box), dev->name,
			      0, 0, 0, 0);
  buf[0] = '\0';

  if (dialog)
    sprintf (buf, "%s %s %s", dev->vendor, dev->model, dev->type);
  gtk_label_set (GTK_LABEL (win.device_info_label), buf);
  DBG (DBG_debug, "xcam: switch_device: exit\n");
}

static void
switch_device_by_name (const char *device_name)
{
  SANE_Device dev_info;
  int i;

  DBG (DBG_debug, "xcam: switch_device_by_name: enter\n");
  for (i = 0; device[i]; ++i)
    if (strcmp (device[i]->name, device_name) == 0)
      {
	switch_device (device[i]);
	return;
      }

  /* the backends don't know about this device yet---make up an entry: */
  dev_info.name = device_name;
  dev_info.vendor = "Unknown";
  dev_info.model = "";
  dev_info.type = "";
  switch_device (&dev_info);
  DBG (DBG_debug, "xcam: switch_device_by_name: exit\n");
}

static void
save_settings (const char *filename)
{
  int fd;

  DBG (DBG_debug, "xcam: save_settings: enter\n");

  fd = open (filename, O_WRONLY | O_CREAT | O_TRUNC, 0666);
  if (fd < 0)
    {
      char buf[256];

      snprintf (buf, sizeof (buf), "Failed to create file: %s.",
		strerror (errno));
      gsg_error (buf);
      return;
    }
  write (fd, dialog->dev_name, strlen (dialog->dev_name));
  write (fd, "\n", 1);
  sanei_save_values (fd, dialog->dev);
  close (fd);
  DBG (DBG_debug, "xcam: save_settings: exit\n");
}

#define MSG_MAXLEN   45
#define CHAR_HEIGHT  11
#define CHAR_WIDTH   6
#define CHAR_START   4

static SANE_Status
xcam_add_text (SANE_Byte * image, int width, int height, char *txt)
{
  SANE_Status status;
  time_t t;
  struct tm *tm;
  char line[MSG_MAXLEN + 1];
  SANE_Byte *ptr;
  int i, x, y, f, len;
  char fmtstring[25] = " %Y-%m-%d %H:%M:%S";
  char fmttxt[46];

  DBG (DBG_debug, "xcam_add_text: enter\n");
  time (&t);
  tm = localtime (&t);
  if (strlen (txt) > (MSG_MAXLEN - 23))
    strncpy (fmttxt, txt, (MSG_MAXLEN - 23));
  else
    strcpy (fmttxt, txt);
  strcat (fmttxt, fmtstring);

  len = strftime (line, MSG_MAXLEN, fmttxt, tm);

  for (y = 0; y < CHAR_HEIGHT; y++)
    {
      ptr = image + 3 * width * (height - CHAR_HEIGHT - 2 + y) + 12;

      for (x = 0; x < len; x++)
	{
	  f = fontdata[line[x] * CHAR_HEIGHT + y];
	  for (i = CHAR_WIDTH - 1; i >= 0; i--)
	    {
	      if (f & (CHAR_START << i))
		{
		  ptr[0] = 255;
		  ptr[1] = 255;
		  ptr[2] = 255;
		}
	      ptr += 3;
	    }			/* for i */
	}			/* for x */
    }				/* for y */

  DBG (DBG_debug, "xcam_add_text: exit vw=%d, vh=%d\n", width, height);
  status = (SANE_STATUS_GOOD);
  return status;

}


/* Update the info line with the latest size information.  */
static void
update_param (GSGDialog * dialog, void *arg)
{
  gchar buf[200];

  DBG (DBG_debug, "xcam: update_param: enter\n");

  if (dialog == NULL)
    return;

  if (!win.info_label)
    return;

  if (sane_get_parameters (gsg_dialog_get_device (dialog), &win.params)
      == SANE_STATUS_GOOD)
    {
      double size =
	(double) win.params.bytes_per_line * (double) win.params.lines;
      const char *unit = "B";

      if (win.params.lines == -1)
	{
	  snprintf (buf, sizeof (buf), "%dxunknown: unknown size",
		    win.params.pixels_per_line);
	}
      else
	{
	  if (win.params.format >= SANE_FRAME_RED
	      && win.params.format <= SANE_FRAME_BLUE)
	    size *= 3;

	  if (size >= 1024 * 1024)
	    {
	      size /= 1024 * 1024;
	      unit = "MByte";
	    }
	  else if (size >= 1024)
	    {
	      size /= 1024;
	      unit = "kByte";
	    }
	  snprintf (buf, sizeof (buf),
		    "%dx%d    %1.1f %s \n%6ld f_count\n%2.2f fps   %2.2f fps_av",
		    win.params.pixels_per_line, win.params.lines, size, unit,
		    win.f_count, win.fps, win.fps_av);
	}
    }
  else
    snprintf (buf, sizeof (buf), "Invalid parameters.");
  gtk_label_set (GTK_LABEL (win.info_label), buf);

  DBG (DBG_debug, "xcam: update_param: exit\n");
}

static void
pref_xcam_save (void)
{
  char filename[PATH_MAX];
  int fd;

  DBG (DBG_debug, "xcam: pref_xcam_save: enter\n");
  /* first save xcam-specific preferences: */
  gsg_make_path (sizeof (filename), filename, "xcam", "xcam", 0, ".rc");
  fd = open (filename, O_WRONLY | O_CREAT | O_TRUNC, 0666);
  if (fd < 0)
    {
      char buf[256];

      snprintf (buf, sizeof (buf), "Failed to create file: %s.",
		strerror (errno));
      gsg_error (buf);
      return;
    }
  preferences_save (fd);
  close (fd);
  DBG (DBG_debug, "xcam: pref_xcam_save: exit\n");
}

static void
pref_xcam_restore (void)
{
  char filename[PATH_MAX];
  int fd;

  DBG (DBG_debug, "xcam: pref_xcam_restore: enter\n");
  gsg_make_path (sizeof (filename), filename, "xcam", "xcam", 0, ".rc");
  fd = open (filename, O_RDONLY);
  if (fd >= 0)
    {
      preferences_restore (fd);
      close (fd);
    }
  if (!preferences.filename)
    preferences.filename = strdup (OUTFILENAME);
  DBG (DBG_debug, "xcam: pref_xcam_restore: exit\n");
}


static void
load_settings (const char *filename, int silent)
{
  char buf[2 * PATH_MAX];
  char *end;
  int fd;

  DBG (DBG_debug, "xcam: load_settings: enter\n");

  fd = open (filename, O_RDONLY);
  if (fd < 0)
    {
      if (!silent)
	{
	  snprintf (buf, sizeof (buf), "Failed to open file %s: %s.",
		    filename, strerror (errno));
	  gsg_error (buf);
	}
      return;			/* fail silently */
    }

  /* first, read off the devicename that these settings are for: */
  read (fd, buf, sizeof (buf));
  buf[sizeof (buf) - 1] = '\0';
  end = strchr (buf, '\n');
  if (!end)
    {
      if (!silent)
	{
	  snprintf (buf, sizeof (buf), "File %s is malformed.", filename);
	  gsg_error (buf);
	}
      return;
    }
  *end = '\0';
  if (strcmp (dialog->dev_name, buf) != 0)
    switch_device_by_name (buf);

  /* position right behind device name: */
  lseek (fd, strlen (buf) + 1, SEEK_SET);

  sanei_load_values (fd, dialog->dev);
  close (fd);

  gsg_refresh_dialog (dialog);

  DBG (DBG_debug, "xcam: load_settings: exit\n");
}

static int
make_default_filename (size_t buf_size, char *buf, const char *dev_name)
{
  return gsg_make_path (buf_size, buf, "xcam", 0, dev_name, ".rc");
}

static void
load_defaults (int silent)
{
  char filename[PATH_MAX];
  int fd;

  DBG (DBG_debug, "xcam, load_defaults: enter\n");
  if (make_default_filename (sizeof (filename), filename, dialog->dev_name)
      < 0)
    return;
  if (fd < 0)
    return;
  load_settings (filename, silent);
  sanei_load_values (fd, dialog->dev);
  DBG (DBG_debug, "xcam, load_defaults: exit\n");
}

void
device_name_dialog_cancel (GtkWidget * widget, gpointer data)
{
  gtk_widget_destroy (data);
}

void
device_name_dialog_ok (GtkWidget * widget, gpointer data)
{
  GtkWidget *text = data;
  const char *name;

  name = gtk_entry_get_text (GTK_ENTRY (text));
  if (!name)
    return;			/* huh? how come? */
  switch_device_by_name (name);

  gtk_widget_destroy (gtk_widget_get_toplevel (text));
}

static void
prompt_for_device_name (GtkWidget * widget, gpointer data)
{
  GtkWidget *vbox, *hbox, *label, *text;
  GtkWidget *button, *dialog;
  
  DBG (DBG_debug, "xcam: prompt_for_device_name: enter\n");

  dialog = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  gtk_window_position (GTK_WINDOW (dialog), GTK_WIN_POS_MOUSE);
  gtk_window_set_title (GTK_WINDOW (dialog), "Device name");

  /* create the main vbox */
  vbox = gtk_vbox_new (TRUE, 5);
  gtk_container_border_width (GTK_CONTAINER (vbox), 5);
  gtk_container_add (GTK_CONTAINER (dialog), vbox);

  hbox = gtk_hbox_new (FALSE, 0);
  gtk_container_add (GTK_CONTAINER (vbox), hbox);

  label = gtk_label_new ("Device name:");
  gtk_container_add (GTK_CONTAINER (hbox), label);
  gtk_widget_show (label);

  text = gtk_entry_new ();
  gtk_container_add (GTK_CONTAINER (hbox), text);

  gtk_widget_show (hbox);

  /* the confirmation button */
  hbox = gtk_hbox_new (FALSE, 0);
  gtk_container_add (GTK_CONTAINER (vbox), hbox);

  button = gtk_button_new_with_label ("OK");
  GTK_WIDGET_SET_FLAGS (button, GTK_CAN_DEFAULT);
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
		      (GtkSignalFunc) device_name_dialog_ok, text);
  gtk_box_pack_start (GTK_BOX (hbox), button, TRUE, TRUE, 5);
  gtk_widget_grab_default (button);
  gtk_widget_show (button);

  button = gtk_button_new_with_label ("Cancel");
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
		      (GtkSignalFunc) device_name_dialog_cancel, dialog);
  gtk_box_pack_start (GTK_BOX (hbox), button, TRUE, TRUE, 5);
  gtk_widget_show (button);

  gtk_widget_show (hbox);
  gtk_widget_show (text);
  gtk_widget_show (vbox);
  gtk_widget_show (dialog);
  DBG (DBG_debug, "xcam: prompt_for_device_name: exit\n");
}

static void
exit_callback (GtkWidget * widget, gpointer data)
{
  if (dialog)
    gsg_destroy_dialog (dialog);
  dialog = 0;
  exit (0);
}

static void
save_defaults_callback (GtkWidget * widget, gpointer data)
{
  char buf[PATH_MAX];

  if (make_default_filename (sizeof (buf), buf, dialog->dev_name) < 0)
    return;
  save_settings (buf);
}

static void
load_defaults_callback (GtkWidget * widget, gpointer data)
{
  load_defaults (0);
}

static void
save_as_callback (GtkWidget * widget, gpointer data)
{
  if (gsg_get_filename ("File to save settings to", device_settings_filename,
			sizeof (device_settings_filename),
			device_settings_filename) < 0)
    return;
  save_settings (device_settings_filename);
}

static void
load_from_callback (GtkWidget * widget, gpointer data)
{
  if (gsg_get_filename
      ("File to load settings from", device_settings_filename,
       sizeof (device_settings_filename), device_settings_filename) < 0)
    return;
  load_settings (device_settings_filename, 0);
}

static void
buttons_disable (void)
{

  DBG (DBG_debug, "xcam: buttons_disable: enter\n");

  gsg_set_sensitivity (dialog, FALSE);
  gtk_widget_set_sensitive (win.play_stop_label, FALSE);
  gtk_widget_set_sensitive (win.save_frame_label, FALSE);
  gtk_widget_set_sensitive (win.rgb_bgr_label, FALSE);
  gtk_widget_set_sensitive (win.txt_label, FALSE);

  DBG (DBG_debug, "xcam: buttons_disable: exit\n");
}

static void
buttons_enable (void)
{

  DBG (DBG_debug, "xcam: buttons_enable: enter\n");

  gsg_set_sensitivity (dialog, TRUE);
  gtk_widget_set_sensitive (win.play_stop_label, TRUE);
  gtk_widget_set_sensitive (win.save_frame_label, TRUE);
  gtk_widget_set_sensitive (win.rgb_bgr_label, TRUE);
  gtk_widget_set_sensitive (win.txt_label, TRUE);

  DBG (DBG_debug, "xcam: buttons_enable: exit\n");
}

static GtkWidget *
build_files_menu (void)
{
  GtkWidget *menu, *item;
  
  DBG (DBG_debug, "xcam: build_files_menu: enter\n");

  menu = gtk_menu_new ();

  item = gtk_menu_item_new ();
  gtk_container_add (GTK_CONTAINER (menu), item);
  gtk_widget_show (item);

  item = gtk_menu_item_new_with_label ("Exit");
  gtk_container_add (GTK_CONTAINER (menu), item);
  gtk_signal_connect (GTK_OBJECT (item), "activate",
		      (GtkSignalFunc) exit_callback, 0);
  gtk_widget_show (item);

  DBG (DBG_debug, "xcam: build_files_menu: exit\n");
  return menu;
}

static gint
delayed_switch (gpointer data)
{
  switch_device (data);
  load_defaults (1);
  return FALSE;
}

static void
device_activate_callback (GtkWidget * widget, gpointer data)
{
  gtk_idle_add (delayed_switch, data);
}

static GtkWidget *
build_device_menu (void)
{
  GtkWidget *menu, *item;
  SANE_Status status;
  int i;

  menu = gtk_menu_new ();

  status = sane_get_devices (&device, SANE_FALSE);
  if (status != SANE_STATUS_GOOD)
    {
      fprintf (stderr, "%s: %s\n", prog_name, sane_strstatus (status));
      exit (1);
    }

  for (i = 0; device[i]; ++i)
    {
      item = gtk_menu_item_new_with_label ((char *) device[i]->name);
      gtk_container_add (GTK_CONTAINER (menu), item);
      gtk_signal_connect (GTK_OBJECT (item), "activate",
			  (GtkSignalFunc) device_activate_callback,
			  (gpointer) device[i]);
      gtk_widget_show (item);
    }

  item = gtk_menu_item_new ();
  gtk_container_add (GTK_CONTAINER (menu), item);
  gtk_widget_show (item);

  item = gtk_menu_item_new_with_label ("Refresh device list...");
  gtk_signal_connect (GTK_OBJECT (item), "activate",
		      (GtkSignalFunc) rescan_devices, 0);
  gtk_container_add (GTK_CONTAINER (menu), item);
  gtk_widget_show (item);

  item = gtk_menu_item_new_with_label ("Specify device name...");
  gtk_signal_connect (GTK_OBJECT (item), "activate",
		      (GtkSignalFunc) prompt_for_device_name, 0);
  gtk_container_add (GTK_CONTAINER (menu), item);
  gtk_widget_show (item);

  return menu;
}

static void
pref_toggle_advanced (GtkWidget * widget, gpointer data)
{
  preferences.advanced = (GTK_CHECK_MENU_ITEM (widget)->active != 0);
  gsg_set_advanced (dialog, preferences.advanced);
  pref_xcam_save ();
}

static void
pref_toggle_tooltips (GtkWidget * widget, gpointer data)
{
  preferences.tooltips_enabled = (GTK_CHECK_MENU_ITEM (widget)->active != 0);
  gsg_set_tooltips (dialog, preferences.tooltips_enabled);
  pref_xcam_save ();
}

static void
pref_toggle_twocolumn (GtkWidget * widget, gpointer data)
{
  preferences.twocolumn_enabled = (GTK_CHECK_MENU_ITEM (widget)->active != 0);
  gsg_set_twocolumn (dialog, preferences.twocolumn_enabled);
  pref_xcam_save ();
}

static GtkWidget *
build_preferences_menu (GSGDialog * dialog)
{
  GtkWidget *menu, *item;

  menu = gtk_menu_new ();

  /* advanced user option: */
  item = gtk_check_menu_item_new_with_label ("Show advanced options");
  gtk_check_menu_item_set_state (GTK_CHECK_MENU_ITEM (item),
				 preferences.advanced);
  gtk_menu_append (GTK_MENU (menu), item);
  gtk_widget_show (item);
  gtk_signal_connect (GTK_OBJECT (item), "toggled",
		      (GtkSignalFunc) pref_toggle_advanced, 0);

  /* tooltips submenu: */

  item = gtk_check_menu_item_new_with_label ("Show tooltips");
  gtk_check_menu_item_set_state (GTK_CHECK_MENU_ITEM (item),
				 preferences.tooltips_enabled);
  gtk_menu_append (GTK_MENU (menu), item);
  gtk_widget_show (item);
  gtk_signal_connect (GTK_OBJECT (item), "toggled",
		      (GtkSignalFunc) pref_toggle_tooltips, 0);

  /* twocolumn submenu: */

  item = gtk_check_menu_item_new_with_label ("Show two column display");
  gtk_check_menu_item_set_state (GTK_CHECK_MENU_ITEM (item),
				 preferences.twocolumn_enabled);
  gtk_menu_append (GTK_MENU (menu), item);
  gtk_widget_show (item);
  gtk_signal_connect (GTK_OBJECT (item), "toggled",
		      (GtkSignalFunc) pref_toggle_twocolumn, 0);

  item = gtk_menu_item_new ();
  gtk_container_add (GTK_CONTAINER (menu), item);
  gtk_widget_show (item);

  item = gtk_menu_item_new_with_label ("Save as default settings");
  gtk_container_add (GTK_CONTAINER (menu), item);
  gtk_signal_connect (GTK_OBJECT (item), "activate",
		      (GtkSignalFunc) save_defaults_callback, 0);
  gtk_widget_show (item);

  item = gtk_menu_item_new_with_label ("Load default settings");
  gtk_container_add (GTK_CONTAINER (menu), item);
  gtk_signal_connect (GTK_OBJECT (item), "activate",
		      (GtkSignalFunc) load_defaults_callback, 0);
  gtk_widget_show (item);

  item = gtk_menu_item_new ();
  gtk_container_add (GTK_CONTAINER (menu), item);
  gtk_widget_show (item);

  item = gtk_menu_item_new_with_label ("Save settings as...");
  gtk_container_add (GTK_CONTAINER (menu), item);
  gtk_signal_connect (GTK_OBJECT (item), "activate",
		      (GtkSignalFunc) save_as_callback, 0);
  gtk_widget_show (item);

  item = gtk_menu_item_new_with_label ("Load settings from...");
  gtk_container_add (GTK_CONTAINER (menu), item);
  gtk_signal_connect (GTK_OBJECT (item), "activate",
		      (GtkSignalFunc) load_from_callback, 0);
  gtk_widget_show (item);

  return menu;
}

static void
rescan_devices (GtkWidget * widget, gpointer client_data, gpointer call_data)
{
  gtk_widget_destroy (GTK_WIDGET (win.devices.menu));
  win.devices.menu = build_device_menu ();
  gtk_menu_item_set_submenu (GTK_MENU_ITEM (win.devices.item),
			     win.devices.menu);
}

#define READ_SANE_PIXEL(buf, buf_end, format, depth, r, g, b)		\
{									\
  switch (format)							\
    {									\
    case SANE_FRAME_GRAY:						\
      switch (depth)							\
	{								\
	case 1:								\
	  if (buf + 1 > buf_end)					\
	    goto end_of_buffer;						\
	  (r) = (g) = (b) = (*buf & src_mask) ? 0x0000 : 0xffff;	\
	  src_mask >>= 1;						\
	  if (src_mask == 0x00)						\
	    {								\
	      ++buf;							\
	      src_mask = 0x80;						\
	    }								\
	  break;							\
									\
	case 8:								\
	  if (buf + 1 > buf_end)					\
	    goto end_of_buffer;						\
	  (r) = (g) = (b) = (*buf++ << 8);				\
	  break;							\
									\
	case 16:							\
	  if (buf + 2 > buf_end)					\
	    goto end_of_buffer;						\
	  (r) = (g) = (b) = *((guint16 *) buf);			\
	  buf += 2;							\
	  break;							\
	}								\
      break;								\
									\
    case SANE_FRAME_RGB:						\
      switch (depth)							\
	{								\
	case 1:								\
	case 8:								\
	  if (buf + 3 > buf_end)					\
	    goto end_of_buffer;						\
	  (r) = buf[0] << 8; (g) = buf[1] << 8; (b) = buf[2] << 8;	\
	  buf += 3;							\
	  break;							\
									\
	case 16:							\
	  if (buf + 3 > buf_end)					\
	    goto end_of_buffer;						\
	  (r) = ((guint16 *)buf)[0];					\
	  (g) = ((guint16 *)buf)[1];					\
	  (b) = ((guint16 *)buf)[2];					\
	  buf += 6;							\
	  break;							\
	}								\
      break;								\
									\
    case SANE_FRAME_RED:						\
    case SANE_FRAME_GREEN:						\
    case SANE_FRAME_BLUE:						\
    default:								\
      fprintf (stderr, "%s: format %d not yet supported\n",		\
	       prog_name, (format));					\
      goto end_of_buffer;						\
    }									\
}

#define PUT_X11_PIXEL(buf, endian, depth, bpp, r, g, b, gl_map)		\
{									\
  switch (depth)							\
    {									\
    case  1: /* duh?  A Sun3 or what?? */				\
      lum = 3*(r) + 5*(g) + 2*(b);					\
      if (lum >= 5*0x8000)						\
	*buf |= dst_mask;						\
      dst_mask <<= 1;							\
      if (dst_mask > 0xff)						\
	{								\
	  buf += (bpp);							\
	  dst_mask = 0x01;						\
	}								\
      break;								\
									\
    case  8:								\
      lum = ((3*(r) + 5*(g) + 2*(b)) / (10 * 256/MAX_LUM)) >> 8;	\
      if (lum >= MAX_LUM)						\
	lum = MAX_LUM;							\
      buf[0] = (gl_map)[lum];						\
      buf += (bpp);							\
      break;								\
									\
    case 15:								\
      rgb = (  (((r) >> 11) << r_shift)	/* 5 bits of red */		\
	     | (((g) >> 11) << g_shift)	/* 5 bits of green */		\
	     | (((b) >> 11) << b_shift));/* 5 bits of blue */		\
      ((guint16 *)buf)[0] = rgb;					\
      buf += (bpp);							\
      break;								\
									\
    case 16:								\
      rgb = (  (((r) >> 11) << r_shift)	/* 5 bits of red */		\
	     | (((g) >> 10) << g_shift)/* 6 bits of green */		\
	     | (((b) >> 11) << b_shift));/* 5 bits of blue */		\
      ((guint16 *)buf)[0] = rgb;					\
      buf += (bpp);							\
      break;								\
									\
    case 24:								\
    case 32:								\
      if (bpp == 4)							\
	{								\
	  rgb = (  (((r) >> 8) << r_shift)				\
		 | (((g) >> 8) << g_shift)				\
		 | (((b) >> 8) << b_shift));				\
	  ((guint32 *)buf)[0] = rgb;					\
	}								\
      else								\
	{								\
	  if (   ((endian) == GDK_LSB_FIRST && r_shift == 0)		\
	      || ((endian) == GDK_MSB_FIRST && b_shift == 0))		\
	    {								\
	       buf[0] = (r) >> 8; buf[1] = (g) >> 8; buf[2] = (b) >> 8;	\
	    }								\
	  else								\
	    {								\
	       buf[0] = (b) >> 8; buf[1] = (g) >> 8; buf[2] = (r) >> 8;	\
	    }								\
	}								\
      buf += (bpp);							\
      break;								\
    }									\
}

static void
input_available (gpointer ignore, gint source, GdkInputCondition cond)
{
  int x, pixels_per_line, bytes_per_line, dst_depth, src_depth;
  guint32 r = 0, g = 0, b = 0, lum, rgb, src_mask, dst_mask;
  gint r_shift, b_shift, g_shift;
  size_t buf_size, remaining = win.remaining;
  SANE_Byte *src, *src_end;
  GdkByteOrder byte_order;
  u_long bytes_per_pixel;
  SANE_Frame format;
  SANE_Status status;
  SANE_Int len;
  u_char *dst;

  double max_value = 60;	/* min. 1 frame per min. */
  double frame_time = 50;	/* dummy value */

  DBG (DBG_debug, "xcam: input available: enter\n");

  if (!win.playing)
    /* looks like we got cancelled */
    goto stop_and_exit;

  buf_size = win.buf_backend_size;
  format = win.params.format;
  src_depth = win.params.depth;
  dst_depth = win.canvas.gdk_image->depth;
  pixels_per_line = win.params.pixels_per_line;
  bytes_per_line = win.canvas.gdk_image->bpl;
  bytes_per_pixel = win.canvas.gdk_image->bpp;
  byte_order = win.canvas.gdk_image->byte_order;

  x = win.x;
  dst = win.data;
  src_mask = 0x80;		/* SANE has left most bit is most significant bit */
  dst_mask = 0x01;

  r_shift = win.canvas.gdk_image->visual->red_shift;
  g_shift = win.canvas.gdk_image->visual->green_shift;
  b_shift = win.canvas.gdk_image->visual->blue_shift;

  while (1)
    {
      DBG (DBG_debug, "input available: enter sane_read\n");
      status = sane_read (gsg_dialog_get_device (dialog),
			  win.buf + remaining, buf_size - remaining, &len);
      if (status != SANE_STATUS_GOOD)
	{
	  if (status == SANE_STATUS_EOF)
	    {
	      display_image (&win.canvas);
	      stop_camera ();
	      if (win.playing)
		{
		  next_frame ();	/* arrange for next frame */
		  return;
		}
	    }
	  else
	    {
	      char buf[256];
	      sprintf (buf, "Error during read: %s.",
		       sane_strstatus (status));
	      gsg_error (buf);
	    }
	  win.playing = FALSE;
	  stop_camera ();
	  return;
	}
      win.f_count++;
      update_param (dialog, 0);
      win.i_time++;
      if (win.i_time >= 30)
	{
	  time (&win.time2);	/* time marker */

	  frame_time = difftime (win.time2, win.time1);

	  if (frame_time > max_value)
	    {
	      frame_time = max_value;
	    }

	  win.fps_old3 = win.fps_old2;
	  win.fps_old2 = win.fps_old1;
	  win.fps_old1 = win.fps;
	  win.fps = 30 / frame_time;	/* correction for loop 30 */
	  /* avarage last 4 frames times */
	  win.fps_av =
	    (win.fps_old3 + win.fps_old2 + win.fps_old1 + win.fps) / 4;

	  DBG (DBG_debug,
	       "xcam: input_available fps count=%d, frame_time * 30 = %2.3f,  fps=%2.3f, fps_av=%2.3f\n",
	       win.f_count, frame_time, win.fps, win.fps_av);
	  win.i_time = 0;

	  time (&win.time1);	/* time marker for new sequence */
	}
      update_param (dialog, 0);

      if (!len)
	break;

      if (win.value_txt == 1)
	{
	  strcpy (win.picmsg_ps, "xcam ");

	  status =
	    xcam_add_text (win.buf, win.params.pixels_per_line,
			   win.params.lines, win.picmsg_ps);
	  if (status != SANE_STATUS_GOOD)
	    {
	      DBG (DBG_info, "xcam: input available status NOK\n");
	      return;
	    }
	}

      src = win.buf;
      src_end = src + len + remaining;

      while (1)
	{
	  if (win.value_rgb == 0)
	    {
	      READ_SANE_PIXEL (src, src_end, format, src_depth, r, g, b);
	    }
	  else if (win.value_rgb == 1)
	    {
	      READ_SANE_PIXEL (src, src_end, format, src_depth, b, g, r);
	    }
	  PUT_X11_PIXEL (dst, byte_order, dst_depth, bytes_per_pixel, r, g, b,
			 win.canvas.graylevel);
	  if (++x >= pixels_per_line)
	    {
	      x = 0;
	      dst += bytes_per_line - pixels_per_line * bytes_per_pixel;
	    }
	}
    end_of_buffer:
      remaining = src_end - src;
    }
  win.data = dst;
  win.x = x;
  win.remaining = remaining;
  DBG (DBG_debug, "xcam: input available: exit\n");
  return;

stop_and_exit:
  win.playing = FALSE;
  stop_camera ();
  DBG (DBG_debug, "xcam: input available: stop and exit\n");
  return;
}

static void
next_frame (void)
{
  char buf[256];
  SANE_Status status;
  int fd;
  DBG (DBG_debug, "xcam: next frame enter\n");
  buttons_disable ();

  DBG (DBG_debug, "xcam: next frame, start gsg_sync\n");
  gsg_sync (dialog);

  status = sane_start (gsg_dialog_get_device (dialog));
  if (status != SANE_STATUS_GOOD)
    {
      sprintf (buf, "Failed to start webcam: %s.", sane_strstatus (status));
      gsg_error (buf);
      win.playing = FALSE;
      stop_camera ();
      return;
    }

  status = sane_get_parameters (gsg_dialog_get_device (dialog), &win.params);
  if (status != SANE_STATUS_GOOD)
    {
      sprintf (buf, "Failed to get parameters: %s.", sane_strstatus (status));
      gsg_error (buf);
      win.playing = FALSE;
      stop_camera ();
      return;
    }

  if (!win.canvas.gdk_image
      || win.canvas.gdk_image->width != win.params.pixels_per_line
      || win.canvas.gdk_image->height != win.params.lines)
    {
      GdkImageType image_type = GDK_IMAGE_FASTEST;

      if (win.canvas.gdk_image)
	gdk_image_destroy (win.canvas.gdk_image);
#ifdef __alpha__
      /* Some X servers seem to have a problem with shared images that
         have a width that is not a multiple of 8.  Duh... ;-( */
      if (win.params.pixels_per_line % 8)
	image_type = GDK_IMAGE_NORMAL;
#endif
      win.canvas.gdk_image =
	gdk_image_new (image_type,
		       gdk_window_get_visual (win.canvas.preview->window),
		       win.params.pixels_per_line, win.params.lines);
      gtk_widget_set_usize (win.canvas.preview,
			    win.params.pixels_per_line, win.params.lines);
    }
  win.data = win.canvas.gdk_image->mem;
  win.x = 0;
  win.remaining = 0;



  buttons_enable ();
  if (sane_set_io_mode (gsg_dialog_get_device (dialog), SANE_TRUE)
      == SANE_STATUS_GOOD
      && sane_get_select_fd (gsg_dialog_get_device (dialog), &fd)
      == SANE_STATUS_GOOD)
    win.gdk_input_tag =
      gdk_input_add (fd, GDK_INPUT_READ, input_available, 0);
  else
    input_available (0, -1, 0);

  DBG (DBG_debug, "xcam: next frame: exit\n");
}

static void
play_stop_button (GtkWidget * widget, gpointer client_data,
		  gpointer call_data)
{
  DBG (DBG_debug, "xcam: play_stop_button: enter\n");
  if (!dialog)
    return;

  if (win.playing)
    {
      win.playing = FALSE;
      gtk_label_set (GTK_LABEL (win.play_stop_label), " Play ");
      DBG (DBG_debug, "xcam: wait for play button to be pushed\n");
    }
  else if (win.gdk_input_tag < 0)
    {
      win.playing = TRUE;
      gtk_label_set (GTK_LABEL (win.play_stop_label), " Stop ");
      DBG (DBG_debug, "xcam: wait for stop button to be pushed\n");
      next_frame ();
    }
  DBG (DBG_debug, "xcam: play_stop_button: exit\n");
}

/* Invoked when the save frame button is pressed */
static void
save_frame_button (GtkWidget * widget, gpointer client_data,
		   gpointer call_data)
{
  char buf[256];
  char testfilename[256];

  DBG (DBG_debug, "xcam: save_frame_button\n");
  if (!dialog)
    return;

  if (win.saving)
    win.saving = FALSE;
  else if (win.gdk_input_tag < 0)
    {
      win.saving = TRUE;
      gtk_label_set (GTK_LABEL (win.save_frame_label), "Saving started");
/* ------------------------------------------ */

      /* test for pnm formats */
      strncpy (testfilename, preferences.filename, sizeof (testfilename));
      testfilename[sizeof (testfilename)] = 0;
      g_strreverse (testfilename);
      if (!((!strncmp (testfilename, "mnp.", 4)) ||
	    (!strncmp (testfilename, "mgp.", 4)) ||
	    (!strncmp (testfilename, "mbp.", 4)) ||
	    (!strncmp (testfilename, "mpp.", 4)) ||
	    (!strncmp (testfilename, "MNP.", 4)) ||
	    (!strncmp (testfilename, "MGP.", 4)) ||
	    (!strncmp (testfilename, "MBP.", 4)) ||
	    (!strncmp (testfilename, "MPP.", 4))))
	{
	  snprintf (buf, sizeof (buf),
		    "Failed to scan, wrong file extension, use pnm, pgm, pbm or ppm `%s'",
		    preferences.filename);
	  gsg_error (buf);
	  return;
	}
      win.out = fopen (preferences.filename, "w");
      if (!win.out)
	{
	  snprintf (buf, sizeof (buf), "Failed to open `%s': %s",
		    preferences.filename, strerror (errno));
	  gsg_error (buf);
	  return;
	}
    }
  buttons_disable ();
  save_frame ();
  buttons_enable ();
  gsg_sync (dialog);
  gtk_label_set (GTK_LABEL (win.save_frame_label), "Save\nFrame");
  DBG (DBG_debug, "xcam: save_frame_button: exit\n");
}

/* Invoked when the TXT button is pressed */
static void
txt_button (GtkWidget * widget, gpointer client_data, gpointer call_data)
{
  DBG (DBG_debug, "xcam: txt_button\n");
  if (!dialog)
    return;

  if (win.saving)
    {
      win.saving = FALSE;
      win.value_txt = 0;
      gtk_label_set (GTK_LABEL (win.txt_label), " TXT \n OFF ");
    }
  else if (win.gdk_input_tag < 0)
    {
      win.saving = TRUE;
      gtk_label_set (GTK_LABEL (win.txt_label), " TXT \n ON  ");
      win.value_txt = 1;
    }
  gsg_sync (dialog);
  DBG (DBG_debug, "xcam: txt_button: exit\n");
}

/* Invoked when the RGB-BGR button is pressed */
static void
rgb_bgr_button (GtkWidget * widget, gpointer client_data, gpointer call_data)
{
  DBG (DBG_debug, "xcam: rgb_bgr_button\n");
  if (!dialog)
    return;

  if (win.saving)
    {
      win.saving = FALSE;
      win.value_rgb = 0;
      gtk_label_set (GTK_LABEL (win.rgb_bgr_label), "RGB");
    }
  else if (win.gdk_input_tag < 0)
    {
      win.saving = TRUE;
      gtk_label_set (GTK_LABEL (win.rgb_bgr_label), "BGR");
      win.value_rgb = 1;
    }
  gsg_sync (dialog);
  DBG (DBG_debug, "xcam: rgb_bgr_button: exit\n");
}

static void
save_frame (void)
{
  SANE_Handle dev = gsg_dialog_get_device (dialog);

  const char *frame_type = 0;
  char buf[256];
  int fd;

  DBG (DBG_debug, "xcam: save_frame: enter\n");

  win.x = win.y = 0;

  win.num_bytes = win.params.lines * win.params.bytes_per_line;
  win.bytes_read = 0;
  win.have_odd_byte = FALSE;

  switch (win.params.format)
    {
    case SANE_FRAME_RGB:
      frame_type = "RGB";
      break;
    case SANE_FRAME_RED:
      frame_type = "red";
      break;
    case SANE_FRAME_GREEN:
      frame_type = "green";
      break;
    case SANE_FRAME_BLUE:
      frame_type = "blue";
      break;
    case SANE_FRAME_GRAY:
      frame_type = "gray";
      break;
    }

  if (!win.header_size)
    {
      switch (win.params.format)
	{
	case SANE_FRAME_RED:
	case SANE_FRAME_GREEN:
	case SANE_FRAME_BLUE:
	  if (win.params.depth > 8)
	    {
	      gsg_set_sensitivity (dialog, TRUE);
	      snprintf (buf, sizeof (buf),
			"Separate channel transfers are not supported "
			"with %d bits/channel.", win.params.depth);
	      gsg_error (buf);

	      buttons_enable ();
	      return;
	    }
	 /*FALLTHROUGH*/ case SANE_FRAME_RGB:
	  fprintf (win.out, "P6\n# SANE data follows\n%d %d\n%d\n",
		   win.params.pixels_per_line, win.params.lines,
		   (win.params.depth <= 8) ? 255 : 65535);
	  break;

	case SANE_FRAME_GRAY:
	  if (win.params.depth == 1)
	    fprintf (win.out, "P4\n# SANE data follows\n%d %d\n",
		     win.params.pixels_per_line, win.params.lines);
	  else
	    fprintf (win.out, "P5\n# SANE data follows\n%d %d\n%d\n",
		     win.params.pixels_per_line, win.params.lines,
		     (win.params.depth <= 8) ? 255 : 65535);
	  break;
	}
      win.header_size = ftell (win.out);
      fwrite (win.buf, 1, win.num_bytes, win.out);
      fclose (win.out);
      win.out = 0;
    }
  if (win.params.format >= SANE_FRAME_RED
      && win.params.format <= SANE_FRAME_BLUE)
    fseek (win.out,
	   win.header_size + win.params.format - SANE_FRAME_RED, SEEK_SET);
  snprintf (buf, sizeof (buf), "Receiving %s data for `%s'...",
	    frame_type, preferences.filename);

  win.input_tag = -1;
  if (sane_set_io_mode (dev, SANE_TRUE) == SANE_STATUS_GOOD
      && sane_get_select_fd (dev, &fd) == SANE_STATUS_GOOD)
    win.input_tag = gdk_input_add (fd, GDK_INPUT_READ | GDK_INPUT_EXCEPTION,
				   input_available, 0);
  else
    {
      while (gtk_events_pending ())
	gtk_main_iteration ();
      input_available (0, -1, GDK_INPUT_READ);
    }

  DBG (DBG_debug, "xcam: save_frame: exit\n");
}

static void
xcam_exit (void)
{
  static int active = 0;

  DBG (DBG_debug, "xcam: xcam_exit: enter\n");
  if (active)
    return;

  active = 1;
  pref_xcam_save ();
  sane_exit ();
  /* this has the habit of calling exit itself: */
  gtk_exit (0);
  DBG (DBG_debug, "xcam: xcam_exit: exit\n");
}

/* Invoked when window manager's "delete" (or "close") function is
   invoked.  */
static gint
xcam_win_delete (GtkWidget * w, gpointer data)
{
  xcam_exit ();
  return FALSE;
}

static void
browse_filename_callback (GtkWidget * widget, gpointer data)
{
  char filename[1024];

  DBG (DBG_debug, "xcam: browse_filename_callback\n");
  if (preferences.filename)
    {
      strncpy (filename, preferences.filename, sizeof (filename));
      filename[sizeof (filename) - 1] = '\0';
    }
  else
    strcpy (filename, OUTFILENAME);
  gsg_get_filename ("Output Filename", filename, sizeof (filename), filename);
  gtk_entry_set_text (GTK_ENTRY (win.filename_entry), filename);

  if (preferences.filename)
    free ((void *) preferences.filename);
  preferences.filename = strdup (filename);
  DBG (DBG_debug, "xcam: browse_filename_callback: exit\n");
}

static void
filename_changed_callback (GtkWidget * widget, gpointer data)
{
  DBG (DBG_debug, "xcam: filename_changed_callback\n");
  if (preferences.filename)
    free ((void *) preferences.filename);
  preferences.filename = strdup (gtk_entry_get_text (GTK_ENTRY (widget)));
  pref_xcam_save ();
  DBG (DBG_debug, "xcam: filename_changed_callbackcallback: exit\n");
}

static void
usage (void)
{
  printf ("Usage: %s [OPTION]... [DEVICE]\n\
\n\
Start up graphical user interface to access SANE (Scanner Access Now\n\
Easy) devices.\n\
\n\
-h, --help                 display this help message and exit\n\
-B, --buffersize           set buffersize 1024 * 1024\n\
-V, --version              print version information\n", prog_name);
}

int
main (int argc, char **argv)
{
  GtkWidget *menu, *menu_bar, *menu_bar_item, *preview_vbox;
  GtkWidget *hbox, *vbox, *button, *alignment, *frame, *label, *text,
    *scrolled_window;
  int i;
  int ch;
  SANE_Status status;

  DBG_INIT ();

  DBG (DBG_debug, "xcam: main\n");
  DBG (DBG_error, "xcam (version: %s, package: %s) starting\n", VERSION,
       PACKAGE);

  win.buf_backend_size = (32 * 1024);

  pref_xcam_restore ();

  prog_name = strrchr (argv[0], '/');
  if (prog_name)
    ++prog_name;
  else
    prog_name = argv[0];

  /* turn on by default as we don't support graphical geometry selection */
  preferences.advanced = 1;

  status = sane_init (0, 0);
  if (status != SANE_STATUS_GOOD)
    {
      DBG (DBG_fatal, "init: sane_main failed: %s\n",
	   sane_strstatus (status));
      exit (1);
    }

  if (argc > 1)
    {

      while ((ch = getopt_long (argc, argv, "hBV", long_options, 0)) != EOF)
	{
	  switch (ch)
	    {
	    case 'V':
	      printf ("xcam (%s) %s\n", PACKAGE, VERSION);
	      exit (0);

	    case 'B':
	      win.buf_backend_size = 1024 * 1024;
	      break;
	    case 'h':
	    default:
	      usage ();
	      exit (0);
	    }
	}
    }

  DBG (DBG_debug, "xcam.main: buf_backend_size 0x%x\n", win.buf_backend_size);

  win.buf = malloc (win.buf_backend_size);

  gdk_set_show_events (0);
  gtk_init (&argc, &argv);

  atexit (xcam_exit);

  win.gdk_input_tag = -1;
  win.shell = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  gtk_window_set_title (GTK_WINDOW (win.shell), (char *) prog_name);
  gtk_signal_connect (GTK_OBJECT (win.shell), "delete_event",
		      GTK_SIGNAL_FUNC (xcam_win_delete), NULL);

  vbox = gtk_vbox_new (FALSE, 0);
  gtk_container_border_width (GTK_CONTAINER (vbox), 0);
  gtk_container_add (GTK_CONTAINER (win.shell), vbox);
  gtk_widget_show (vbox);

  menu_bar = gtk_menu_bar_new ();

  win.devices.menu = build_device_menu ();

  /* "Files" entry: */
  menu_bar_item = gtk_menu_item_new_with_label ("File");
  gtk_container_add (GTK_CONTAINER (menu_bar), menu_bar_item);
  menu = build_files_menu ();
  gtk_menu_item_set_submenu (GTK_MENU_ITEM (menu_bar_item), menu);
  gtk_widget_show (menu_bar_item);

  /* "Devices" entry: */
  win.devices.item = gtk_menu_item_new_with_label ("Devices");
  gtk_container_add (GTK_CONTAINER (menu_bar), win.devices.item);
  gtk_menu_item_set_submenu (GTK_MENU_ITEM (win.devices.item),
			     win.devices.menu);
  gtk_widget_show (win.devices.item);

  /* "Preferences" entry: */
  menu_bar_item = gtk_menu_item_new_with_label ("Preferences");
  gtk_container_add (GTK_CONTAINER (menu_bar), menu_bar_item);
  gtk_menu_item_set_submenu (GTK_MENU_ITEM (menu_bar_item),
			     build_preferences_menu (dialog));
  gtk_widget_show (menu_bar_item);

  gtk_box_pack_start (GTK_BOX (vbox), menu_bar, FALSE, FALSE, 0);
  gtk_widget_show (menu_bar);

  /* add device info at top: */
  frame = gtk_frame_new (0);
  gtk_container_border_width (GTK_CONTAINER (frame), 8);
  gtk_frame_set_shadow_type (GTK_FRAME (frame), GTK_SHADOW_ETCHED_IN);
  gtk_box_pack_start (GTK_BOX (vbox), frame, FALSE, FALSE, 0);
  gtk_widget_show (frame);

  win.device_info_label = gtk_label_new ("");
  gtk_widget_show (win.device_info_label);
  gtk_container_add (GTK_CONTAINER (frame), win.device_info_label);

  hbox = gtk_hbox_new (FALSE, 0);
  gtk_container_add (GTK_CONTAINER (vbox), hbox);
  gtk_widget_show (hbox);

  /* create the device dialog box: */
  win.dialog_box = gtk_vbox_new (FALSE, 0);
  gtk_widget_show (win.dialog_box);

  DBG (DBG_debug, "xcam main, preview vbox on the left hand side \n");
  /* the preview vbox on the left hand side: */
  preview_vbox = gtk_vbox_new (FALSE, 0);
  gtk_box_pack_start (GTK_BOX (hbox), preview_vbox, TRUE, TRUE, 0);

  frame = gtk_frame_new ("Image view");
  gtk_container_border_width (GTK_CONTAINER (frame), 8);
  gtk_frame_set_shadow_type (GTK_FRAME (frame), GTK_SHADOW_ETCHED_IN);
  gtk_container_add (GTK_CONTAINER (preview_vbox), frame);

  alignment = gtk_alignment_new (0, 0.5, 1.0, 1.0);
  gtk_box_pack_start (GTK_BOX (preview_vbox), alignment, TRUE, TRUE, 0);

  win.canvas.preview = gtk_drawing_area_new ();
  gtk_drawing_area_size (GTK_DRAWING_AREA (win.canvas.preview), 320, 200);
  gtk_widget_set_events (win.canvas.preview, CANVAS_EVENT_MASK);
  gtk_signal_connect (GTK_OBJECT (win.canvas.preview), "event",
		      (GtkSignalFunc) canvas_events, 0);
  gtk_container_add (GTK_CONTAINER (frame), win.canvas.preview);

  gtk_widget_show (win.canvas.preview);
  gtk_widget_show (alignment);
  gtk_widget_show (frame);
  gtk_widget_show (preview_vbox);

  win.canvas.graylevel_cmap = gdk_colormap_get_system ();
  for (i = 0; i < NELEMS (win.canvas.graylevel); ++i)
    {
      GdkColor color;
      color.red = color.green = color.blue =
	i * 0xffff / (NELEMS (win.canvas.graylevel) - 1);
      gdk_color_alloc (win.canvas.graylevel_cmap, &color);
      win.canvas.graylevel[i] = color.pixel;
    }

#if 0
  {
    win.canvas.cube_cmap
      = gdk_colormap_new (win.canvas.preview->window->visual, 1);
    for (i = 0; i < NELEMS (win.canvas.cube_colors); ++i)
      {
	win.canvas.cube_colors[i].pixel = i;
	win.canvas.cube_colors[i].red = ((i / 30) % 5) * 0xffff / 4;
	win.canvas.cube_colors[i].green = ((i / 5) % 6) * 0xffff / 5;
	win.canvas.cube_colors[i].blue = ((i % 5)) * 0xffff / 4;
      }
    gdk_colors_store (win.canvas.cube_cmap, win.canvas.cube_colors,
		      NELEMS (win.canvas.cube_colors));
    gdk_window_set_colormap (win.shell->window, win.canvas.cube_cmap);
  }
#endif

  DBG (DBG_debug, "xcam main, use a scrolled window \n");

  /* use a scrolled window to show the device options, as in xscanimage */
  scrolled_window = gtk_scrolled_window_new (NULL, NULL);
  gtk_scrolled_window_set_policy (GTK_SCROLLED_WINDOW (scrolled_window),
				  GTK_POLICY_NEVER, GTK_POLICY_AUTOMATIC);
  gtk_scrolled_window_set_placement (GTK_SCROLLED_WINDOW (scrolled_window),
				     GTK_CORNER_TOP_RIGHT);
  gtk_scrolled_window_add_with_viewport (GTK_SCROLLED_WINDOW
					 (scrolled_window), win.dialog_box);
  gtk_container_add (GTK_CONTAINER (hbox), scrolled_window);

  gtk_widget_show (GTK_WIDGET (scrolled_window));

  if (device[0])
    {
      switch_device (device[0]);
      load_defaults (1);
    }
  else
    {
      DBG (DBG_fatal,
	   "   No vidcams were identified. If you were expecting something\n"
	   "          different, check that the vidcam is plugged in, turned on and\n"
	   "          detected by sane-find-scanner (if appropriate). Please read\n"
	   "          the documentation which came with this software (README, FAQ,\n"
	   "          manpages).\n");
      atexit (xcam_exit);
    }

  if (dialog && gsg_dialog_get_device (dialog)
      && (sane_get_parameters (gsg_dialog_get_device (dialog), &win.params)
	  == SANE_STATUS_GOOD))
    {
      gtk_widget_set_usize (win.canvas.preview,
			    win.params.pixels_per_line, win.params.lines);
    }

  /* The bottom row */

  DBG (DBG_debug, "xcam main, button row: info\n");

  /* The info row */
  hbox = gtk_hbox_new (FALSE, 5);
  gtk_container_border_width (GTK_CONTAINER (hbox), 3);
  gtk_box_pack_start (GTK_BOX (vbox), hbox, FALSE, FALSE, 0);
  gtk_widget_show (hbox);

  frame = gtk_frame_new (NULL);
  gtk_frame_set_shadow_type (GTK_FRAME (frame), GTK_SHADOW_IN);
  gtk_box_pack_start (GTK_BOX (hbox), frame, FALSE, FALSE, 0);
  gtk_widget_show (frame);

  hbox = gtk_hbox_new (FALSE, 5);
  gtk_container_border_width (GTK_CONTAINER (hbox), 2);
  gtk_container_add (GTK_CONTAINER (frame), hbox);
  gtk_widget_show (hbox);

  win.info_label =
    gtk_label_new ("0 x 0 0 kByte \n0 f_count \n0 fps  0 fps_av");
  gtk_box_pack_start (GTK_BOX (hbox), win.info_label, FALSE, FALSE, 0);
  gtk_widget_show (win.info_label);

  win.f_count = 0;
  win.fps = 0;
  win.fps_av = 0;
  win.i_time = 0;
  time (&win.time1);		/* first time marker */
  update_param (dialog, 0);

  DBG (DBG_debug, "xcam main, bottom row: rgb-bgr button\n");

  /* The TXT button */
  button = gtk_button_new_with_label (" TXT ");
  win.txt_label = GTK_BIN (button)->child;
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
		      (GtkSignalFunc) txt_button, dialog);
  gtk_box_pack_start (GTK_BOX (hbox), button, FALSE, FALSE, 0);
  gtk_widget_show (button);
  DBG (DBG_debug, "xcam main, bottom row: txt button\n");

  /* The RGB-BGR button */
  button = gtk_button_new_with_label ("RGB");
  win.rgb_bgr_label = GTK_BIN (button)->child;
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
		      (GtkSignalFunc) rgb_bgr_button, dialog);
  gtk_box_pack_start (GTK_BOX (hbox), button, FALSE, FALSE, 0);
  gtk_widget_show (button);

  DBG (DBG_debug, "xcam main, bottom row: play button\n");

  /* The Play button */
  button = gtk_button_new_with_label (" Play ");
  win.play_stop_label = GTK_BIN (button)->child;
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
		      (GtkSignalFunc) play_stop_button, dialog);
  gtk_box_pack_start (GTK_BOX (hbox), button, FALSE, FALSE, 0);
  gtk_widget_show (button);

  DBG (DBG_debug, "xcam main, bottom row: save frame button\n");

  /* The Save Frame button */
  button = gtk_button_new_with_label ("Save\nFrame");
  win.save_frame_label = GTK_BIN (button)->child;
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
		      (GtkSignalFunc) save_frame_button, dialog);
  gtk_box_pack_start (GTK_BOX (hbox), button, FALSE, FALSE, 0);
  gtk_widget_show (button);

  DBG (DBG_debug, "xcam main, bottom row: output filename part\n");

  /*  output filename  part */
  frame = gtk_frame_new ("Output");
  gtk_container_border_width (GTK_CONTAINER (frame), 4);
  gtk_frame_set_shadow_type (GTK_FRAME (frame), GTK_SHADOW_ETCHED_IN);
  gtk_box_pack_start (GTK_BOX (hbox), frame, FALSE, FALSE, 0);

  hbox = gtk_hbox_new (FALSE, 2);
  gtk_container_border_width (GTK_CONTAINER (hbox), 2);
  gtk_container_add (GTK_CONTAINER (frame), hbox);

  label = gtk_label_new ("Filename");
  gtk_box_pack_start (GTK_BOX (hbox), label, FALSE, FALSE, 2);

  text = gtk_entry_new ();
  gtk_entry_set_text (GTK_ENTRY (text), (char *) preferences.filename);
  gtk_box_pack_start (GTK_BOX (hbox), text, TRUE, TRUE, 2);
  gtk_signal_connect (GTK_OBJECT (text), "changed",
		      (GtkSignalFunc) filename_changed_callback, 0);

  win.filename_entry = text;

  button = gtk_button_new_with_label ("Browse");
  gtk_box_pack_start (GTK_BOX (hbox), button, FALSE, FALSE, 2);
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
		      (GtkSignalFunc) browse_filename_callback, 0);

  gtk_widget_show (button);
  gtk_widget_show (label);
  gtk_widget_show (text);
  gtk_widget_show (hbox);
  gtk_widget_show (frame);

  gtk_widget_show (win.shell);
  gtk_main ();

  pref_xcam_save ();

  DBG (DBG_debug, "xcam main exit\n");
  return 0;
}
