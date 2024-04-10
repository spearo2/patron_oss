#ifndef RC_BUILD
  #ifdef HAVE_CONFIG_H
    #include "config.h"
  #endif
  const char darktable_package_version[] = "3.8.1";
  const char darktable_package_string[] = PACKAGE_NAME " 3.8.1";
  const char darktable_last_commit_year[] = "2022";
#else
  #define DT_MAJOR 3
  #define DT_MINOR 8
  #define DT_PATCH 1
  #define DT_N_COMMITS 0
  #define LAST_COMMIT_YEAR "2022"
#endif
