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

   $Id: general.h,v 0.3.3.3 2002/01/06 22:44:52 jst Exp $
 */

#ifndef CCCD_GENERAL_H
#define CCCD_GENERAL_H

#define NAME "cccd"
#define VERSION "0.3beta4"
#define RCFILE ".cccdrc"
#define AUTHOR "Jochen Stein"
#define EMAIL "jst@writeme.com"
/* #define HOMEPAGE "http://home.pages.de/~jst/cccd/" */
#define HOMEPAGE "currently none"

enum errors {
  OK, REMOTE_OK, LOCAL_OK, NOT_FOUND, NO_CONNECT, CONNECT_REFUSED,
  SERVER_ERROR, PARAM_ERROR
};
enum lookup_protocol {
  CDDBP, HTTP
};
enum lookup_order {
  NONE, LOCAL, REMOTE, LOCAL_REMOTE, REMOTE_LOCAL
};

#endif /* CCCD_GENERAL_H */
