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

   $Id: cddb.h,v 0.3.3.1 1998/08/20 16:09:09 jochen Exp $
 */

#ifndef CCCD_CDDB_H
#define CCCD_CDDB_H

/* cddb functions */
unsigned long int cddb_disk_id(int length, int tracknum,
			       long int offset[]);
int cddb_lookup(struct audio_cd *cd, char **data, int mode,
		const char *server, short int port, int protocol,
		const char *path);

enum errors cddb_remote_categories(const char *server, short int port,
				   enum lookup_protocol proto,
				   char **category, int *cat_num);

int cddb_handle_data(struct audio_cd *cd, const char *data);
char *cddb_collate_data(struct audio_cd *cd, char **result);
enum errors local_lookup(const char *cd_id, const char *path, char **result);
enum errors remote_lookup(const char *cd_id, int tracknum,
			  long int offset[tracknum], int duration,
			  const char *server, short int port,
			  enum lookup_protocol, char **result);

#endif /* CCCD_CDDB_H */
