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
#include <limits.h>
#include <setjmp.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdint.h>

#include <cmocka.h>

#ifdef _WIN32
#include "win/main_wrapper.h"
#endif

static void test_sample(void **state)
{
  // most efficient test: does just nothing :-)
}

int main(int argc, char* argv[])
{
  const struct CMUnitTest tests[] = {
    cmocka_unit_test(test_sample)
  };

  return cmocka_run_group_tests(tests, NULL, NULL);
}
