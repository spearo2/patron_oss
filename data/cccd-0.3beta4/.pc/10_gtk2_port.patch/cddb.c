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

   $Id: cddb.c,v 0.3.3.2 1998/09/06 18:04:25 jochen Exp jst $
 */

#include <ctype.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <dirent.h>
#include <sys/stat.h>
#include <gtk/gtk.h>

#include "general.h"
#include "cd.h"
#include "cddbp.h"
#include "misc.h"
#include "options.h"
#include "cddb.h"

unsigned long int cddb_disk_id(int length, int tracknum,
			       long int offset[])
{
  int track;
  long int result = 0, tmp;

  for (track = 0; track < tracknum; track++) {
    tmp = offset[track] / 75;
    do {
      result += tmp % 10;
      tmp /= 10;
    } while (tmp != 0);
  }

  return (result % 0xff) << 24 | (length - (offset[0] / 75)) << 8 | tracknum;
}


int cddb_lookup(struct audio_cd *cd, char **data, int mode,
		const char *server, short int port, int protocol,
		const char *path)
{
  int tracknum, i;
  long int offset[100];
  enum lookup_protocol proto = protocol;
  enum lookup_order order = mode;
  enum errors status;

  tracknum = cd->last_track - cd->first_track + 1;
  for (i = 0; i < tracknum; i++)
    offset[i] = cd->toc[i + cd->first_track].offset;

  /* now do the lookup */
  switch (order) {
  case REMOTE_LOCAL:
    if ((status = remote_lookup(cd->id, tracknum, offset, cd->rlength, server,
				port, proto, data)) == REMOTE_OK)
      break;
    status = local_lookup(cd->id, path, data);
    if (data != NULL)
      string_append(data, "\r\n.\r\n");
    break;

  case LOCAL_REMOTE:
    if ((status = local_lookup(cd->id, path, data)) == LOCAL_OK) {
      if (data != NULL)
	string_append(data, "\r\n.\r\n");
      break;
    }
    status = remote_lookup(cd->id, tracknum, offset, cd->rlength, server,
			   port, proto, data);
    break;

  case REMOTE:
    status = remote_lookup(cd->id, tracknum, offset, cd->rlength, server,
			   port, proto, data);
    break;

  case LOCAL:
    status = local_lookup(cd->id, path, data);
    if (data != NULL)
      string_append(data, "\r\n.\r\n");
    break;

  default:
    return PARAM_ERROR;
  }

  return status;
}





enum errors remote_lookup(const char *cd_id, int tracknum,
			  long int offset[tracknum], int duration,
			  const char *server, short int port,
			  enum lookup_protocol proto, char **result)
{
  int matches, status, i;
  char **category = NULL, **title = NULL, **alt_id = NULL;
  char *final_cat, *final_id, *url, *wwwserver = NULL;
  FILE *sock = NULL;


/* first lets connect to the server and perform a query to get all possible
   alternatives */
  if (proto == CDDBP) {		/* cddbp */
    sock = socket_init(server, port);
    if (sock == NULL)
      return NO_CONNECT;

    status = cddbp_signon(sock);
    switch (status) {
    case 200:
    case 201:			/* might want to differenciate when write() is supported
				   on the server side */
      break;
    case 432:
    case 433:
    case 434:
      fclose(sock);
      return CONNECT_REFUSED;
    default:
      fclose(sock);
      return SERVER_ERROR;
    }

    status = cddbp_handshake(sock, NAME, VERSION);
    switch (status) {
    case 200:
    case 402:
      break;
    case 431:
      fclose(sock);
      return CONNECT_REFUSED;
    default:
      fclose(sock);
      return SERVER_ERROR;
    }

    status = cddbp_query(sock, cd_id, tracknum, offset, duration, &matches,
			 &category, &title, &alt_id);
  }
  else {			/* http */
    wwwserver = url = strdup(server);
    wwwserver = strsep(&url, "/");
    status = http_query(wwwserver, port, url, cd_id, tracknum, offset,
	     duration, &matches, &category, &title, &alt_id, NAME, VERSION);
  }
  switch (status) {
  case 200:
  case 211:
    break;
  case 202:
    if (proto == CDDBP)
      cddbp_signoff(sock);
    return NOT_FOUND;
  case 403:
    if (proto == CDDBP)
      cddbp_signoff(sock);
    return SERVER_ERROR;
  default:
    fclose(sock);
    return SERVER_ERROR;
  }

  final_cat = strdup(category[0]);
  final_id = strdup(alt_id[0]);

  for (i = 0; i < matches; i++) {
    free(category[i]);
    free(title[i]);
    free(alt_id[i]);
  }
  free(category);
  free(title);
  free(alt_id);

  /* now we have the alternative which we want? check to see if alternate_list
     can be called if and when gtk becomes thread safe. */

  if (proto != CDDBP) {		/* http */
    status = http_read(wwwserver, port, url, final_cat, final_id, result,
		       NAME, VERSION);
  }
  else {			/* cddbp */
    status = cddbp_read(sock, final_cat, final_id, result);
  }
  switch (status) {
  case 210:
    break;
  case 401:
    if (proto == CDDBP)
      cddbp_signoff(sock);
    return NOT_FOUND;
  case 403:
    if (proto == CDDBP)
      cddbp_signoff(sock);
    return SERVER_ERROR;
  default:
    fclose(sock);
    return SERVER_ERROR;
  }

  if (proto == CDDBP)
    cddbp_signoff(sock);

  free(final_cat);
  free(final_id);

  return REMOTE_OK;
}


enum errors local_lookup(const char *cd_id, const char *path, char **result)
{
  int matches = 0, status = 0, subdir_num = 0, i;
  char **subdir = (char **) malloc(1000 * sizeof(char *));
  char **title = (char **) malloc(1000 * sizeof(char *));
  DIR *dirp, *subdirp;
  struct dirent *dir_contents, *subdir_contents;
  struct stat file_stats;
  char *filename, *subdirname, *buffer, *mark, *final_cat;
  FILE *file;

  /* change the working dir to path */
  if (path == NULL || (dirp = opendir(path)) == NULL)
    return NO_CONNECT;

  while ((dir_contents = readdir(dirp)) != NULL) {
    if (strcmp(dir_contents->d_name, ".") != 0 &&
	strcmp(dir_contents->d_name, "..") != 0) {

      subdirname = (char *) malloc(strlen(path) +
				   strlen(dir_contents->d_name) + 2);
      sprintf(subdirname, "%s/%s", path, dir_contents->d_name);
      status = stat(subdirname, &file_stats);

      if (status == 0 && subdir_num < 1000) {

	if (S_ISDIR(file_stats.st_mode)) {
	  /* is the file a directory? */
	  if ((subdirp = opendir(subdirname)) != NULL) {
	    /*only enter if we may */

	    while ((subdir_contents = readdir(subdirp)) != NULL) {
	      if (strcmp(subdir_contents->d_name, cd_id) == 0) {
		/* we found one */

		filename = (char *) malloc(strlen(subdirname) + strlen(cd_id) + 2);
		sprintf(filename, "%s/%s", subdirname, cd_id);
		status = stat(filename, &file_stats);
		if (status < 0 || !S_ISREG(file_stats.st_mode))
		  continue;

		file = fopen(filename, "r");
		if (file != NULL) {
		  /* we can read the file. therefore it is a match. */
		  /* quick! take his licence number! or the subdir, 
		     name=category */
		  subdir[subdir_num] = strdup(dir_contents->d_name);

		  buffer = get_ascii_file(file);
		  fclose(file);

		  mark = strstr(buffer, "DTITLE") + 7;
		  i = strcspn(mark, "\r\n");
		  title[subdir_num] = (char *) malloc(i + 1);
		  strncpy(title[subdir_num], mark, i);
		  title[subdir_num][i] = 0;
		  free(buffer);
		  matches++;
		  subdir_num++;
		}
		free(filename);
	      }
	    }
	    closedir(subdirp);
	  }
	}
      }
      free(subdirname);
    }
  }
  closedir(dirp);

  /* now we should have all possible matches in our buffers */
  if (matches == 0)
    return NOT_FOUND;

  /* alternate handling */
  final_cat = subdir[0];

  /* get the result data and return */
  filename = (char *) malloc(strlen(path) + 1 + strlen(final_cat) + 1 + strlen(cd_id) + 1);
  sprintf(filename, "%s/%s/%s", path, final_cat, cd_id);
  file = fopen(filename, "rt");
  *result = get_ascii_file(file);
  fclose(file);

  free(filename);

  /* free memory in the subdir and title buffers */
  for (i = 0; i < matches; i++) {
    free(title[i]);
    free(subdir[i]);
  }
  free(title);
  free(subdir);

  return LOCAL_OK;
}


int cddb_handle_data(struct audio_cd *cd, const char *data)
{
  char *row, *mark;
  const char *tmp = data;
  int i, counter = 0, track, oldtrack = 0;

  if (strncmp(data, "# xmcd", 6) != 0)
    return -1;

  while (*tmp != 0) {		/* check against end of string */

    /* get the row */
    i = strcspn(tmp, "\r\n");
    while (tmp[i] == '\r' || tmp[i] == '\n')
      i++;

    row = (char *) malloc(i + 1);
    strncpy(row, tmp, i);
    row[i] = 0;
    tmp += i;

    /* eval the row */
    if (strncmp(row, "TTITLE", 6) == 0) {	/* Track TItle */
      /* get the track number before going on */
      /* skip the TTITLE */
      mark = row + 6;
      counter = 0;

      /* convert ascii -> int */
      while (*mark != '=') {
	counter *= 10;
	counter += *mark - 0x30;
	mark++;
      }
      mark++;			/* and skip the '=' */
      /* here we check for continuation lines */
      track = counter + cd->first_track;

      if (track != oldtrack) { /* new track read */
        /* copy the track title into the cd struct */
        if (cd->toc[track].title != NULL)
      	  free(cd->toc[track].title);
        cd->toc[track].title = strdup(mark);
        /* FIXME: this is ugly when the continuation occurs at |: hello |world */
        strip_trailing_space(&cd->toc[track].title);	/* this gets rid of \r\n, \n or whatever */
        strip_leading_space(&cd->toc[track].title);
        oldtrack = track;
      }
      else { /* its a continuation line ... just like old days */
        cd->toc[track].title = string_append(&cd->toc[track].title, mark);
        strip_trailing_space(&cd->toc[track].title);	/* this gets rid of \r\n, \n or whatever */
      }
    }
    else if (strncmp(row, "DTITLE", 6) == 0) {	/* CD Title */
      i = strcspn(row, "=");
      i++;			/* skip to the data */
      mark = row + i;

      if (cd->title != NULL)
	free(cd->title);
      cd->title = strdup(mark);
      strip_trailing_space(&cd->title);		/* this gets rid of \r\n, \n or whatever */
      strip_leading_space(&cd->title);
    }
    else if (strncmp(row, "EXTD", 4) == 0) {	/* CD comments */
      mark = row + 5;		/* move to the data */
      string_append(&cd->comments, mark);
      strip_trailing_space(&cd->comments);	/* this gets rid of \r\n, \n or whatever */
    }
    else if (strncmp(row, "EXTT", 4) == 0) {	/* Track comments */
      mark = row + 4;		/* move to the track number */
      counter = 0;
      while (*mark != '=') {
	counter *= 10;
	counter += *mark - 0x30;
	mark++;
      }
      mark++;			/* and skip the '=' */
      track = counter + cd->first_track;

      string_append(&cd->toc[track].comments, mark);
      strip_trailing_space(&cd->toc[track].comments);	/* this gets rid of \r\n, \n or whatever */
    }
    else if (strncmp(row, "PLAYLIST", 8) == 0) {	/* Playlist */
      mark = strchr(row, '=');
      do {
	do {
	  mark++;
	} while (isspace(*mark) && *mark != 0);

	counter = 0;
	while (isdigit(*mark)) {
	  counter *= 10;
	  counter += *mark - 0x30;
	  mark++;
	}
	cd->toc[counter].play = 1;
      } while ((mark = strchr(mark, ',')) != NULL);
    }
    else if (strncmp(row, "# Revision", 10) == 0) {	/* revision */
      mark = strchr(row, ':') + 1;
      while (isspace(*mark))
	mark++;
      counter = 0;
      while (isdigit(*mark)) {
	counter *= 10;
	counter += *mark - 0x30;
	mark++;
      }
      cd->revision = counter;
    }
    /* ignore any other results */
    free(row);
  }

  return 0;
}

#define CDDB_MAX_LINELEN 80
/* here we convert our internal representation of CDDB data to the
   CDDB format. according to cddb.howto 1.23 98/05/12, App B, this means
   a line ends with \n only */
char *cddb_collate_data(struct audio_cd *cd, char **result)
{
  char *tmp, *row, *mark;
  int i;

  if (*result != NULL)
    free(*result);

  row = (char *) malloc(81); /* one row of CDDB file */
  /* first, print the header */
  *result = strdup("# xmcd\n#\n# Track frame offsets:\n");

  /* then add the track offsests */
  for (i = cd->first_track; i < cd->last_track + 1; i++) {
    sprintf(row, "#\t%ld\n", cd->toc[i].offset);
    string_append(result, row);
  }

  /* disc length ... */
  sprintf(row, "#\n# Disc length: %d seconds\n", cd->rlength);
  string_append(result, row);

  /* and revision */
  sprintf(row, "#\n# Revision: %d\n# Submitted via: %s %s\n#\n",
	  cd->revision, NAME, VERSION);
  string_append(result, row);

  /* discid */
  sprintf(row, "DISCID=%s\n", cd->id);
  string_append(result, row);

  /* disc title */
  if (cd->title != NULL) {
    tmp = (char *) malloc(strlen(cd->title) + strlen("DTITLE=\n") + 1);
    sprintf(tmp, "DTITLE=%s\n", cd->title);
    strncpy(row, tmp, CDDB_MAX_LINELEN);
    if (strlen(tmp) < CDDB_MAX_LINELEN)
      row[strlen(tmp)] = 0;
    else { /* FIXME: if DTITLE > 80 it is truncated */
      row[CDDB_MAX_LINELEN-1] = '\n';
      row[CDDB_MAX_LINELEN] = 0;
    }
    free(tmp);
  }
  else
    sprintf(row, "DTITLE=\n"); /* in case it's empty */
  string_append(result, row);

  /* do all the track titles */
  for (i = cd->first_track; i < cd->last_track + 1; i++) {
    if (cd->toc[i].title != NULL) {
      tmp = (char *) malloc(strlen(cd->toc[i].title) + strlen("TTITLE99=\n") + 1);
      sprintf(tmp, "TTITLE%d=%s\n", (i - cd->first_track), cd->toc[i].title);
      /* here we expand lines that are too long to multiple lines */
      strncpy(row, tmp, CDDB_MAX_LINELEN);
      if (strlen(tmp) >= CDDB_MAX_LINELEN) {
        row[CDDB_MAX_LINELEN-1] = '\n';
	row[CDDB_MAX_LINELEN] = 0;
        string_append(result, row); /* flush row to output */
        mark = (char *) malloc(strlen(cd->toc[i].title) + strlen("TTITLE99=\n") + 1);
	sprintf(mark, "TTITLE%d=%s", (i - cd->first_track), tmp+CDDB_MAX_LINELEN-1);
	strncpy(row, mark, CDDB_MAX_LINELEN);
	row[(strlen(mark) < CDDB_MAX_LINELEN) ? strlen(mark) : CDDB_MAX_LINELEN] = 0;
	free(mark);
      }
      else row[strlen(tmp)] = 0;
      free(tmp);
    }
    else
      sprintf(row, "TTITLE%d=\n", (i - cd->first_track));
    string_append(result, row);
  }

  /* extended data (comments) */
  if (cd->comments != NULL) {
    tmp = cd->comments;
    do {
      strcpy(row, "EXTD=");
      strncat(row, tmp, 80 - strlen("EXTD=\n"));
      strcat(row, "\n");
      string_append(result, row);
      tmp += strlen(row) - strlen("EXTD=\n");
    } while (*tmp != 0);
  }
  else
    string_append(result, "EXTD=\n");

  /* track comments */
  for (i = cd->first_track; i < cd->last_track + 1; i++) {
    if (cd->toc[i].comments != NULL) {
      tmp = cd->toc[i].comments;
      do {
	sprintf(row, "EXTT%d=", i - cd->first_track);
	strncat(row, tmp, 80 - strlen("EXTT99=\n"));
	strcat(row, "\n");
	string_append(result, row);
	tmp += strlen(row) - strlen("EXTT99=\n");
      } while (*tmp != 0);
    }
    else {
      sprintf(row, "EXTT%d=\n", i - cd->first_track);
      string_append(result, row);
    }
  }

  /* the playlist */
  strcpy(row, "PLAYORDER=");
  tmp = (char *) malloc(5);
  for (i = cd->first_track; i < cd->last_track + 1; i++) {
    if (strlen(row) > 75) {	/* only 80 char/row allowed. check for overflow */
      strcat(row, "\n");
      string_append(result, row);
      strcpy(row, "PLAYORDER=");
    }
    if (cd->toc[i].play && cd->toc[i].audio) {
      sprintf(tmp, "%d", i - cd->first_track);
      if (i < cd->last_track)
	strcat(tmp, ",");
      strcat(row, tmp);
    }
  }
  string_append(result, row);

  free(row);
  /* and we are done */
  return *result;
}


enum errors cddb_remote_categories(const char *server, short int port,
				   enum lookup_protocol proto,
				   char **category, int *cat_num)
{
  int status, size;
  char *buffer = NULL, *tmp, *wwwserver, *url;
  FILE *socket;

  if (proto == CDDBP) {
    socket = socket_init(server, port);
    if (socket == NULL)
      return NO_CONNECT;

    status = cddbp_signon(socket);
    switch (status) {
    case 200:
    case 201:			/* might want to differenciate when write() is supported
				   on the server side */
      break;
    case 432:
    case 433:
    case 434:
      fclose(socket);
      return CONNECT_REFUSED;
    default:
      fclose(socket);
      return SERVER_ERROR;
    }

    status = cddbp_handshake(socket, NAME, VERSION);
    switch (status) {
    case 200:
    case 402:
      break;
    case 431:
      fclose(socket);
      return CONNECT_REFUSED;
    default:
      fclose(socket);
      return SERVER_ERROR;
    }

    status = cddbp_stat(socket, &buffer);
    cddbp_signoff(socket);
    fclose(socket);
  }
  else {
    wwwserver = url = strdup(server);
    wwwserver = strsep(&url, "/");
    status = http_stat(wwwserver, port, url, &buffer, NAME, VERSION);
  }

  if (status != 210) {		/* we have a problem */
    free(buffer);
    return SERVER_ERROR;
  }

  /* skip to the category data */
  tmp = strstr(buffer, "Database entries by category:");
  tmp = strchr(tmp, '\n') + 1;

  *cat_num = 0;
  while (isspace(*tmp) && *cat_num < 99) {
    size = strcspn(tmp, ":");
    category[*cat_num] = (char *) malloc(size + 1);
    strncpy(category[*cat_num], tmp, size);
    category[*cat_num][size] = 0;
    strip_leading_space(&(category[*cat_num]));
    (*cat_num)++;
    tmp = strchr(tmp, '\n') + 1;
  }

  free(buffer);
  return REMOTE_OK;
}
