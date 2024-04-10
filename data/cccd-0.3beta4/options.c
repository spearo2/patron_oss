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

   $Id: options.c,v 0.3.3.2 2002/01/06 22:44:52 jst Exp $
 */

#include <ctype.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "general.h"
#include "misc.h"
#include "options.h"

int options_copy(struct options *dest, struct options *src)
{
  if (dest == NULL || src == NULL)
    return -1;

  /* copy the server */
  if (dest->server != NULL)
    free(dest->server);
  dest->server = NULL;
  if (src->server != NULL) {
    dest->server = strdup(src->server);
  }
  dest->port = src->port;
  dest->save = src->save;

  /* path */
  if (dest->path != NULL)
    free(dest->path);
  dest->path = NULL;
  if (src->path != NULL) {
    dest->path = strdup(src->path);
  }

  if (dest->remote_submit != NULL)
    free(dest->remote_submit);
  dest->remote_submit = NULL;
  if (src->remote_submit != NULL)
    dest->remote_submit = strdup(src->remote_submit);

  dest->protocol = src->protocol;
  dest->lookup = src->lookup;
  return 1;
}


int options_clear(struct options *o)
{
  o->server = NULL;
  o->remote_submit = NULL;
  o->path = NULL;
  o->port = 0;
  o->save = 0;
  o->protocol = CDDBP;
  o->lookup = NONE;
  return 1;
}

int options_load(struct options *o)
{
  char *filepath, *string, *tmp;
  FILE *file;

  filepath = (char *) malloc(strlen(getenv("HOME")) + strlen(RCFILE) + 2);
  sprintf(filepath, "%s/%s", getenv("HOME"), RCFILE);

  file = fopen(filepath, "rt");
  free(filepath);

  options_clear(o);

  if (file == NULL) {		/* we couldn't open the config file. improvise */
    printf("Couldn't open ~/%s! \n", RCFILE);

    o->server = (char *) malloc(strlen("freedb.freedb.org") + 1);
    strcpy(o->server, "freedb.freedb.org");
    o->port = 8880;
    o->protocol = CDDBP;
    o->remote_submit = NULL;
    o->path = NULL;
    o->save = 0;
    o->lookup = NONE;
  }
  else {			/* we have a rc file. lets parse it (ugh) */
    while ((string = get_string_piece(file, '\n')) != NULL) {
      strip_trailing_space(&string);
      strip_leading_space(&string);
      /* got a row */
      /* the keywords in the rc file are:
         SERVER: the cddb server
         PORT:   the port number for the server
         PROTOCOL=[CDDB,HTTP]: the lookup protocol
         REMOTECAT: list of categories applicable for the remote database,
         separated by ';'
         PATH: path to the root dir of the local database
         LOOKUPORDER=[NONE, LOCAL, REMOTE, REMOTELOCAL, LOCALREMOTE] :
         the order of the databases to check
         SAVE=[TRUE, FALSE]: should remote looked up databases be saved 
         locally? */

      if (strncmp(string, "SERVER", 6) == 0) {	/* we have a server! */
	tmp = string + strcspn(string, "=") + 1;	/* skip to the value part */
	while (isspace(*tmp) && *tmp != 0)
	  tmp++;

	o->server = strdup(tmp);
      }

      else if (strncmp(string, "PORT", 4) == 0) {	/* port number */
	tmp = string + strcspn(string, "=") + 1;	/* skip to the value part */
	while (!isdigit(*tmp) && *tmp != 0)
	  tmp++;

	o->port = 0;
	while (isdigit(*tmp)) {
	  o->port *= 10;
	  o->port += *tmp - 0x30;
	  tmp++;
	}
      }

      else if (strncmp(string, "PROTOCOL", 8) == 0) {	/* port number */
	tmp = string + strcspn(string, "=") + 1;	/* skip to the value part */
	while (isspace(*tmp) && *tmp != 0)
	  tmp++;

	if (strncmp(tmp, "HTTP", 4) == 0)
	  o->protocol = HTTP;
	else
	  o->protocol = CDDBP;
      }

      else if (strncmp(string, "REMOTESUBMIT", 9) == 0) {	/* port number */
	tmp = string + strcspn(string, "=") + 1;	/* skip to the value part */
	while (isspace(*tmp) && *tmp != 0)
	  tmp++;
	o->remote_submit = strdup(tmp);
      }

      else if (strncmp(string, "PATH", 4) == 0) {	/* port number */
	tmp = string + strcspn(string, "=") + 1;	/* skip to the value part */
	while (isspace(*tmp) && *tmp != 0)
	  tmp++;

	o->path = strdup(tmp);
      }

      else if (strncmp(string, "LOOKUPORDER", 11) == 0) {	/* port number */
	tmp = string + strcspn(string, "=") + 1;	/* skip to the value part */
	while (isspace(*tmp) && *tmp != 0)
	  tmp++;

	if (strncmp(tmp, "REMOTELOCAL", 11) == 0)
	  o->lookup = REMOTE_LOCAL;
	else if (strncmp(tmp, "LOCALREMOTE", 11) == 0)
	  o->lookup = LOCAL_REMOTE;
	else if (strncmp(tmp, "REMOTE", 6) == 0)
	  o->lookup = REMOTE;
	else if (strncmp(tmp, "LOCAL", 5) == 0)
	  o->lookup = LOCAL;
	else
	  o->lookup = NONE;
      }

      else if (strncmp(string, "SAVE", 4) == 0) {	/* port number */
	tmp = string + strcspn(string, "=") + 1;	/* skip to the value part */
	while (isspace(*tmp) && *tmp != 0)
	  tmp++;

	if (strncmp(tmp, "TRUE", 4) == 0)
	  o->save = 1;
	else
	  o->save = 0;
      }
      free(string);
    }

    fclose(file);
    options_check(o);		/* check for balant mistakes */
  }

  return 1;
}


int options_save(struct options *o)
{
  char *filepath;
  FILE *file;

  filepath = (char *) malloc(strlen(getenv("HOME")) + strlen(RCFILE) + 2);
  sprintf(filepath, "%s/%s", getenv("HOME"), RCFILE);

  file = fopen(filepath, "wt");
  free(filepath);

  if (file == NULL) {
    printf("Could not open ~/%s for writing! \n", RCFILE);
    return -1;
  }

  if (o->server != NULL)
    fprintf(file, "SERVER=%s\n", o->server);
  if (o->port != 0)
    fprintf(file, "PORT=%d\n", o->port);

  if (o->protocol == HTTP)
    fprintf(file, "PROTOCOL=HTTP\n");
  else
    fprintf(file, "PROTOCOL=CDDBP\n");

  if (o->remote_submit != NULL)
    fprintf(file, "REMOTESUBMIT=%s\n", o->remote_submit);

  if (o->path != NULL)
    fprintf(file, "PATH=%s\n", o->path);

  switch (o->lookup) {
  case LOCAL_REMOTE:
    fprintf(file, "LOOKUPORDER=LOCALREMOTE\n");
    break;
  case REMOTE_LOCAL:
    fprintf(file, "LOOKUPORDER=REMOTELOCAL\n");
    break;
  case LOCAL:
    fprintf(file, "LOOKUPORDER=LOCAL\n");
    break;
  case REMOTE:
    fprintf(file, "LOOKUPORDER=REMOTE\n");
    break;
  default:
    fprintf(file, "LOOKUPORDER=NONE\n");
    break;
  }

  if (o->save)
    fprintf(file, "SAVE=TRUE\n");
  else
    fprintf(file, "SAVE=FALSE\n");

  fflush(file);
  fclose(file);
  return 1;
}


int options_check(struct options *o)
{
  /* TODO: check for mistakes/inconsistencies in the structure */
  return 1;
}
