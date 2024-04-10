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

   $Id: misc.h,v 0.3.3.1 1998/08/20 16:09:09 jochen Exp $
 */

#ifndef CCCD_MISC_H
#define CCCD_MISC_H

char *get_string_piece(FILE * file, int delim);
char *get_ascii_file(FILE * file);
void strip_trailing_space(char **string);
void strip_leading_space(char **string);
char *string_append(char **dest, char *appendage);
void charpp_to_charp(char **dest, char **src, int num, char *separator);
FILE *socket_init(const char *server, short int port);

int get_subdirs(const char *path, char **buffer);

#endif /* CCCD_MISC_H */
