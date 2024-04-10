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

   $Id: cd.h,v 0.3.3.1 1998/08/20 16:09:09 jochen Exp $
 */

#ifndef CCCD_CD_H
#define CCCD_CD_H

#include <sys/types.h>
#ifdef __linux__
#include <linux/cdrom.h>
#endif
#ifdef __GNU__
#include <sys/cdrom.h>
#endif

#define MSF_TO_SEC(msf) ( msf.minute*60 + msf.second )
#define MSF_TO_FRAME(msf) ( MSF_TO_SEC(msf)*75 + msf.frame )


struct toc_entry {
  int track;
  int play;
  int length;			/* in seconds */
  int audio;			/* flag to show if the track contains audio material 1=audio */
  long int offset;		/* offset in frames; max is about 360000 */
  char *title;
  char *comments;
};

struct audio_cd {
  int handle;
/* for mixed mode CDs we may manipulate the toc directly, so times are correctly
   displayed. we must make sure, we have the original data somewhere */
  int length;			/* in seconds minus the lead in duration (for displaying) */
  int rlength;			/* in seconds minus the lead in duration (for CDDB) */
  int cd_time;			/* absolute passed time in seconds */
  int track_time;		/* time passed, relative to track */
  char *title;
  char *category;
  char *comments;
  int first_track;
  int last_track;
  int current_track;
  int revision;			/* for cddb */
  char *id;			/* dito */
  struct toc_entry toc[100];
};

/* copy functions for the structs */
int toc_entry_copy(struct toc_entry *dest, struct toc_entry *src);
int audio_cd_copy(struct audio_cd *dest, struct audio_cd *src);

/* general functions */
int cd_open_device(char *devicename);
int cd_init(int handle, struct audio_cd *cd);
struct toc_entry *cd_toc_entry(int handle, int track);
int cd_status(int handle);
void cd_clear(struct audio_cd *cd);
int cd_deinit(struct audio_cd *cd);
int cd_reset(int handle);
int cd_eject(int handle);
int cd_close_tray(int handle);
int cd_read_subchannel(struct audio_cd *cd);

/* audio cd actions */
int cd_audio_play(int handle, int track);
int cd_audio_stop(int handle);
int cd_audio_pause(int handle);
int cd_audio_resume(int handle);
int cd_audio_position(int handle, int mode);	/* return value in seconds 
						   mode = 0 absolute, 
						   1 = relative */
int cd_audio_current_track(int handle);

/* audio cd time conversion functions */
int cd_audio_position_absolute_done(struct audio_cd *cd);
int cd_audio_position_absolute_remain(struct audio_cd *cd);
int cd_audio_position_relative_done(struct audio_cd *cd, int track);
int cd_audio_position_relative_remain(struct audio_cd *cd, int track);

#endif /* CCCD_CD_H */
