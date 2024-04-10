/* xscanimage -- a graphical scanner-oriented SANE frontend

   Authors:
   Andreas Beck <becka@sunserver1.rz.uni-duesseldorf.de>
   Tristan Tarrant <ttarrant@etnoteam.it>
   David Mosberger-Tang <davidm@azstarnet.com>

   Copyright (C) 1997, 1998 Andreas Beck, Tristan Tarrant, and David
   Mosberger

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
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.  */

#ifdef _AIX
# include "../include/lalloca.h"	/* MUST come first for AIX! */
#endif

#include "../include/sane/config.h"
#include "../include/lalloca.h"

#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <gtkglue.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/stat.h>

#include <sane/sane.h>
#include <sane/saneopts.h>
#include "../include/sane/sanei.h"

#define BACKEND_NAME xscanimage
#include "../include/sane/sanei_debug.h"

#include <progress.h>
#include <preferences.h>
#include <preview.h>

#ifndef PATH_MAX
# define PATH_MAX	1024
#endif

#define OUTFILENAME	"out.pnm"

#ifdef HAVE_LIBGIMP_GIMP_H

#include <libgimp/gimp.h>

# ifdef HAVE_LIBGIMP_GIMPFEATURES_H
#  include <libgimp/gimpfeatures.h>
# elif defined(ENABLE_GIMP_1_2)
#  define GIMP_CHECK_VERSION(major, minor, micro) 0
# endif	/* HAVE_LIBGIMP_GIMPFEATURES_H */

#ifndef ENABLE_GIMP_1_2
# define GIMP_HAVE_RESOLUTION_INFO
#endif /* !ENABLE_GIMP_1_2 */

# ifdef GIMP_CHECK_VERSION
#  if GIMP_CHECK_VERSION(1,1,25)
/* ok, we have the new gimp interface */
#  else
/* we have the old gimp interface and need the compatibility header file */
#   include "xscanimage-gimp-1_0-compat.h"
#  endif
# else
#  ifdef ENABLE_GIMP_1_2
/* we have the old gimp interface and need the compatibility header file */
#   include "xscanimage-gimp-1_0-compat.h"
#  endif /* ENABLE_GIMP_1_2 */
# endif

static void query (void);
#ifndef ENABLE_GIMP_1_2
static void run (const gchar * name, gint nparams, const GimpParam * param,
		 gint * nreturn_vals, GimpParam ** return_vals);
#else
static void run (char *name, int nparams, GimpParam * param,
		 int *nreturn_vals, GimpParam ** return_vals);
#endif /* !ENABLE_GIMP_1_2 */

GimpPlugInInfo PLUG_IN_INFO = {
  NULL,				/* init_proc */
  NULL,				/* quit_proc */
  query,			/* query_proc */
  run,				/* run_proc */
};

#endif /* HAVE_LIBGIMP_GIMP_H */

#define DBG_fatal 0
#define DBG_error 1
#define DBG_warning 2
#define DBG_info 3
#define DBG_debug 4

enum
{
  STANDALONE, SANE_GIMP_EXTENSION
};

static struct
{
  GtkWidget *shell;
  GtkWidget *menubar;
  GtkWidget *hruler;
  GtkWidget *vruler;
  GtkWidget *info_label;
  GtkWidget *preview_button;
  GtkWidget *scan_button;
  Preview *preview;
  gint32 mode;
  /* various scanning related state: */
  size_t num_bytes;
  size_t bytes_read;
  Progress_t *progress;
  int input_tag;
  SANE_Parameters param;
  int x, y;
  /* for standalone mode: */
  GtkWidget *filename_entry;
  FILE *out;
  long header_size;
  gboolean have_odd_byte;
  guint8 odd_byte;
#ifdef HAVE_LIBGIMP_GIMP_H
  /* for GIMP mode: */
  gint32 image_ID;
  GimpDrawable *drawable;
  guchar *tile;
  unsigned tile_offset;
  GimpPixelRgn region;
  int first_frame;		/* used for RED/GREEN/BLUE frames */
#endif
}
scan_win;

static const char *prog_name;
static GtkWidget *choose_device_dialog;
static GSGDialog *dialog;
static const SANE_Device **devlist;
static gint seldev = -1;	/* The selected device */
static gint defdev = -1;	/* The default device */
static gint ndevs;		/* The number of available devices */
static gboolean little_endian;	/* Is this computer little-endian ? */
static struct option long_options[] = {
  {"help", no_argument, NULL, 'h'},
  {"version", no_argument, NULL, 'V'},
  {0, 0, 0, 0}
};


static int gtk_quit_flag;	/* Call gtk_main_quit() only if at least one device
				   device is found. */

/* forward declarations: */

int main (int argc, char **argv);
static void interface (int argc, char **argv);
static void scan_start (void);
static void scan_done (void);

/* Test if this machine is little endian (from coolscan.c) */
static gboolean
calc_little_endian (void)
{
  SANE_Int testvalue = 255;
  u_int8_t *firstbyte = (u_int8_t *) & testvalue;

  if (*firstbyte == 255)
    return TRUE;
  return FALSE;
}

#ifdef HAVE_LIBGIMP_GIMP_H

static int
encode_devname (const char *devname, int n, char *buf)
{
  static const char hexdigit[] = "0123456789abcdef";
  char *dst, *limit;
  const char *src;
  char ch;

  DBG_INIT ();

  DBG (DBG_debug, "encode_devname\n");
  limit = buf + n;
  for (src = devname, dst = buf; *src; ++src)
    {
      if (dst >= limit)
	return -1;

      ch = *src;
      /* don't use the ctype.h macros here since we don't want to
         allow anything non-ASCII here... */
      if ((ch >= '0' && ch <= '9')
	  || (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z'))
	*dst++ = ch;
      else
	{
	  /* encode */

	  if (dst + 4 >= limit)
	    return -1;

	  *dst++ = '-';
	  if (ch == '-')
	    *dst++ = '-';
	  else
	    {
	      *dst++ = hexdigit[(ch >> 4) & 0x0f];
	      *dst++ = hexdigit[(ch >> 0) & 0x0f];
	      *dst++ = '-';
	    }
	}
    }
  if (dst >= limit)
    return -1;
  *dst = '\0';
  DBG (DBG_debug, "encode_devname: %s --> %s\n", devname, buf);

  return 0;
}

static int
decode_devname (const char *encoded_devname, int n, char *buf)
{
  char *dst, *limit;
  const char *src;
  char ch, val;

  DBG_INIT ();

  DBG (DBG_debug, "decode_devname\n");
  limit = buf + n;
  for (src = encoded_devname, dst = buf; *src; ++dst)
    {
      if (dst >= limit)
	return -1;

      ch = *src++;
      /* don't use the ctype.h macros here since we don't want to
         allow anything non-ASCII here... */
      if (ch != '-')
	*dst = ch;
      else
	{
	  /* decode */

	  ch = *src++;
	  if (ch == '-')
	    *dst = ch;
	  else
	    {
	      if (ch >= 'a' && ch <= 'f')
		val = (ch - 'a') + 10;
	      else
		val = (ch - '0');
	      val <<= 4;

	      ch = *src++;
	      if (ch >= 'a' && ch <= 'f')
		val |= (ch - 'a') + 10;
	      else
		val |= (ch - '0');

	      *dst = val;

	      ++src;		/* simply skip terminating '-' for now... */
	    }
	}
    }
  if (dst >= limit)
    return -1;
  *dst = '\0';
  DBG (DBG_debug, "deccode_devname: %s -> %s\n", encoded_devname, buf);
  return 0;
}

static void
query (void)
{
  static GimpParamDef args[] = {
    {GIMP_PDB_INT32, "run_mode", "Interactive, non-interactive"},
  };
  static GimpParamDef *return_vals = NULL;
  static int nargs = sizeof (args) / sizeof (args[0]);
  static int nreturn_vals = 0;
  char mpath[1024];
  char name[1024];
  size_t len;
  int i, j;
  SANE_Status status;

  DBG_INIT ();

  DBG (DBG_debug, "query\n");
  gimp_install_procedure ("xscanimage",
			  "Front-end to the SANE interface",
			  "This function provides access to scanners and other image acquisition "
			  "devices through the SANE (Scanner Access Now Easy) interface.",
			  "Andy Beck, Tristan Tarrant, and David Mosberger",
			  "Andy Beck, Tristan Tarrant, and David Mosberger",
			  "8th June 1997",
			  "<Toolbox>/File/Acquire/xscanimage/Device dialog...",
			  "RGB, GRAY",
			  GIMP_EXTENSION,
			  nargs, nreturn_vals, args, return_vals);

  status = sane_init (0, 0);
  if (status != SANE_STATUS_GOOD)
    {
      DBG (DBG_fatal, "query: sane_init failed: %s\n",
	   sane_strstatus (status));
      exit (1);
    }

  status = sane_get_devices (&devlist, SANE_FALSE);
  if (status != SANE_STATUS_GOOD)
    {
      DBG (DBG_fatal, "query: sane_get_devices failed: %s\n",
	   sane_strstatus (status));
      exit (1);
    }

  for (i = 0; devlist[i]; ++i)
    {
      strcpy (name, "xscanimage-");
      if (encode_devname (devlist[i]->name, sizeof (name) - 11, name + 11) <
	  0)
	continue;		/* name too long... */

      strncpy (mpath, "<Toolbox>/File/Acquire/xscanimage/", sizeof (mpath));
      len = strlen (mpath);
      for (j = 0; devlist[i]->name[j]; ++j)
	{
	  if (devlist[i]->name[j] == '/')
	    mpath[len++] = '\'';
	  else
	    mpath[len++] = devlist[i]->name[j];
	}
      mpath[len++] = '\0';

      gimp_install_procedure
	(name, "Front-end to the SANE interface",
	 "This function provides access to scanners and other image "
	 "acquisition devices through the SANE (Scanner Access Now Easy) "
	 "interface.",
	 "Andy Beck, Tristan Tarrant, and David Mosberger",
	 "Andy Beck, Tristan Tarrant, and David Mosberger",
	 "8th June 1997", mpath, "RGB, GRAY", GIMP_EXTENSION,
	 nargs, nreturn_vals, args, return_vals);
    }
  sane_exit ();
  DBG (DBG_debug, "query: finished\n");
}

#ifndef ENABLE_GIMP_1_2
static void
run (const gchar * name, gint nparams, const GimpParam * param,
     gint * nreturn_vals, GimpParam ** return_vals)
#else
static void
run (char *name, int nparams, GimpParam * param,
     int *nreturn_vals, GimpParam ** return_vals)
#endif				/* !ENABLE_GIMP_1_2 */
{
  static GimpParam values[2];
#ifndef ENABLE_GIMP_1_2
  GimpRunMode run_mode;
#else
  GimpRunModeType run_mode;
#endif /* !ENABLE_GIMP_1_2 */
  char devname[1024];
  char *args[2];
  int nargs;

  DBG (DBG_debug, "run\n");
  run_mode = param[0].data.d_int32;
  scan_win.mode = SANE_GIMP_EXTENSION;

  *nreturn_vals = 1;
  *return_vals = values;

  values[0].type = GIMP_PDB_STATUS;
  values[0].data.d_status = GIMP_PDB_CALLING_ERROR;

  nargs = 0;
  args[nargs++] = "xscanimage";

  seldev = -1;
  if (strncmp (name, "xscanimage-", 11) == 0)
    {
      if (decode_devname (name + 11, sizeof (devname), devname) < 0)
	return;			/* name too long */
      args[nargs++] = devname;
    }

  switch (run_mode)
    {
    case GIMP_RUN_INTERACTIVE:
#ifndef ENABLE_GIMP_1_2
      gimp_extension_ack ();
#endif /* !ENABLE_GIMP_1_2 */
      interface (nargs, args);
      values[0].data.d_status = GIMP_PDB_SUCCESS;
      break;

    case GIMP_RUN_NONINTERACTIVE:
      /*  Make sure all the arguments are there!  */
      break;

    case GIMP_RUN_WITH_LAST_VALS:
      /*  Possibly retrieve data  */
      break;

    default:
      break;
    }
  DBG (DBG_debug, "run: finished\n");
}

static void
null_print_func (const gchar * msg)
{
}

#endif /* HAVE_LIBGIMP_GIMP_H */

static SANE_Word
get_resolution (SANE_Handle dev)
{
  SANE_Status status;
  SANE_Word resolution;
  SANE_Int num_options, i;
  const SANE_Option_Descriptor *option_desc;

  DBG (DBG_debug, "get_resolution\n");
  status =
    sane_control_option (dev, 0, SANE_ACTION_GET_VALUE, &num_options, 0);
  if (status != SANE_STATUS_GOOD)
    return 0;

  for (i = 1; i < num_options; i++)
    {
      option_desc = sane_get_option_descriptor (dev, i);
      if (option_desc)
	if (option_desc->name)
	  {
	    if (strncmp (option_desc->name, SANE_NAME_SCAN_RESOLUTION,
			 sizeof (SANE_NAME_SCAN_RESOLUTION)) == 0)
	      {
		status = sane_control_option (dev, i, SANE_ACTION_GET_VALUE,
					      &resolution, 0);
		if (status == SANE_STATUS_GOOD)
		  {
		    if (option_desc->type == SANE_TYPE_INT)
		      return resolution;
		    else if (option_desc->type == SANE_TYPE_FIXED)
		      return (SANE_Word) SANE_UNFIX (resolution);
		  }
		return 0;
	      }
	  }
    }
  DBG (DBG_debug, "get_resolution: finished\n");
  return 0;
}

static void
update_preview (GSGDialog * dialog, void *arg)
{
  if (scan_win.preview)
    preview_update (scan_win.preview);
}

/* Update the info line with the latest size information.  */
static void
update_param (GSGDialog * dialog, void *arg)
{
  SANE_Parameters params;
  gchar buf[200];

  DBG (DBG_debug, "update_param\n");
  if (!scan_win.info_label)
    return;

  if (sane_get_parameters (gsg_dialog_get_device (dialog), &params)
      == SANE_STATUS_GOOD)
    {
      double size = (double) params.bytes_per_line * (double) params.lines;
      const char *unit = "B";

      if (params.lines == -1)
	{
	  snprintf (buf, sizeof (buf), "%dxunknown: unknown size",
		    params.pixels_per_line);
	}
      else
	{
	  if (params.format >= SANE_FRAME_RED
	      && params.format <= SANE_FRAME_BLUE)
	    size *= 3;

	  if (size >= 1024 * 1024)
	    {
	      size /= 1024 * 1024;
	      unit = "MB";
	    }
	  else if (size >= 1024)
	    {
	      size /= 1024;
	      unit = "KB";
	    }
	  snprintf (buf, sizeof (buf), "%dx%d: %1.1f %s",
		    params.pixels_per_line, params.lines, size, unit);
	}
    }
  else
    snprintf (buf, sizeof (buf), "Invalid parameters.");
  gtk_label_set (GTK_LABEL (scan_win.info_label), buf);

  if (scan_win.preview)
    preview_update (scan_win.preview);
  DBG (DBG_debug, "update_param: finished\n");
}

static void
pref_xscanimage_save (void)
{
  char filename[PATH_MAX];
  int fd;

  DBG (DBG_debug, "pref_xscanimage_save\n");
  /* first save xscanimage-specific preferences: */
  gsg_make_path (sizeof (filename), filename, "xscanimage", "xscanimage",
		 0, ".rc");
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
  DBG (DBG_debug, "pref_xscanimage_save: finished\n");
}

static void
pref_xscanimage_restore (void)
{
  char filename[PATH_MAX];
  int fd;

  DBG (DBG_debug, "pref_xscanimage_restore\n");
  gsg_make_path (sizeof (filename), filename, "xscanimage", "xscanimage",
		 0, ".rc");
  fd = open (filename, O_RDONLY);
  if (fd >= 0)
    {
      preferences_restore (fd);
      close (fd);
    }
  if (!preferences.filename)
    preferences.filename = strdup (OUTFILENAME);
  DBG (DBG_debug, "pref_xscanimage_restore: finished\n");
}

static void
quit_xscanimage (void)
{
  DBG (DBG_debug, "quit_xscanimage\n");
  if (scan_win.preview)
    {
      Preview *preview = scan_win.preview;
      scan_win.preview = 0;
      preview_destroy (preview);
    }
  while (gsg_message_dialog_active)
    {
      if (!gtk_events_pending ())
	usleep (100000);
      gtk_main_iteration ();
    }
  pref_xscanimage_save ();
  if (dialog && gsg_dialog_get_device (dialog))
    sane_close (gsg_dialog_get_device (dialog));
  sane_exit ();
  if (gtk_quit_flag == 1)
    gtk_main_quit ();
#ifdef HAVE_LIBGIMP_GIMP_H
  if (scan_win.mode == SANE_GIMP_EXTENSION)
    gimp_quit ();
#endif
  DBG (DBG_debug, "quit_xscanimage: exiting\n");
  exit (0);
}

/* Invoked when window manager's "delete" (or "close") function is
   invoked.  */
static gint
scan_win_delete (GtkWidget * w, gpointer data)
{
  quit_xscanimage ();
  return FALSE;
}

static void
preview_window_destroyed (GtkWidget * widget, gpointer call_data)
{
  gtk_toggle_button_set_state (GTK_TOGGLE_BUTTON (call_data), FALSE);
}

/* Invoked when the preview button is pressed. */

static void
scan_preview (GtkWidget * widget, gpointer call_data)
{
  DBG (DBG_debug, "scan_preview\n");

  if (GTK_TOGGLE_BUTTON (widget)->active)
    {
      if (!scan_win.preview)
	{
	  scan_win.preview = preview_new (dialog);
	  if (scan_win.preview && scan_win.preview->top)
	    gtk_signal_connect (GTK_OBJECT (scan_win.preview->top),
				"destroy",
				GTK_SIGNAL_FUNC (preview_window_destroyed),
				widget);
	  else
	    gtk_toggle_button_set_state (GTK_TOGGLE_BUTTON (widget), FALSE);
	  if (scan_win.progress)
	    gtk_widget_set_sensitive (scan_win.preview->preview, FALSE);
	}
    }
  else if (scan_win.preview)
    {
      preview_destroy (scan_win.preview);
      scan_win.preview = 0;
    }
  DBG (DBG_debug, "scan_preview: finished\n");
}

#ifdef HAVE_LIBGIMP_GIMP_H
static void
advance (void)
{
  DBG (DBG_debug, "advance\n");

  if (++scan_win.x >= scan_win.param.pixels_per_line)
    {
      int tile_height = gimp_tile_height ();

      scan_win.x = 0;
      ++scan_win.y;
      if (scan_win.y % tile_height == 0)
	{
	  gimp_pixel_rgn_set_rect (&scan_win.region, scan_win.tile,
				   0, scan_win.y - tile_height,
				   scan_win.param.pixels_per_line,
				   tile_height);
	  if (scan_win.param.format >= SANE_FRAME_RED
	      && scan_win.param.format <= SANE_FRAME_BLUE)
	    {
	      int height;

	      scan_win.tile_offset %= 3;
	      if (!scan_win.first_frame)
		{
		  /* get the data for the existing tile: */
		  height = tile_height;
		  if (scan_win.y + height >= scan_win.param.lines)
		    height = scan_win.param.lines - scan_win.y;
		  gimp_pixel_rgn_get_rect (&scan_win.region, scan_win.tile,
					   0, scan_win.y,
					   scan_win.param.pixels_per_line,
					   height);
		}
	    }
	  else
	    scan_win.tile_offset = 0;
	}
    }
  DBG (DBG_debug, "advance: finished\n");
}

#endif /* HAVE_LIBGIMP_GIMP_H */

static void
write_swapped_words (FILE * f, char *buf, guint len)
{
  char tmp_buf[2];
  char tmp;
  unsigned int i;

  DBG (DBG_debug, "write_swapped_words\n");
  if (!len)
    return;
  if (scan_win.have_odd_byte)
    {
      tmp_buf[0] = *buf++;
      tmp_buf[1] = scan_win.odd_byte;
      fwrite (tmp_buf, 1, 2, f);
      --len;
      scan_win.have_odd_byte = FALSE;
    }
  if (len)
    {
      for (i = 1; i < len; i += 2)
	{
	  tmp = buf[i];
	  buf[i] = buf[i - 1];
	  buf[i - 1] = tmp;
	}
      fwrite (buf, 1, len & ~1, f);
      if (len & 1)
	{
	  scan_win.have_odd_byte = TRUE;
	  scan_win.odd_byte = buf[len - 1];
	}
    }
  DBG (DBG_debug, "write_swapped_words: finished\n");
}

static void
input_available (gpointer data, gint source, GdkInputCondition cond)
{
  SANE_Handle dev = gsg_dialog_get_device (dialog);
  static char buf[32768];
  SANE_Status status;
  SANE_Int len;
  int i;

  DBG (DBG_debug, "input_available\n");
  while (1)
    {
      status = sane_read (dev, (unsigned char *) buf, sizeof (buf), &len);
      if (status != SANE_STATUS_GOOD)
	{
	  if (status == SANE_STATUS_EOF)
	    {
	      if (!scan_win.param.last_frame)
		{
		  if (scan_win.input_tag < 0)
		    {
		      while (gtk_events_pending ())
			gtk_main_iteration ();
		    }
		  else
		    {
		      gdk_input_remove (scan_win.input_tag);
		      scan_win.input_tag = -1;
		    }
		  scan_start ();
		  break;
		}
	    }
	  else
	    {
	      snprintf (buf, sizeof (buf), "Error during read: %s.",
			sane_strstatus (status));
	      gsg_error (buf);
	    }
	  scan_done ();
	  return;
	}
      if (!len)			/* out of data for now */
	{
	  if (scan_win.input_tag < 0)
	    {
	      while (gtk_events_pending ())
		gtk_main_iteration ();
	      continue;
	    }
	  else
	    break;
	}

      scan_win.bytes_read += len;
      progress_update (scan_win.progress,
		       scan_win.bytes_read / (gfloat) scan_win.num_bytes);
      if (scan_win.input_tag < 0)
	while (gtk_events_pending ())
	  gtk_main_iteration ();

      switch (scan_win.param.format)
	{
	case SANE_FRAME_GRAY:
	  if (scan_win.mode == STANDALONE)
	    {
	      if (scan_win.param.depth > 8 && little_endian)
		write_swapped_words (scan_win.out, buf, len);
	      else
		fwrite (buf, 1, len, scan_win.out);
	    }
#ifdef HAVE_LIBGIMP_GIMP_H
	  else
	    {
	      switch (scan_win.param.depth)
		{
		case 1:
		  for (i = 0; i < len; ++i)
		    {
		      u_char mask;
		      int j;

		      mask = buf[i];
		      for (j = 7; j >= 0; --j)
			{
			  u_char gl = (mask & (1 << j)) ? 0x00 : 0xff;
			  scan_win.tile[scan_win.tile_offset++] = gl;
			  advance ();
			  if (scan_win.x == 0)
			    break;
			}
		    }
		  break;

		case 8:
		  for (i = 0; i < len; ++i)
		    {
		      scan_win.tile[scan_win.tile_offset++] = buf[i];
		      advance ();
		    }
		  break;

		default:
		  goto bad_depth;
		}
	    }
#endif /* HAVE_LIBGIMP_GIMP_H */
	  break;

	case SANE_FRAME_RGB:
	  if (scan_win.mode == STANDALONE)
	    {
	      if (scan_win.param.depth > 8 && little_endian)
		write_swapped_words (scan_win.out, buf, len);
	      else
		fwrite (buf, 1, len, scan_win.out);
	    }
#ifdef HAVE_LIBGIMP_GIMP_H
	  else
	    {
	      switch (scan_win.param.depth)
		{
		case 1:
		  if (scan_win.param.format == SANE_FRAME_RGB)
		    goto bad_depth;
		  for (i = 0; i < len; ++i)
		    {
		      u_char mask;
		      int j;

		      mask = buf[i];
		      for (j = 0; j < 8; ++j)
			{
			  u_char gl = (mask & 1) ? 0xff : 0x00;
			  mask >>= 1;
			  scan_win.tile[scan_win.tile_offset++] = gl;
			  advance ();
			  if (scan_win.x == 0)
			    break;
			}
		    }
		  break;

		case 8:
		  for (i = 0; i < len; ++i)
		    {
		      scan_win.tile[scan_win.tile_offset++] = buf[i];
		      if (scan_win.tile_offset % 3 == 0)
			advance ();
		    }
		  break;

		default:
		  goto bad_depth;
		}
	    }
#endif /* HAVE_LIBGIMP_GIMP_H */
	  break;

	case SANE_FRAME_RED:
	case SANE_FRAME_GREEN:
	case SANE_FRAME_BLUE:
	  if (scan_win.mode == STANDALONE)
	    for (i = 0; i < len; ++i)
	      {
		fwrite (buf + i, 1, 1, scan_win.out);
		fseek (scan_win.out, 2, SEEK_CUR);
	      }
#ifdef HAVE_LIBGIMP_GIMP_H
	  else
	    {
	      switch (scan_win.param.depth)
		{
		case 1:
		  for (i = 0; i < len; ++i)
		    {
		      u_char mask;
		      int j;

		      mask = buf[i];
		      for (j = 0; j < 8; ++j)
			{
			  u_char gl = (mask & 1) ? 0xff : 0x00;
			  mask >>= 1;
			  scan_win.tile[scan_win.tile_offset] = gl;
			  scan_win.tile_offset += 3;
			  advance ();
			  if (scan_win.x == 0)
			    break;
			}
		    }
		  break;

		case 8:
		  for (i = 0; i < len; ++i)
		    {
		      scan_win.tile[scan_win.tile_offset] = buf[i];
		      scan_win.tile_offset += 3;
		      advance ();
		    }
		  break;
		}
	    }
#endif /* HAVE_LIBGIMP_GIMP_H */
	  break;

	default:
	  fprintf (stderr, "%s.input_available: bad frame format %d\n",
		   prog_name, scan_win.param.format);
	  scan_done ();
	  return;
	}
    }
  DBG (DBG_debug, "input_available: finished\n");
  return;

#ifdef HAVE_LIBGIMP_GIMP_H
bad_depth:
  snprintf (buf, sizeof (buf), "Cannot handle depth %d.",
	    scan_win.param.depth);
  gsg_error (buf);
  scan_done ();
  return;
#endif
}

static void
scan_done (void)
{
  DBG (DBG_debug, "scan_done\n");
  gsg_set_sensitivity (dialog, TRUE);
  if (scan_win.preview)
    gtk_widget_set_sensitive (scan_win.preview->preview, TRUE);
  gtk_widget_set_sensitive (scan_win.scan_button, TRUE);
  gtk_widget_set_sensitive (scan_win.menubar, TRUE);

  if (scan_win.input_tag >= 0)
    {
      gdk_input_remove (scan_win.input_tag);
      scan_win.input_tag = -1;
    }

  sane_cancel (gsg_dialog_get_device (dialog));

  if (!scan_win.progress)
    return;

  progress_free (scan_win.progress);
  scan_win.progress = 0;
  scan_win.header_size = 0;

  if (scan_win.mode == STANDALONE)
    {
      fclose (scan_win.out);
      scan_win.out = 0;
    }
#ifdef HAVE_LIBGIMP_GIMP_H
  else
    {
      int remaining;

      /* GIMP mode */
      if (scan_win.y > scan_win.param.lines)
	scan_win.y = scan_win.param.lines;

      remaining = scan_win.y % gimp_tile_height ();
      if (remaining)
	gimp_pixel_rgn_set_rect (&scan_win.region, scan_win.tile,
				 0, scan_win.y - remaining,
				 scan_win.param.pixels_per_line, remaining);
      gimp_drawable_flush (scan_win.drawable);
      gimp_display_new (scan_win.image_ID);
      gimp_drawable_detach (scan_win.drawable);
      g_free (scan_win.tile);
      scan_win.tile = 0;
    }
#endif /* HAVE_LIBGIMP_GIMP_H */
  DBG (DBG_debug, "scan_done: finished\n");
}

static void
progress_cancel (void)
{
  DBG (DBG_debug, "progress_cancel\n");
  sane_cancel (gsg_dialog_get_device (dialog));
  DBG (DBG_debug, "progress_cancel: done\n");
}

static void
scan_start (void)
{
  SANE_Status status;
  SANE_Handle dev = gsg_dialog_get_device (dialog);

#ifdef HAVE_LIBGIMP_GIMP_H
  SANE_Word resolution;
#endif /* HAVE_LIBGIMP_GIMP_H */

  const char *frame_type = 0;
  char buf[256];
  int fd;

  DBG (DBG_debug, "scan_start\n");

  gsg_set_sensitivity (dialog, FALSE);
  if (scan_win.preview)
    gtk_widget_set_sensitive (scan_win.preview->preview, FALSE);
  gtk_widget_set_sensitive (scan_win.scan_button, FALSE);
  gtk_widget_set_sensitive (scan_win.menubar, FALSE);

#ifdef HAVE_LIBGIMP_GIMP_H
  if (scan_win.mode == SANE_GIMP_EXTENSION && scan_win.tile)
    {
      int height, remaining;

      /* write the last tile of the frame to the GIMP region: */

      if (scan_win.y > scan_win.param.lines)	/* sanity check */
	scan_win.y = scan_win.param.lines;

      remaining = scan_win.y % gimp_tile_height ();
      if (remaining)
	gimp_pixel_rgn_set_rect (&scan_win.region, scan_win.tile,
				 0, scan_win.y - remaining,
				 scan_win.param.pixels_per_line, remaining);

      /* initialize the tile with the first tile of the GIMP region: */

      height = gimp_tile_height ();
      if (height >= scan_win.param.lines)
	height = scan_win.param.lines;
      gimp_pixel_rgn_get_rect (&scan_win.region, scan_win.tile,
			       0, 0, scan_win.param.pixels_per_line, height);
    }
#endif /* HAVE_LIBGIMP_GIMP_H */

#ifdef GIMP_HAVE_RESOLUTION_INFO
  resolution = get_resolution (dev);
#endif

  scan_win.x = scan_win.y = 0;

  while (gtk_events_pending ())
    gtk_main_iteration ();
  status = sane_start (dev);
  if (status != SANE_STATUS_GOOD)
    {
      gsg_set_sensitivity (dialog, TRUE);
      snprintf (buf, sizeof (buf), "Failed to start scanner: %s",
		sane_strstatus (status));
      gsg_error (buf);
      return;
    }

  status = sane_get_parameters (dev, &scan_win.param);
  if (status != SANE_STATUS_GOOD)
    {
      gsg_set_sensitivity (dialog, TRUE);
      snprintf (buf, sizeof (buf), "Failed to get parameters: %s",
		sane_strstatus (status));
      gsg_error (buf);
      scan_done ();
      return;
    }

  if (scan_win.param.lines == -1)
    {
      gsg_set_sensitivity (dialog, TRUE);
      snprintf (buf, sizeof (buf), "Hand-Scanner mode not supported");
      gsg_error (buf);
      scan_done ();
      return;
    }

  scan_win.num_bytes = scan_win.param.lines * scan_win.param.bytes_per_line;
  scan_win.bytes_read = 0;
  scan_win.have_odd_byte = FALSE;

  switch (scan_win.param.format)
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

  if (scan_win.mode == STANDALONE)
    {				/* We are running in standalone mode */
      if (!scan_win.header_size)
	{
	  switch (scan_win.param.format)
	    {
	    case SANE_FRAME_RED:
	    case SANE_FRAME_GREEN:
	    case SANE_FRAME_BLUE:
	      if (scan_win.param.depth > 8)
		{
		  gsg_set_sensitivity (dialog, TRUE);
		  snprintf (buf, sizeof (buf),
			    "Separate channel transfers are not supported "
			    "with %d bits/channel.", scan_win.param.depth);
		  gsg_error (buf);
		  scan_done ();
		  return;
		}
	     /*FALLTHROUGH*/ case SANE_FRAME_RGB:
	      fprintf (scan_win.out, "P6\n# SANE data follows\n%d %d\n%d\n",
		       scan_win.param.pixels_per_line, scan_win.param.lines,
		       (scan_win.param.depth <= 8) ? 255 : 65535);
	      break;

	    case SANE_FRAME_GRAY:
	      if (scan_win.param.depth == 1)
		fprintf (scan_win.out, "P4\n# SANE data follows\n%d %d\n",
			 scan_win.param.pixels_per_line,
			 scan_win.param.lines);
	      else
		fprintf (scan_win.out, "P5\n# SANE data follows\n%d %d\n%d\n",
			 scan_win.param.pixels_per_line, scan_win.param.lines,
			 (scan_win.param.depth <= 8) ? 255 : 65535);
	      break;
	    }
	  scan_win.header_size = ftell (scan_win.out);
	}
      if (scan_win.param.format >= SANE_FRAME_RED
	  && scan_win.param.format <= SANE_FRAME_BLUE)
	fseek (scan_win.out,
	       scan_win.header_size + scan_win.param.format - SANE_FRAME_RED,
	       SEEK_SET);
      snprintf (buf, sizeof (buf), "Receiving %s data for `%s'...",
		frame_type, preferences.filename);
    }
#ifdef HAVE_LIBGIMP_GIMP_H
  else
    {
      size_t tile_size;

      /* We are running under the GIMP */
      /* Check whether the selected bit depth is supported by the Gimp */
      if (scan_win.param.depth > 8)
	{
	  gsg_set_sensitivity (dialog, TRUE);
	  snprintf (buf, sizeof (buf), "The Gimp doesn't support images "
		    "with %d bits/channel.", scan_win.param.depth);
	  gsg_error (buf);
	  return;
	}

      scan_win.tile_offset = 0;
      tile_size = scan_win.param.pixels_per_line * gimp_tile_height ();
      if (scan_win.param.format != SANE_FRAME_GRAY)
	tile_size *= 3;		/* 24 bits/pixel */
      if (scan_win.tile)
	scan_win.first_frame = 0;
      else
	{
	  GimpImageType image_type = GIMP_RGB;
	  GimpImageType drawable_type = GIMP_RGB_IMAGE;
	  gint32 layer_ID;

	  if (scan_win.param.format == SANE_FRAME_GRAY)
	    {
	      image_type = GIMP_GRAY;
	      drawable_type = GIMP_GRAY_IMAGE;
	    }

	  scan_win.image_ID = gimp_image_new (scan_win.param.pixels_per_line,
					      scan_win.param.lines,
					      image_type);

/* the following is supported since gimp-1.1.0 */
#ifdef GIMP_HAVE_RESOLUTION_INFO
	  if (resolution > 0)
	    gimp_image_set_resolution (scan_win.image_ID, resolution,
				       resolution);
#endif

	  layer_ID = gimp_layer_new (scan_win.image_ID, "Background",
				     scan_win.param.pixels_per_line,
				     scan_win.param.lines,
				     drawable_type, 100, GIMP_NORMAL_MODE);
	  gimp_image_add_layer (scan_win.image_ID, layer_ID, 0);

	  scan_win.drawable = gimp_drawable_get (layer_ID);
	  gimp_pixel_rgn_init (&scan_win.region, scan_win.drawable, 0, 0,
			       scan_win.drawable->width,
			       scan_win.drawable->height, TRUE, FALSE);
	  scan_win.tile = g_new (guchar, tile_size);
	  scan_win.first_frame = 1;
	}
      if (scan_win.param.format >= SANE_FRAME_RED
	  && scan_win.param.format <= SANE_FRAME_BLUE)
	scan_win.tile_offset = scan_win.param.format - SANE_FRAME_RED;
      snprintf (buf, sizeof (buf), "Receiving %s data for GIMP...",
		frame_type);
    }
#endif /* HAVE_LIBGIMP_GIMP_H */
  if (scan_win.progress)
    progress_free (scan_win.progress);
  scan_win.progress = progress_new ("Scanning", buf,
				    (GtkSignalFunc) progress_cancel, 0);

  scan_win.input_tag = -1;
  if (sane_set_io_mode (dev, SANE_TRUE) == SANE_STATUS_GOOD
      && sane_get_select_fd (dev, &fd) == SANE_STATUS_GOOD)
    scan_win.input_tag =
      gdk_input_add (fd, GDK_INPUT_READ | GDK_INPUT_EXCEPTION,
		     input_available, 0);
  else
    {
      while (gtk_events_pending ())
	gtk_main_iteration ();
      input_available (0, -1, GDK_INPUT_READ);
    }
  DBG (DBG_debug, "scan_start: finished\n");
}

/* Invoked when the scan button is pressed */
static void
scan_dialog (GtkWidget * widget, gpointer call_data)
{
  char buf[256];
  char testfilename[256];

  DBG (DBG_debug, "scan_dialog\n");
  if (scan_win.mode == STANDALONE)
    {				/* We are running in standalone mode */
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
      scan_win.out = fopen (preferences.filename, "w");
      if (!scan_win.out)
	{
	  snprintf (buf, sizeof (buf), "Failed to open `%s': %s",
		    preferences.filename, strerror (errno));
	  gsg_error (buf);
	  return;
	}
    }
  gsg_sync (dialog);
  scan_start ();
  DBG (DBG_debug, "scan_dialog: finished\n");
}

#if 0

static void
zoom_in_preview (GtkWidget * widget, gpointer data)
{
  if (Selection.x1 >= Selection.x2
      || Selection.y1 >= Selection.y2 || !Selection.active)
    return;

  Selection.active = FALSE;
  draw_selection (TRUE);

  gtk_ruler_set_range (GTK_RULER (scan_win.hruler), Selection.x1,
		       Selection.x2, 0, 20);
  gtk_ruler_set_range (GTK_RULER (scan_win.vruler), Selection.y1,
		       Selection.y2, 0, 20);
}

static void
zoom_out_preview (GtkWidget * widget, gpointer data)
{
  gtk_ruler_set_range (GTK_RULER (scan_win.hruler), 0,
		       Preview.PhysWidth, 0, 20);
  gtk_ruler_set_range (GTK_RULER (scan_win.vruler), 0,
		       Preview.PhysHeight, 0, 20);
}

#endif /* 0 */

static void
files_exit_callback (GtkWidget * widget, gpointer data)
{
  quit_xscanimage ();
}

static GtkWidget *
files_build_menu (void)
{
  GtkWidget *menu, *item;

  DBG (DBG_debug, "files_build_menu\n");
  menu = gtk_menu_new ();

  item = gtk_menu_item_new ();
  gtk_container_add (GTK_CONTAINER (menu), item);
  gtk_widget_show (item);

  item = gtk_menu_item_new_with_label ("Exit");
  gtk_container_add (GTK_CONTAINER (menu), item);
  gtk_signal_connect (GTK_OBJECT (item), "activate",
		      (GtkSignalFunc) files_exit_callback, 0);
  gtk_widget_show (item);

  DBG (DBG_debug, "files_build_menu: finished\n");
  return menu;
}

static void
pref_set_unit_callback (GtkWidget * widget, gpointer data)
{
  const char *unit = data;
  double unit_conversion_factor = 1.0;

  DBG (DBG_debug, "pref_set_unit_callback\n");

  if (strcmp (unit, "cm") == 0)
    unit_conversion_factor = 10.0;
  else if (strcmp (unit, "in") == 0)
    unit_conversion_factor = 25.4;

  preferences.length_unit = unit_conversion_factor;

  gsg_refresh_dialog (dialog);
  if (scan_win.preview)
    preview_update (scan_win.preview);

  pref_xscanimage_save ();
  DBG (DBG_debug, "pref_set_unit_callback: finished\n");
}

static void
update_int_callback (GtkWidget * widget, gpointer data)
{
  int *valuep = data;

  *valuep = (GTK_TOGGLE_BUTTON (widget)->active != 0);
}

static void
update_double_callback (GtkWidget * widget, gpointer data)
{
  double *valuep = data;
  const char *start;
  char *end;
  double v;

  start = gtk_entry_get_text (GTK_ENTRY (widget));
  if (!start)
    return;

  v = strtod (start, &end);
  if (end > start)
    *valuep = v;
}

static void
preview_options_ok_callback (GtkWidget * widget, gpointer data)
{
  GtkWidget *dialog = data;
  char buf[1024];

  DBG (DBG_debug, "preview_options_ok_callback\n");

  /* gamma min, max test */
  if (preferences.preview_gamma < 0.0 || preferences.preview_gamma > 255.0)
    {
      snprintf (buf, sizeof (buf),
		"Gamma value %g is < 0 or > 255, please change!",
		preferences.preview_gamma);
      gsg_warning (buf);
      return;
    }


  gtk_widget_destroy (dialog);
  pref_xscanimage_save ();


  snprintf (buf, sizeof (buf),
	    "It is necessary to restart %s for the changes to take effect.",
	    prog_name);
  gsg_warning (buf);
  DBG (DBG_debug, "preview_options_ok_callback: finished\n");
}

static void
preview_options_cancel_callback (GtkWidget * widget, gpointer data)
{
  GtkWidget *dialog = data;

  gtk_widget_destroy (dialog);
}

static void
preview_options_dialog (GtkWidget * widget, gpointer data)
{
  GtkWidget *dialog, *vbox, *hbox, *button, *label, *text;
  char buf[64];

  DBG (DBG_debug, "preview_options_dialog\n");
  dialog = gtk_dialog_new ();
  sprintf (buf, "%s preview options", prog_name);
  gtk_window_set_title (GTK_WINDOW (dialog), buf);

  vbox = GTK_DIALOG (dialog)->vbox;

  /* preserve preview image: */

  hbox = gtk_hbox_new ( /* homogeneous */ FALSE, 0);
  gtk_box_pack_start (GTK_BOX (vbox), hbox, TRUE, TRUE, 2);
  button = gtk_check_button_new_with_label ("Preserve preview image");
  gtk_signal_connect (GTK_OBJECT (button), "toggled",
		      (GtkSignalFunc) update_int_callback,
		      &preferences.preserve_preview);
  gtk_toggle_button_set_state (GTK_TOGGLE_BUTTON (button),
			       preferences.preserve_preview);
  gtk_box_pack_start (GTK_BOX (hbox), button, TRUE, TRUE, 2);

  gtk_widget_show (button);
  gtk_widget_show (hbox);

  /* private colormap: */

  hbox = gtk_hbox_new ( /* homogeneous */ FALSE, 0);
  gtk_box_pack_start (GTK_BOX (vbox), hbox, TRUE, TRUE, 2);
  button = gtk_check_button_new_with_label ("Use private colormap");
  gtk_signal_connect (GTK_OBJECT (button), "toggled",
		      (GtkSignalFunc) update_int_callback,
		      &preferences.preview_own_cmap);
  gtk_toggle_button_set_state (GTK_TOGGLE_BUTTON (button),
			       preferences.preview_own_cmap);
  gtk_box_pack_start (GTK_BOX (hbox), button, TRUE, TRUE, 2);

  gtk_widget_show (button);
  gtk_widget_show (hbox);

  /* gamma correction value: */

  hbox = gtk_hbox_new ( /* homogeneous */ FALSE, 0);
  gtk_box_pack_start (GTK_BOX (vbox), hbox, TRUE, TRUE, 2);
  gtk_widget_show (hbox);

  label = gtk_label_new ("Gamma correction value");
  gtk_box_pack_start (GTK_BOX (hbox), label, FALSE, FALSE, 2);
  gtk_widget_show (label);

  sprintf (buf, "%g", preferences.preview_gamma);
  text = gtk_entry_new ();
  gtk_entry_set_text (GTK_ENTRY (text), buf);
  gtk_box_pack_start (GTK_BOX (hbox), text, TRUE, TRUE, 2);
  gtk_signal_connect (GTK_OBJECT (text), "changed",
		      (GtkSignalFunc) update_double_callback,
		      &preferences.preview_gamma);
  gtk_widget_show (text);

  /* fill in action area: */
  hbox = GTK_DIALOG (dialog)->action_area;

  button = gtk_button_new_with_label ("OK");
  GTK_WIDGET_SET_FLAGS (button, GTK_CAN_DEFAULT);
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
		      (GtkSignalFunc) preview_options_ok_callback, dialog);
  gtk_box_pack_start (GTK_BOX (hbox), button, TRUE, TRUE, 0);
  gtk_widget_grab_default (button);
  gtk_widget_show (button);

  button = gtk_button_new_with_label ("Cancel");
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
		      (GtkSignalFunc) preview_options_cancel_callback,
		      dialog);
  gtk_box_pack_start (GTK_BOX (hbox), button, TRUE, TRUE, 0);
  gtk_widget_show (button);

  gtk_widget_show (dialog);
  DBG (DBG_debug, "preview_options_dialog: finished\n");
}

static void
pref_device_save (GtkWidget * widget, gpointer data)
{
  char filename[PATH_MAX];
  int fd;

  DBG (DBG_debug, "pref_device_save\n");
  gsg_make_path (sizeof (filename), filename,
		 "xscanimage", 0, dialog->dev_name, ".rc");
  fd = open (filename, O_WRONLY | O_CREAT | O_TRUNC, 0666);
  if (fd < 0)
    {
      char buf[256];

      snprintf (buf, sizeof (buf), "Failed to create file: %s.",
		strerror (errno));
      gsg_error (buf);
      return;
    }
  gsg_sync (dialog);
  sanei_save_values (fd, dialog->dev);
  close (fd);
  DBG (DBG_debug, "pref_device_save: finished\n");
}

static void
pref_device_restore (void)
{
  char filename[PATH_MAX];
  int fd;

  DBG (DBG_debug, "pref_device_restore\n");
  gsg_make_path (sizeof (filename), filename,
		 "xscanimage", 0, dialog->dev_name, ".rc");
  fd = open (filename, O_RDONLY);
  if (fd < 0)
    return;
  sanei_load_values (fd, dialog->dev);
  close (fd);

  gsg_refresh_dialog (dialog);
  DBG (DBG_debug, "pref_device_restore: finished\n");
}

static void
pref_toggle_advanced (GtkWidget * widget, gpointer data)
{
  preferences.advanced = (GTK_CHECK_MENU_ITEM (widget)->active != 0);
  gsg_set_advanced (dialog, preferences.advanced);
  pref_xscanimage_save ();
}

static void
pref_toggle_tooltips (GtkWidget * widget, gpointer data)
{
  preferences.tooltips_enabled = (GTK_CHECK_MENU_ITEM (widget)->active != 0);
  gsg_set_tooltips (dialog, preferences.tooltips_enabled);
  pref_xscanimage_save ();
}

static void
pref_toggle_twocolumn (GtkWidget * widget, gpointer data)
{
  preferences.twocolumn_enabled = (GTK_CHECK_MENU_ITEM (widget)->active != 0);
  gsg_set_twocolumn (dialog, preferences.twocolumn_enabled);
  pref_xscanimage_save ();
}

static GtkWidget *
pref_build_menu (void)
{
  GtkWidget *menu, *item, *submenu;
  GtkWidget *unit_mm, *unit_cm, *unit_in;
  GSList *units_group = NULL;
  double unit;

  DBG (DBG_debug, "pref_build_menu\n");
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

  /* two column submenu: */

  item = gtk_check_menu_item_new_with_label ("Show two column display");
  gtk_check_menu_item_set_state (GTK_CHECK_MENU_ITEM (item),
				 preferences.twocolumn_enabled);
  gtk_menu_append (GTK_MENU (menu), item);
  gtk_widget_show (item);
  gtk_signal_connect (GTK_OBJECT (item), "toggled",
		      (GtkSignalFunc) pref_toggle_twocolumn, 0);

  /* length unit submenu: */

  item = gtk_menu_item_new_with_label ("Length unit");
  gtk_menu_append (GTK_MENU (menu), item);
  gtk_widget_show (item);

  submenu = gtk_menu_new ();

  unit_mm = gtk_radio_menu_item_new_with_label (units_group, "millimeters");
  units_group = gtk_radio_menu_item_group (GTK_RADIO_MENU_ITEM (unit_mm));
  gtk_menu_append (GTK_MENU (submenu), unit_mm);
  gtk_widget_show (unit_mm);

  unit_cm = gtk_radio_menu_item_new_with_label (units_group, "centimeters");
  units_group = gtk_radio_menu_item_group (GTK_RADIO_MENU_ITEM (unit_cm));
  gtk_menu_append (GTK_MENU (submenu), unit_cm);
  gtk_widget_show (unit_cm);

  unit_in = gtk_radio_menu_item_new_with_label (units_group, "inches");
  gtk_menu_append (GTK_MENU (submenu), unit_in);
  gtk_widget_show (unit_in);

  unit = preferences.length_unit;
  if ((unit > 9.9) && (unit < 10.1))
    gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (unit_cm), TRUE);
  else if ((unit > 25.3) && (unit < 25.5))
    gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (unit_in), TRUE);
  else
    {
      gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (unit_mm), TRUE);
      preferences.length_unit = 1.0;
    }
  gtk_signal_connect (GTK_OBJECT (unit_mm), "toggled",
		      (GtkSignalFunc) pref_set_unit_callback, "mm");
  gtk_signal_connect (GTK_OBJECT (unit_cm), "toggled",
		      (GtkSignalFunc) pref_set_unit_callback, "cm");
  gtk_signal_connect (GTK_OBJECT (unit_in), "toggled",
		      (GtkSignalFunc) pref_set_unit_callback, "in");

  gtk_menu_item_set_submenu (GTK_MENU_ITEM (item), submenu);

  /* preview options: */

  item = gtk_menu_item_new_with_label ("Preview options...");
  gtk_menu_append (GTK_MENU (menu), item);
  gtk_signal_connect (GTK_OBJECT (item), "activate",
		      (GtkSignalFunc) preview_options_dialog, 0);
  gtk_widget_show (item);

  /* insert separator: */
  item = gtk_menu_item_new ();
  gtk_menu_append (GTK_MENU (menu), item);
  gtk_widget_show (item);

  item = gtk_menu_item_new_with_label ("Save device settings");
  gtk_menu_append (GTK_MENU (menu), item);
  gtk_signal_connect (GTK_OBJECT (item), "activate",
		      (GtkSignalFunc) pref_device_save, 0);
  gtk_widget_show (item);

  item = gtk_menu_item_new_with_label ("Restore device settings");
  gtk_menu_append (GTK_MENU (menu), item);
  gtk_signal_connect (GTK_OBJECT (item), "activate",
		      (GtkSignalFunc) pref_device_restore, 0);
  gtk_widget_show (item);

  DBG (DBG_debug, "pref_build_menu: finished\n");
  return menu;
}

static void
browse_filename_callback (GtkWidget * widget, gpointer data)
{
  char filename[1024];

  DBG (DBG_debug, "browse_filename_callback\n");
  if (preferences.filename)
    {
      strncpy (filename, preferences.filename, sizeof (filename));
      filename[sizeof (filename) - 1] = '\0';
    }
  else
    strcpy (filename, OUTFILENAME);
  gsg_get_filename ("Output Filename", filename, sizeof (filename), filename);
  gtk_entry_set_text (GTK_ENTRY (scan_win.filename_entry), filename);

  if (preferences.filename)
    free ((void *) preferences.filename);
  preferences.filename = strdup (filename);
  DBG (DBG_debug, "browse_filename_callback: finished\n");
}

static void
filename_changed_callback (GtkWidget * widget, gpointer data)
{
  if (preferences.filename)
    free ((void *) preferences.filename);
  preferences.filename = strdup (gtk_entry_get_text (GTK_ENTRY (widget)));
}

/* Create the main dialog box.  */
static void
device_dialog (void)
{
  GtkWidget *vbox, *hbox, *button, *frame, *scrolled_window, *dialog_window,
    *label, *text;
  GtkWidget *menubar_item;
  const gchar *devname;

  DBG (DBG_debug, "device_dialog\n");
  /* first, restore xscanimage preferences */
  pref_xscanimage_restore ();

  devname = devlist[seldev]->name;

  /* create the dialog box */
  scan_win.shell = gtk_dialog_new ();
  gtk_window_set_title (GTK_WINDOW (scan_win.shell), (char *) devname);
  gtk_window_set_policy (GTK_WINDOW (scan_win.shell), FALSE, TRUE, TRUE);
  gtk_window_set_default_size (GTK_WINDOW (scan_win.shell), 400, 400);
  gtk_signal_connect (GTK_OBJECT (scan_win.shell), "delete_event",
		      GTK_SIGNAL_FUNC (scan_win_delete), NULL);

  /* create the main vbox */
  vbox = GTK_DIALOG (scan_win.shell)->vbox;

  /* create the menubar */

  scan_win.menubar = gtk_menu_bar_new ();
  gtk_box_pack_start (GTK_BOX (vbox), scan_win.menubar, FALSE, FALSE, 0);

  /* "Files" submenu: */
  menubar_item = gtk_menu_item_new_with_label ("File");
  gtk_container_add (GTK_CONTAINER (scan_win.menubar), menubar_item);
  gtk_menu_item_set_submenu (GTK_MENU_ITEM (menubar_item),
			     files_build_menu ());
  gtk_widget_show (menubar_item);

  /* "Preferences" submenu: */
  menubar_item = gtk_menu_item_new_with_label ("Preferences");
  gtk_container_add (GTK_CONTAINER (scan_win.menubar), menubar_item);
  gtk_menu_item_set_submenu (GTK_MENU_ITEM (menubar_item),
			     pref_build_menu ());
  gtk_widget_show (menubar_item);

  gtk_widget_show (scan_win.menubar);

  /* if we're running in standalone mode, provide a output filename box: */
  if (scan_win.mode == STANDALONE)
    {
      frame = gtk_frame_new ("Output");
      gtk_container_border_width (GTK_CONTAINER (frame), 4);
      gtk_frame_set_shadow_type (GTK_FRAME (frame), GTK_SHADOW_ETCHED_IN);
      gtk_box_pack_start (GTK_BOX (vbox), frame, FALSE, FALSE, 0);

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

      scan_win.filename_entry = text;

      button = gtk_button_new_with_label ("Browse");
      gtk_box_pack_start (GTK_BOX (hbox), button, FALSE, FALSE, 2);
      gtk_signal_connect (GTK_OBJECT (button), "clicked",
			  (GtkSignalFunc) browse_filename_callback, 0);

      gtk_widget_show (button);
      gtk_widget_show (label);
      gtk_widget_show (text);
      gtk_widget_show (hbox);
      gtk_widget_show (frame);
    }

  /* create  a subwindow so the dialog keeps its position on rebuilds: */
  scrolled_window = gtk_scrolled_window_new (NULL, NULL);
  gtk_scrolled_window_set_policy (GTK_SCROLLED_WINDOW (scrolled_window),
				  GTK_POLICY_NEVER, GTK_POLICY_AUTOMATIC);
  gtk_scrolled_window_set_placement (GTK_SCROLLED_WINDOW (scrolled_window),
				     GTK_CORNER_TOP_RIGHT);
  dialog_window = gtk_hbox_new ( /* homogeneous */ FALSE, 0);
  gtk_scrolled_window_add_with_viewport (GTK_SCROLLED_WINDOW
					 (scrolled_window), dialog_window);

  gtk_box_pack_start (GTK_BOX (vbox), scrolled_window, TRUE, TRUE, 0);
  gtk_widget_show (scrolled_window);
  gtk_widget_show (dialog_window);

  dialog = gsg_create_dialog (dialog_window, devname,
			      update_preview, 0, update_param, 0);
  if (!dialog)
    return;

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

  scan_win.info_label = gtk_label_new ("0x0: 0KB");
  gtk_box_pack_start (GTK_BOX (hbox), scan_win.info_label, FALSE, FALSE, 0);
  gtk_widget_show (scan_win.info_label);

  update_param (dialog, 0);

  /* The bottom row of buttons */
  hbox = GTK_DIALOG (scan_win.shell)->action_area;

  /* The Scan button */
  scan_win.scan_button = gtk_button_new_with_label ("Scan");
  gtk_signal_connect (GTK_OBJECT (scan_win.scan_button), "clicked",
		      (GtkSignalFunc) scan_dialog, NULL);
  gtk_box_pack_start (GTK_BOX (hbox), scan_win.scan_button, TRUE, TRUE, 0);
  gtk_widget_show (scan_win.scan_button);

  /* The Preview button */
  scan_win.preview_button =
    gtk_toggle_button_new_with_label ("Preview Window");
  gtk_signal_connect (GTK_OBJECT (scan_win.preview_button), "clicked",
		      (GtkSignalFunc) scan_preview, NULL);
  gtk_box_pack_start (GTK_BOX (hbox), scan_win.preview_button, TRUE, TRUE, 0);
  gtk_widget_show (scan_win.preview_button);

#if 0
  /* The Zoom in button */
  button = gtk_button_new_with_label ("Zoom");
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
		      (GtkSignalFunc) zoom_in_preview, NULL);
  gtk_box_pack_start (GTK_BOX (hbox), button, TRUE, TRUE, 0);
  gtk_widget_show (button);

  /* The Zoom out button */
  button = gtk_button_new_with_label ("Zoom out");
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
		      (GtkSignalFunc) zoom_out_preview, NULL);
  gtk_box_pack_start (GTK_BOX (hbox), button, TRUE, TRUE, 0);
  gtk_widget_show (button);
#endif

  pref_device_restore ();	/* restore device-settings */
  gtk_widget_show (scan_win.shell);
  DBG (DBG_debug, "device_dialog: finished\n");
}

static void
ok_choose_dialog_callback (void)
{
  gtk_widget_destroy (choose_device_dialog);
  device_dialog ();
}

static int
select_device_callback (GtkWidget * widget, GdkEventButton * event,
			gpointer data)
{
  seldev = (long) data;
  if (event->type == GDK_2BUTTON_PRESS && event->button == 1)
    ok_choose_dialog_callback ();

  return 0;
}

static gint32
choose_device (void)
{
  GtkWidget *main_vbox, *vbox, *hbox, *button;
  GSList *owner;
  const SANE_Device *adev;
  gint i;

  DBG (DBG_debug, "choose_device\n");
  choose_device_dialog = gtk_dialog_new ();
  gtk_window_set_title (GTK_WINDOW (choose_device_dialog), "Select device");
  gtk_signal_connect (GTK_OBJECT (choose_device_dialog), "delete_event",
		      GTK_SIGNAL_FUNC (files_exit_callback), NULL);

  main_vbox = GTK_DIALOG (choose_device_dialog)->vbox;

  /* The list of drivers */
  vbox = gtk_vbox_new (FALSE, 5);
  gtk_container_border_width (GTK_CONTAINER (vbox), 3);
  gtk_box_pack_start (GTK_BOX (main_vbox), vbox, TRUE, TRUE, 0);
  gtk_widget_show (vbox);

  /* The radio buttons */
  owner = NULL;
  for (i = 0; i < ndevs; i++)
    {
      adev = devlist[i];

      button = gtk_radio_button_new_with_label (owner, (char *) adev->name);
      gtk_signal_connect (GTK_OBJECT (button), "button_press_event",
			  (GtkSignalFunc) select_device_callback,
			  (void *) (long) i);
      gtk_box_pack_start (GTK_BOX (vbox), button, TRUE, TRUE, 0);
      gtk_widget_show (button);
      owner = gtk_radio_button_group (GTK_RADIO_BUTTON (button));
      if (i == defdev)
	gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (button), TRUE);
    }

  /* The bottom row of buttons */
  hbox = GTK_DIALOG (choose_device_dialog)->action_area;

  /* The OK button */
  button = gtk_button_new_with_label ("OK");
  GTK_WIDGET_SET_FLAGS (button, GTK_CAN_DEFAULT);
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
		      (GtkSignalFunc) ok_choose_dialog_callback, NULL);
  gtk_box_pack_start (GTK_BOX (hbox), button, TRUE, TRUE, 0);
  gtk_widget_grab_default (button);
  gtk_widget_show (button);

  /* The Cancel button */
  button = gtk_button_new_with_label ("Cancel");
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
		      (GtkSignalFunc) files_exit_callback, NULL);
  gtk_box_pack_start (GTK_BOX (hbox), button, TRUE, TRUE, 0);
  gtk_widget_show (button);

  gtk_widget_show (choose_device_dialog);
  DBG (DBG_debug, "choose_device: finished\n");
  return 0;
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
-V, --version              print version information\n", prog_name);
}

static void
init (int argc, char **argv)
{
  char filename[PATH_MAX];
  struct stat st;
  SANE_Status status;

  DBG_INIT ();

  DBG (DBG_debug, "init\n");
  gtk_init (&argc, &argv);
#ifdef HAVE_LIBGIMP_GIMP_H
  gtk_rc_parse (gimp_gtkrc ());

# ifndef ENABLE_GIMP_1_2
  /* GIMP 2.0 defines gimp_use_xshm() as a macro always returning TRUE
   * (in the compat header) */
  gdk_set_use_xshm (TRUE);
# else
  gdk_set_use_xshm (gimp_use_xshm ());
# endif	/* !ENABLE_GIMP_1_2 */
#endif

  gsg_make_path (sizeof (filename), filename, 0, "sane-style", 0, ".rc");
  if (stat (filename, &st) >= 0)
    gtk_rc_parse (filename);
  else
    {
      strncpy (filename, STRINGIFY (PATH_SANE_DATA_DIR) "/sane-style.rc",
	       sizeof (filename));
      filename[sizeof (filename) - 1] = '\0';
      if (stat (filename, &st) >= 0)
	gtk_rc_parse (filename);
    }

  status = sane_init (0, 0);
  if (status != SANE_STATUS_GOOD)
    {
      DBG (DBG_fatal, "init: sane_init failed: %s\n",
	   sane_strstatus (status));
      exit (1);
    }

  if (argc > 1)
    {
      static SANE_Device dev;
      static const SANE_Device *device_list[] = { &dev, 0 };
      int ch;

      while ((ch = getopt_long (argc, argv, "ghV", long_options, 0)) != EOF)
	{
	  switch (ch)
	    {
	    case 'g':
	      printf ("%s: GIMP support missing.\n", argv[0]);
	      exit (0);

	    case 'V':
	      printf ("xscanimage (%s) %s\n", PACKAGE, VERSION);
	      exit (0);

	    case 'h':
	    default:
	      usage ();
	      exit (0);
	    }
	}

      if (optind < argc)
	{
	  memset (&dev, 0, sizeof (dev));
	  dev.name = argv[argc - 1];
	  dev.vendor = "Unknown";
	  dev.type = "unknown";
	  dev.model = "unknown";

	  devlist = device_list;
	  seldev = 0;
	}
    }

  if (seldev < 0)
    {
      char *defdevname;

      status = sane_get_devices (&devlist, SANE_FALSE);
      if (status != SANE_STATUS_GOOD)
	{
	  DBG (DBG_fatal, "init: sane_get_devices failed: %s\n",
	       sane_strstatus (status));
	  exit (1);
	}

      if ((defdevname = getenv ("SANE_DEFAULT_DEVICE")) != NULL)
	{
	  int i;

	  for (i = 0; devlist[i] != 0; i++)
	    {
	      if (strcmp (devlist[i]->name, defdevname) == 0)
		{
		  defdev = i;
		  break;
		}
	    }
	  if (defdev < 0)
	    DBG (DBG_error, "default device is `%s' wasn't found by "
		 "sane_get_devices() \n", defdevname);
	  else
	    DBG (DBG_info, "default device is `%s'\n", defdevname);
	}
    }
  DBG (DBG_debug, "init: finished\n");
}

static void
interface (int argc, char **argv)
{
  scan_win.info_label = NULL;

  DBG (DBG_debug, "interface\n");
  init (argc, argv);

  for (ndevs = 0; devlist[ndevs]; ++ndevs);

  if (seldev >= 0)
    {
      if (seldev >= ndevs)
	{
	  fprintf (stderr, "%s: device %d is unavailable.\n",
		   prog_name, seldev);
	  quit_xscanimage ();
	}
      device_dialog ();
      if (!dialog)
	quit_xscanimage ();
    }
  else
    {
      if (ndevs > 0)
	{
	  seldev = 0;
	  if (ndevs == 1)
	    {
	      device_dialog ();
	      if (!dialog)
		quit_xscanimage ();
	    }
	  else
	    choose_device ();
	}
      else
	{
	  DBG (DBG_fatal,
	       "No scanners were identified. If you were expecting something\n"
	       "          different, check that the scanner is plugged in, turned on and\n"
	       "          detected by sane-find-scanner (if appropriate). Please read\n"
	       "          the documentation which came with this software (README, FAQ,\n"
	       "          manpages).\n");
	  quit_xscanimage ();
	}
    }
  gtk_quit_flag = 1;
  DBG (DBG_debug, "interface: now running gtk_main ()\n");
  gtk_main ();
  sane_exit ();
  DBG (DBG_debug, "interface: finished\n");
}

int
main (int argc, char **argv)
{
  DBG_INIT ();
  DBG (DBG_debug, "main\n");
  DBG (DBG_error, "xscanimage (version: %s, package: %s) starting\n", VERSION,
       PACKAGE);
  little_endian = calc_little_endian ();
  scan_win.mode = STANDALONE;
  gtk_quit_flag = 0;
  prog_name = strrchr (argv[0], '/');
  if (prog_name)
    ++prog_name;
  else
    prog_name = argv[0];

#ifdef HAVE_LIBGIMP_GIMP_H
  {
    GPrintFunc old_print_func;
    GPrintFunc old_printerr_func;
    int result;

    /* Temporarily install a print function that discards all output.
       This is to avoid annoying "you must run this program under
       gimp" messages when xscanimage gets invoked in stand-alone
       mode.  */
    old_print_func = g_set_print_handler (null_print_func);
    old_printerr_func = g_set_printerr_handler (null_print_func);
    /* gimp_main () returns 1 if xscanimage wasn't invoked by GIMP */
# ifdef HAVE_OS2_H
    set_gimp_PLUG_IN_INFO (&PLUG_IN_INFO);
# endif
# ifndef ENABLE_GIMP_1_2
    result = gimp_main (&PLUG_IN_INFO, argc, argv);
# else
    result = gimp_main (argc, argv);
# endif	/* !ENABLE_GIMP_1_2 */
    g_set_print_handler (old_print_func);
    g_set_printerr_handler (old_printerr_func);
    if (result)
      interface (argc, argv);
  }
#else
  interface (argc, argv);
#endif /* HAVE_LIBGIMP_GIMP_H */
  DBG (DBG_debug, "main: finished\n");
  return 0;
}
