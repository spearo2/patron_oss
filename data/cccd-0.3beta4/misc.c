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

   $Id: misc.c,v 0.3.3.1 1998/08/20 16:09:09 jochen Exp jst $
 */

#include <ctype.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <dirent.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

char *get_string_piece(FILE * file, int delim)
{
  /* gets one complete row from 'file' and save it in 'buffer'.
     buffer's memory will be freed and allocated to fit the stringsize
     automatically. */

  char *buffer1 = (char *) malloc(1), *buffer2 = (char *) malloc(1), *tmp = (char *) malloc(1024);
  char **active, **inactive = NULL;
  int i = 0;

  strcpy(buffer1, "");
  strcpy(buffer2, "");
  strcpy(tmp, "");
  do {
    /*switch the frames */
    if (inactive == &buffer1) {
      active = &buffer1;
      inactive = &buffer2;
    }
    else {
      active = &buffer2;
      inactive = &buffer1;
    }
    /*get the next part, and handle EOF */
    if (fgets(tmp, 1024, file) == NULL) {	/* ok, so we reached the end of the
						   file w/o finding the delimiter */
      free(*active);
      return NULL;
    }

    free(*active);
    *active = (char *) malloc((++i) * 1024);
    sprintf(*active, "%s%s", *inactive, tmp);

  } while (strchr(*active, delim) == NULL);

  free(*inactive);
  return *active;
}

char *get_ascii_file(FILE * file)
{
  /* gets one complete row from 'file' and save it in 'buffer'.
     buffer's memory will be freed and allocated to fit the stringsize
     automatically. */

  char *buffer1 = (char *) malloc(1), *buffer2 = (char *) malloc(1), *tmp = (char *) malloc(1024);
  char **active, **inactive = NULL;
  int i = 0;

  strcpy(buffer1, "");
  strcpy(buffer2, "");
  strcpy(tmp, "");
  do {
    /*switch the frames */
    if (inactive == &buffer1) {
      active = &buffer1;
      inactive = &buffer2;
    }
    else {
      active = &buffer2;
      inactive = &buffer1;
    }
    /*get the next part, and handle EOF */
    if (fgets(tmp, 1024, file) == NULL) {
      free(*active);
      return *inactive;
    }

    free(*active);
    *active = (char *) malloc((++i) * 1024);
    sprintf(*active, "%s%s", *inactive, tmp);
  } while (1);
}

void strip_trailing_space(char **string)
{
  int i = strlen(*string) - 1;
  char *return_string;

  if (string == NULL || *string == NULL)
    return;
  while (isspace((*string)[i]))
    i--;
  i++;
  return_string = (char *) malloc(i + 1);
  strncpy(return_string, *string, i);
  return_string[i] = 0;
  free(*string);
  *string = return_string;
}

void strip_leading_space(char **string)
{
  char *tmp = *string, *return_string;

  if (string == NULL || *string == NULL)
    return;

  while (isspace(*tmp))
    tmp++;

  return_string = strdup(tmp);
  free(*string);
  *string = return_string;
}


char *string_append(char **dest, char *appendage)
{
  char *holder;

  if (dest == NULL || appendage == NULL)
    return NULL;

  if (*dest != NULL) {
    holder = *dest;
    *dest = (char *) malloc(strlen(holder) + strlen(appendage) + 1);
    sprintf(*dest, "%s%s", holder, appendage);
    free(holder);
  }
  else
    *dest = strdup(appendage);

  return *dest;
}

void charpp_to_charp(char **dest, char **src, int num, char *separator)
{
  int i, size = 0, sep_size = 0;

  if (src == NULL || num == 0)
    return;

  if (separator == NULL)
    separator = strdup("");

  sep_size = strlen(separator);

  for (i = 0; i < num; i++)
    size += strlen(src[i]) + sep_size;
  if (*dest != NULL)
    free(*dest);

  *dest = (char *) malloc(size + 1);
  strcpy(*dest, "");

  for (i = 0; i < num - 1; i++) {
    strcat(*dest, src[i]);
    strcat(*dest, separator);
  }				/* do it this way, so no separator will get in as the last part */
  strcat(*dest, src[num - 1]);

}

FILE *socket_init(const char *server, short int port)
{
  struct hostent *host;
  struct sockaddr_in socket_address;
  int hsocket;

  /* see if some default values have been set */
  if (server == NULL) {
    return NULL;
  }

  host = gethostbyname(server);
  if (host == NULL)
    return NULL;		/* we don't know the host */

  /* set socket address */
  memset(&socket_address, 0, sizeof(socket_address));
  memcpy((char *) &socket_address.sin_addr, host->h_addr, host->h_length);
  socket_address.sin_family = host->h_addrtype;
  socket_address.sin_port = htons(port);

  /* get the actual socket handle */
  hsocket = socket(host->h_addrtype, SOCK_STREAM, 0);
  if (hsocket < 0)		/* we couldn't grab the socket */
    return NULL;

  if (connect(hsocket, (struct sockaddr *) &socket_address,
	      sizeof(socket_address)) < 0)
    return NULL;

  return fdopen(hsocket, "r+");	/* we made it */
}


int get_subdirs(const char *path, char **buffer)
{
  int hits = 0, status;
  char *subdirname;
  DIR *dirp;
  struct dirent *dir_contents;
  struct stat file_stats;

  if (path == NULL || (dirp = opendir(path)) == NULL) {
    return hits;
  }

  while ((dir_contents = readdir(dirp)) != NULL) {
    if (strcmp(dir_contents->d_name, ".") != 0 &&
	strcmp(dir_contents->d_name, "..") != 0) {

      subdirname = (char *) malloc(strlen(path) + strlen(dir_contents->d_name) + 2);
      sprintf(subdirname, "%s/%s", path, dir_contents->d_name);
      status = stat(subdirname, &file_stats);

      if (status == 0 && hits < 1000) {
	if (S_ISDIR(file_stats.st_mode)) {	/* we are a subdir */
	  buffer[hits] = strdup(subdirname);
	  hits++;
	}
      }
      free(subdirname);
    }
  }

  return hits;
}
