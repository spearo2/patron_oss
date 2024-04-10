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

   $Id: options.h,v 0.3.3.1 1998/08/20 16:09:09 jochen Exp $
 */

#ifndef CCCD_OPTIONS_H
#define CCCD_OPTIONS_H

struct options {
  char *server, *remote_submit, *path;
  int port, save;
  enum lookup_protocol protocol;
  enum lookup_order lookup;
};


int options_copy(struct options *dest, struct options *src);
int options_clear(struct options *o);
int options_load(struct options *o);
int options_save(struct options *o);
int options_check(struct options *o);
void parse_categories(char *string, char ***cat, int *num);

#endif /* CCCD_OPTIONS_H */
