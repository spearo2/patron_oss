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

   $Id: cddbp.h,v 0.3.3.1 1998/08/20 16:09:09 jochen Exp $
 */

#ifndef CCCD_CDDBP_H
#define CCCD_CDDBP_H

/* the following functions are active, meaning that they themselves will
   communicate directly to the server through the FILE* which is given */
#if 0
#define DEBUG
#endif

int cddbp_signon(FILE *);
int cddbp_handshake(FILE *, const char *clientname, const char *version);
int cddbp_query(FILE *, const char *disk_id, int tracknum,
		long int offsets[tracknum], int duration, int *matches,
		char ***category_buffer, char ***title_buffer,
		char ***id_buffer);
int cddbp_read(FILE *, const char *category, const char *disk_id,
	       char **result_buffer);
int cddbp_stat(FILE *, char **result);

int http_query(const char *server, int port, const char *URL,
	       const char *disk_cd, int tracknum, long int offsets[tracknum],
	       int duration, int *matches,
	       char ***category_buffer, char ***title_buffer,
	       char ***id_buffer, const char *client, const char *version);

int http_read(const char *server, int port, const char *URL,
	      const char *category, const char *disk_id,
	      char **result_buffer, const char *client, const char *version);
int http_stat(const char *server, int port, const char *URL,
	      char **result, const char *client, const char *version);

void cddbp_signoff(FILE *);

#endif /* CCCD_CDDBP_H */
