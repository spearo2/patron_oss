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

   $Id: cd.c,v 0.3.3.2 1999/01/30 16:30:28 jochen Exp $
 */

#include <stdlib.h>
#include <stdio.h>		/* get rid of this one the whole thing is up and running */
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include "cd.h"
#include "general.h"
#include "cddb.h"


/* here is a collection of function needed to control audio cd playing under
   linux */

int toc_entry_copy(struct toc_entry *dest, struct toc_entry *src)
{
  if (dest == NULL || src == NULL)
    return -1;

  if (dest->title != NULL)
    free(dest->title);
  dest->title = NULL;
  if (src->title != NULL) {
    dest->title = strdup(src->title);
  }
  if (dest->comments != NULL)
    free(dest->comments);
  if (src->comments != NULL) {
    dest->comments = strdup(src->comments);
  }

  dest->play = src->play;
  dest->track = src->track;
  dest->length = src->length;
  dest->audio = src->audio;
  dest->offset = src->offset;
  return 0;
}


int audio_cd_copy(struct audio_cd *dest, struct audio_cd *src)
{
  int counter;

  if (dest == NULL || src == NULL)
    return -1;

  if (dest->title != NULL)
    free(dest->title);
  dest->title = NULL;
  if (src->title != NULL) {
    dest->title = strdup(src->title);
  }

  if (dest->category != NULL)
    free(dest->category);
  dest->category = NULL;
  if (src->category != NULL) {
    dest->category = strdup(src->category);
  }

  if (dest->comments != NULL)
    free(dest->comments);
  if (src->comments != NULL)
    dest->comments = strdup(src->comments);

  if (dest->id != NULL)
    free(dest->id);
  if (src->id != NULL)
    dest->id = strdup(src->id);

  dest->handle = src->handle;
  dest->length = src->length;
  dest->rlength = src->rlength;
  dest->cd_time = src->cd_time;
  dest->track_time = src->track_time;
  dest->first_track = src->first_track;
  dest->last_track = src->last_track;
  dest->current_track = src->current_track;
  dest->revision = src->revision;

  for (counter = 0; counter < 100; counter++) {
    if (toc_entry_copy(&dest->toc[counter], &src->toc[counter]) < 0)
      return -1;
  }
  return 0;
}



int cd_open_device(char *devicename)
{
  int handle, i=0;
  do {
    handle = open(devicename, O_RDONLY);
  } while (++i < 500 && handle < 0);
  return handle;
}


int cd_init(int handle, struct audio_cd *cd)
{
  struct toc_entry *toc;
  struct cdrom_tochdr tocheader;
  struct cdrom_multisession ms;
  int status, i = 0, tracknum;
  long int offset[100];

  /* first get the handle. repeat because this function also causes the
     open cd tray to close on most drives and reading a the header while the 
     tray is open causes nonsense data */
  cd->handle = handle;

  do {
    /* get the starting and ending track of the cd */
    usleep(300000);		/* try every 1/3 seconds for max. 30 secs */

    status = ioctl(cd->handle, CDROMREADTOCHDR, &tocheader);
    if (status < 0)
      ioctl(cd->handle, CDROMRESET);
  } while (++i < 90 && status != 0);

  if (status != 0) {
    return -1;
  }
  cd->first_track = tocheader.cdth_trk0;
  cd->last_track = tocheader.cdth_trk1;

/* this should not really happen with proper audio CDs */
  if (cd->last_track > 99) {
    cd->last_track = 99;
/*   g_warning("Only 99 tracks will be played\n"); */
  }

  /* read the toc entrys */
  for (i = cd->first_track; i <= cd->last_track; i++) {
    toc = cd_toc_entry(cd->handle, i);
    if (toc == NULL) {
      return -1;
    }

    cd->toc[i] = *toc;
    free(toc);
  }
  /* here we need some code to fix the TOC for multisession CDs.
     the end of last audio track must be inside first session 
     surprisingly the following code does not yield the correct
     result (as seen in cdparanoiaIII and cdda2wav. if you know
     why, tell me */
  ms.addr_format = CDROM_LBA;
  status = ioctl(cd->handle, CDROMMULTISESSION, &ms);
  /* what is also unclear: if we have a CD with (say)
     1 audio session and two data sessions, how will the
     CDROMMULTISESSION ioctl() give us the correct end of
     the audio session? */

  /* FIXME: this calculation wrong for multisession/mixed mode CDs */
  /* get the leadout track and compute the cd length from that */
  toc = cd_toc_entry(cd->handle, CDROM_LEADOUT);
  if (toc == NULL) {
    return -1;
  }

  /* cd->length = ( toc->offset - cd->toc[cd->first_track].offset ) / 75; */
  cd->rlength = cd->length = toc->offset / 75;
  free(toc);
/* now we compute the CDDB disk id once and for all */
  tracknum = cd->last_track - cd->first_track + 1;
  for (i = 0; i < tracknum; i++)
    offset[i] = cd->toc[i + cd->first_track].offset;

  cd->id = (char *) malloc(10);
  sprintf(cd->id, "%08lx", cddb_disk_id(cd->rlength, tracknum, offset));
/* now we can mangle up the track and disk length of multisession/mixed mode CD */
/* since the ioctl() does not work, we use heuristics */
  for (i = cd->last_track; i > 0; i--) {
    if (i > 0 && !cd->toc[i].audio)
      cd->length -= cd->toc[i].length;
    if (i > 0 && !cd->toc[i].audio && cd->toc[i - 1].audio) {
#ifdef DEUBG
      printf("last audio: %d first data: %d\n", i - 1, i);
#endif
      cd->toc[i - 1].length -= 152;	/* magic number, don't ask */
      cd->length -= 152;
      break;
    }
  }
  cd->title = NULL;
  cd->comments = NULL;
  cd->revision = -1;
/*  cd->id = NULL; it already contains data */

  return 0;
}

/* check if given track is last track on CD 
   read the CD TOC, instead of carrying extra data around */
int is_last_track(int handle, int track)
{
  struct cdrom_tochdr tocheader;
  int status;
  if ((status = ioctl(handle, CDROMREADTOCHDR, &tocheader)))
    return 0;
#ifdef DEBUG_CD
  printf("is_last_track: %d vs %d (%d)\n", track, tocheader.cdth_trk1, status);
#endif
  return (track == tocheader.cdth_trk1);
}

struct toc_entry *cd_toc_entry(int handle, int track)
{
  struct toc_entry *toc = (struct toc_entry *) malloc(sizeof(struct toc_entry));
  struct cdrom_tocentry tocentry;
  struct cdrom_tochdr tocheader;
  int status;

  tocentry.cdte_track = track;
  tocentry.cdte_format = CDROM_MSF;

  status = ioctl(handle, CDROMREADTOCENTRY, &tocentry);
  if (status != 0) {
    free(toc);
    return NULL;
  }

  toc->track = track;
  toc->offset = MSF_TO_FRAME(tocentry.cdte_addr.msf);

  /* set the flag to indicate if the track contains audio or data */
  /* TODO: double check functionality here */
  /* it's buggy. if track is data track, tocentry.cdte_ctrl is 0x04, ANDing
     with CDROM_DATA_TRACK still yields 4. XOR that with 1 gives 5. too bad
     we only check audio != 0 before playing. this is fixed now */
  toc->audio = ((tocentry.cdte_ctrl & CDROM_DATA_TRACK) >> 2) ^ 1;

  /* calculate the track length, if we aren't the leadout track */
  if (track != CDROM_LEADOUT) {
    status = ioctl(handle, CDROMREADTOCHDR, &tocheader);
    if (status != 0) {
      free(toc);
      return NULL;
    }

    /* if we're at the next track, we need to compare to the leadout track */
    tocentry.cdte_track = (track == tocheader.cdth_trk1) ? CDROM_LEADOUT : track + 1;

    status = ioctl(handle, CDROMREADTOCENTRY, &tocentry);
    if (status != 0) {
      free(toc);
      return NULL;
    }
    /* subtract our tracks offset from the offset of the next track and then
       divide by 75 to get the tracklength in seconds */
    toc->length = (MSF_TO_FRAME(tocentry.cdte_addr.msf) - toc->offset) / 75;
  }

  /* blank out the track title. to be filled in by the user */
  toc->title = NULL;
  toc->comments = NULL;
  toc->play = toc->audio;

  return toc;
}


/* cd_status
   reports CDROM audio status from handle
 */
int cd_status(int handle)
{
  struct cdrom_subchnl subchannel;
  struct cdrom_msf0 msf0, msf1;
  int status;

  subchannel.cdsc_format = CDROM_MSF;
  status = ioctl(handle, CDROMSUBCHNL, &subchannel);
  if (status != 0) {
    return CDROM_AUDIO_ERROR;
  }
  /* check for 'hidden playing', i.e. when the drive is playing through
     front panel commands, or still playing because of an earlier session */

  if (subchannel.cdsc_audiostatus == CDROM_AUDIO_NO_STATUS) {
    subchannel.cdsc_format = CDROM_MSF;

    ioctl(handle, CDROMSUBCHNL, &subchannel);
    msf0 = subchannel.cdsc_absaddr.msf;
    usleep(40000);		/* sleep for 3 frames[a 3/75 sec] */

    ioctl(handle, CDROMSUBCHNL, &subchannel);
    msf1 = subchannel.cdsc_absaddr.msf;

    if (MSF_TO_FRAME(msf1) > MSF_TO_FRAME(msf0)) {
      return CDROM_AUDIO_PLAY;
    }
  }

  return (subchannel.cdsc_audiostatus);
}



void cd_clear(struct audio_cd *cd)
{
  int i;

  for (i = 0; i < 100; i++) {
    cd->toc[i].track = 0;
    cd->toc[i].length = 0;
    cd->toc[i].audio = 0;
    cd->toc[i].offset = 0;
    cd->toc[i].title = NULL;
    cd->toc[i].comments = NULL;
    cd->toc[i].play = 1;
  }

  cd->handle = 0;
  cd->length = 0;
  cd->rlength = 0;
  cd->cd_time = 0;
  cd->track_time = 0;
  cd->first_track = 0;
  cd->last_track = 0;
  cd->current_track = 0;
  cd->revision = -1;
  cd->title = NULL;
  cd->category = NULL;
  cd->comments = NULL;
  cd->id = NULL;
  cd->toc[0].title = strdup(" ");	/* show nothing when stopped */
}



int cd_deinit(struct audio_cd *cd)
{
  int i;

  for (i = cd->first_track; i <= cd->last_track; i++)
    if (cd->toc[i].title != NULL)
      free(cd->toc[i].title);

  if (cd->title != NULL) {
    free(cd->title);
  }

  if (cd->category != NULL) {
    free(cd->category);
  }

  i = cd->handle;
  cd_clear(cd);
  cd->handle = i;

  return 1;
}

int cd_reset(int handle)
{
  int status = ioctl(handle, CDROMRESET);
  return status;
}

int cd_eject(int handle)
{
  int status = ioctl(handle, CDROMEJECT);
  return status;
}

int cd_close_tray(int handle)
{
  int status = ioctl(handle, CDROMCLOSETRAY);
  return status;
}

/* cd_read_subchannel
   this checks current track and track time and stores in 
   cd structure
   NEW: we also return CDROM audio status when ioctl()
   was ok. otherwise some stati will be gobbled up
 */
int cd_read_subchannel(struct audio_cd *cd)
{
  /* this function will read out the subchannel of the CD drive and set
     the cd_time, track_time and current_track accordingly */
  struct cdrom_subchnl subchannel;
  int status;

  subchannel.cdsc_format = CDROM_MSF;
  status = ioctl(cd->handle, CDROMSUBCHNL, &subchannel);

  if (status < 0)
    return status;

  cd->cd_time = MSF_TO_SEC(subchannel.cdsc_absaddr.msf);
  cd->track_time = MSF_TO_SEC(subchannel.cdsc_reladdr.msf);
  cd->current_track = subchannel.cdsc_trk;
#ifdef DEBUG_CD
  printf("subch: status %0x, current_track %d, track_time %d\n", subchannel.cdsc_audiostatus, cd->current_track, cd->track_time);
#endif
  return subchannel.cdsc_audiostatus;
}

/* this subroutine knows nothing about the CD toc, it only gets
   passed a handle and track number. then it issues several calls
   to CDROM_TOCENTRY and CDROM_TOCHDR to get the information we
   already should know inside the cntl.cd structure. it should be
   evaluated if we can pass the whole cntl.cd to this one, just
   as cd_read_subchannel. */
int cd_audio_play(int handle, int track)
{
  struct cdrom_ti trackinfo;
  struct cdrom_msf msf;
  struct toc_entry *toc;
#ifdef DEBUG
  int l;
#endif

  trackinfo.cdti_trk0 = track;
  trackinfo.cdti_ind0 = 0;
  trackinfo.cdti_trk1 = CDROM_LEADOUT;
  trackinfo.cdti_ind1 = 0;

  /* PLAYMSF probably nicer, at least if TRKIND not supported...
     it happens..
     if(ioctl( handle, CDROMPLAYTRKIND, &trackinfo )==0)
     return 0;
     we comment this out, try to only use PLAYMSF */

  /* ok, this drive doesn't support PLAYTRKIND, so we'll use PLAYMSF */
  toc = cd_toc_entry(handle, track);
  msf.cdmsf_min0 = toc->offset / 4500;
  msf.cdmsf_sec0 = (toc->offset / 75) - (msf.cdmsf_min0 * 60);
  msf.cdmsf_frame0 = toc->offset - (msf.cdmsf_min0 * 60 + msf.cdmsf_sec0) * 75;

#ifdef DEBUG
  l = toc->length;
#endif

  toc = cd_toc_entry(handle, (is_last_track(handle, track)) ? CDROM_LEADOUT : track + 1);
  msf.cdmsf_min1 = toc->offset / 4500;
  msf.cdmsf_sec1 = (toc->offset / 75) - (msf.cdmsf_min1 * 60);
  msf.cdmsf_frame1 = toc->offset - (msf.cdmsf_min1 * 60 + msf.cdmsf_sec1) * 75;

#ifdef DEBUG
  printf("Play: %d:%d:%d -> %d:%d:%d (%d seconds)\n", msf.cdmsf_min0, msf.cdmsf_sec0, msf.cdmsf_frame0, msf.cdmsf_min1, msf.cdmsf_sec1, msf.cdmsf_frame1, l);
#endif

  if (ioctl(handle, CDROMPLAYMSF, &msf) == 0)
    return 0;

  return -1;
}


int cd_audio_stop(int handle)
{
  return ioctl(handle, CDROMSTOP);
}



int cd_audio_pause(int handle)
{
  return ioctl(handle, CDROMPAUSE);
}



int cd_audio_resume(int handle)
{
  return ioctl(handle, CDROMRESUME);
}


/* the following functions are legacy functions. they are not used in cccd */
int cd_audio_position(int handle, int mode)
{
  struct cdrom_subchnl subchannel;
  int status;

  subchannel.cdsc_format = CDROM_MSF;
  status = ioctl(handle, CDROMSUBCHNL, &subchannel);
  if (status != 0 || (mode != 0 && mode != 1))
    return -1;

  if (mode == 0) {		/* absolute audio position in seconds */
    status = MSF_TO_SEC(subchannel.cdsc_absaddr.msf);
  }
  else {			/* relative audio position in seconds */
    status = MSF_TO_SEC(subchannel.cdsc_reladdr.msf);
  }

  return status;
}


int cd_audio_current_track(int handle)
{
  struct cdrom_subchnl subchannel;
  int status;

  subchannel.cdsc_format = CDROM_MSF;
  status = ioctl(handle, CDROMSUBCHNL, &subchannel);
  if (status != 0) {
    return -1;
  }

  return subchannel.cdsc_trk;
}


/* the return value is in seconds */

int cd_audio_position_absolute_done(struct audio_cd *cd)
{
  return cd_audio_position(cd->handle, 0);
}

int cd_audio_position_absolute_remain(struct audio_cd *cd)
{
  return (cd->length - cd_audio_position(cd->handle, 0));
}

int cd_audio_position_relative_done(struct audio_cd *cd, int track)
{
  return (cd_audio_position(cd->handle, 1));
}

int cd_audio_position_relative_remain(struct audio_cd *cd, int track)
{
  return (cd->toc[track].length - cd_audio_position(cd->handle, 1) -
	  cd->toc[cd->first_track].offset / 75);
}
