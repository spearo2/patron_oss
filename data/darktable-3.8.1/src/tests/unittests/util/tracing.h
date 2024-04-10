/*
    This file is part of darktable,
    Copyright (C) 2020 darktable developers.

    darktable is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    darktable is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with darktable.  If not, see <http://www.gnu.org/licenses/>.
*/
/*
 * Tracing macros to be used for unit testing with cmocka.
 *
 * Please see ../README.md for more detailed documentation.
 */

#include <stdio.h>


/*
 * Macro to print a test step taken. The msg should be short and informative.
 */
#define TR_STEP(msg, ...) printf("[  STEP    ] " msg "\n", ##__VA_ARGS__)

/*
 * Macro to mark a work-around for a bug in the code-under-test.
 */
#define TR_BUG(msg, ...) printf("[   BUG    ] " msg "\n", ##__VA_ARGS__)

/*
 * Macro to express an important information.
 */
#define TR_NOTE(msg, ...) printf("[   NOTE   ] " msg "\n", ##__VA_ARGS__)

/*
 * Macro to provide debug information.
 */
#define TR_DEBUG(msg, ...) printf("[   DEBUG  ] " msg "\n", ##__VA_ARGS__)
