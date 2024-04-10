dnl aclocal.m4 generated automatically by aclocal 1.4-p4

dnl Copyright (C) 1994, 1995-8, 1999 Free Software Foundation, Inc.
dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.

dnl This program is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY, to the extent permitted by law; without
dnl even the implied warranty of MERCHANTABILITY or FITNESS FOR A
dnl PARTICULAR PURPOSE.

# acinclude.m4 for sane-frontends
# AM_PATH_GTK
# AM_PATH_GIMP
# AM_PATH_SANE

# Configure paths for GTK+
# Owen Taylor     97-11-3

dnl AM_PATH_GTK([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]]])
dnl Test for GTK, and define GTK_CFLAGS and GTK_LIBS
dnl
AC_DEFUN(AM_PATH_GTK,
[dnl 
dnl Get the cflags and libraries from the gtk-config script
dnl
AC_ARG_WITH(gtk-prefix,[  --with-gtk-prefix=PFX   Prefix where GTK is installed (optional)],
            gtk_config_prefix="$withval", gtk_config_prefix="")
AC_ARG_WITH(gtk-exec-prefix,[  --with-gtk-exec-prefix=PFX Exec prefix where GTK is installed (optional)],
            gtk_config_exec_prefix="$withval", gtk_config_exec_prefix="")
AC_ARG_ENABLE(gtktest, [  --disable-gtktest       Do not try to compile and run a test GTK program], , enable_gtktest=yes)

  if test x$gtk_config_exec_prefix != x ; then
     gtk_config_args="$gtk_config_args --exec-prefix=$gtk_config_exec_prefix"
     if test x${GTK_CONFIG+set} != xset ; then
        GTK_CONFIG=$gtk_config_exec_prefix/bin/gtk-config
     fi
  fi
  if test x$gtk_config_prefix != x ; then
     gtk_config_args="$gtk_config_args --prefix=$gtk_config_prefix"
     if test x${GTK_CONFIG+set} != xset ; then
        GTK_CONFIG=$gtk_config_prefix/bin/gtk-config
     fi
  fi

  AC_PATH_PROG(GTK_CONFIG, gtk-config, no)
  min_gtk_version=ifelse([$1], ,0.99.7,$1)
  AC_MSG_CHECKING(for GTK - version >= $min_gtk_version)
  no_gtk=""
  if test "$GTK_CONFIG" = "no" ; then
    no_gtk=yes
  else
    GTK_CFLAGS=`$GTK_CONFIG $gtk_config_args --cflags`
    GTK_LIBS=`$GTK_CONFIG $gtk_config_args --libs`
    gtk_config_major_version=`$GTK_CONFIG $gtk_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
    gtk_config_minor_version=`$GTK_CONFIG $gtk_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
    gtk_config_micro_version=`$GTK_CONFIG $gtk_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
    if test "x$enable_gtktest" = "xyes" ; then
      ac_save_CFLAGS="$CFLAGS"
      ac_save_LIBS="$LIBS"
      CFLAGS="$CFLAGS $GTK_CFLAGS"
      LIBS="$LIBS $GTK_LIBS"
dnl
dnl Now check if the installed GTK is sufficiently new. (Also sanity
dnl checks the results of gtk-config to some extent
dnl
      rm -f conf.gtktest
      AC_TRY_RUN([
#include <gtk/gtk.h>
#include <stdio.h>

int 
main ()
{
  int major, minor, micro;

  system ("touch conf.gtktest");

  if (sscanf("$min_gtk_version", "%d.%d.%d", &major, &minor, &micro) != 3) {
     printf("%s, bad version string\n", "$min_gtk_version");
     exit(1);
   }

  if ((gtk_major_version != $gtk_config_major_version) ||
      (gtk_minor_version != $gtk_config_minor_version) ||
      (gtk_micro_version != $gtk_config_micro_version))
    {
      printf("\n*** 'gtk-config --version' returned %d.%d.%d, but GTK+ (%d.%d.%d)\n", 
             $gtk_config_major_version, $gtk_config_minor_version, $gtk_config_micro_version,
             gtk_major_version, gtk_minor_version, gtk_micro_version);
      printf ("*** was found! If gtk-config was correct, then it is best\n");
      printf ("*** to remove the old version of GTK+. You may also be able to fix the error\n");
      printf("*** by modifying your LD_LIBRARY_PATH enviroment variable, or by editing\n");
      printf("*** /etc/ld.so.conf. Make sure you have run ldconfig if that is\n");
      printf("*** required on your system.\n");
      printf("*** If gtk-config was wrong, set the environment variable GTK_CONFIG\n");
      printf("*** to point to the correct copy of gtk-config, and remove the file config.cache\n");
      printf("*** before re-running configure\n");
    } 
  else
    {
      if ((gtk_major_version > major) ||
        ((gtk_major_version == major) && (gtk_minor_version > minor)) ||
        ((gtk_major_version == major) && (gtk_minor_version == minor) && (gtk_micro_version >= micro)))
      {
        return 0;
       }
     else
      {
        printf("\n*** An old version of GTK+ (%d.%d.%d) was found.\n",
               gtk_major_version, gtk_minor_version, gtk_micro_version);
        printf("*** You need a version of GTK+ newer than %d.%d.%d. The latest version of\n",
	       major, minor, micro);
        printf("*** GTK+ is always available from ftp://ftp.gtk.org.\n");
        printf("***\n");
        printf("*** If you have already installed a sufficiently new version, this error\n");
        printf("*** probably means that the wrong copy of the gtk-config shell script is\n");
        printf("*** being found. The easiest way to fix this is to remove the old version\n");
        printf("*** of GTK+, but you can also set the GTK_CONFIG environment to point to the\n");
        printf("*** correct copy of gtk-config. (In this case, you will have to\n");
        printf("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
        printf("*** so that the correct libraries are found at run-time))\n");
      }
    }
  return 1;
}
],, no_gtk=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
       CFLAGS="$ac_save_CFLAGS"
       LIBS="$ac_save_LIBS"
     fi
  fi
  if test "x$no_gtk" = x ; then
     AC_MSG_RESULT(yes)
     ifelse([$2], , :, [$2])     
  else
     AC_MSG_RESULT(no)
     if test "$GTK_CONFIG" = "no" ; then
       echo "*** The gtk-config script installed by GTK could not be found"
       echo "*** If GTK was installed in PREFIX, make sure PREFIX/bin is in"
       echo "*** your path, or set the GTK_CONFIG environment variable to the"
       echo "*** full path to gtk-config."
     else
       if test -f conf.gtktest ; then
        :
       else
          echo "*** Could not run GTK test program, checking why..."
          CFLAGS="$CFLAGS $GTK_CFLAGS"
          LIBS="$LIBS $GTK_LIBS"
          AC_TRY_LINK([
#include <gtk/gtk.h>
#include <stdio.h>
],      [ return ((gtk_major_version) || (gtk_minor_version) || (gtk_micro_version)); ],
        [ echo "*** The test program compiled, but did not run. This usually means"
          echo "*** that the run-time linker is not finding GTK or finding the wrong"
          echo "*** version of GTK. If it is not finding GTK, you'll need to set your"
          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
          echo "*** to the installed location  Also, make sure you have run ldconfig if that"
          echo "*** is required on your system"
	  echo "***"
          echo "*** If you have an old version installed, it is best to remove it, although"
          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH"
          echo "***"
          echo "*** If you have a RedHat 5.0 system, you should remove the GTK package that"
          echo "*** came with the system with the command"
          echo "***"
          echo "***    rpm --erase --nodeps gtk gtk-devel" ],
        [ echo "*** The test program failed to compile or link. See the file config.log for the"
          echo "*** exact error that occured. This usually means GTK was incorrectly installed"
          echo "*** or that you have moved GTK since it was installed. In the latter case, you"
          echo "*** may want to edit the gtk-config script: $GTK_CONFIG" ])
          CFLAGS="$ac_save_CFLAGS"
          LIBS="$ac_save_LIBS"
       fi
     fi
     GTK_CFLAGS=""
     GTK_LIBS=""
     ifelse([$3], , :, [$3])
  fi
  AC_SUBST(GTK_CFLAGS)
  AC_SUBST(GTK_LIBS)
  rm -f conf.gtktest
])


# Configure paths for The GIMP 
# Oliver Rauch 2000-12-28

dnl AM_PATH_GIMP([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]]])
dnl Test for GIMP, and define GIMP_CFLAGS and GIMP_LIBS
dnl
AC_DEFUN(AM_PATH_GIMP,
[dnl 
dnl Get the cflags and libraries from the gimp-config script
dnl
  AC_ARG_WITH(gimp-prefix,[  --with-gimp-prefix=PFX   Prefix where GIMP is installed (optional)],
              gimp_config_prefix="$withval", gimp_config_prefix="")
  AC_ARG_WITH(gimp-exec-prefix,[  --with-gimp-exec-prefix=PFX Exec prefix where GIMP is installed (optional)],
              gimp_config_exec_prefix="$withval", gimp_config_exec_prefix="")
  AC_ARG_ENABLE(gimptest, [  --disable-gimptest      Do not try to compile and run a test GIMP program], , enable_gimptest=yes)

  ac_save_CFLAGS="$CFLAGS"
  ac_save_LIBS="$LIBS"
  ac_save_GTK_CFLAGS="$GTK_CFLAGS"
  ac_save_GTK_LIBS="$GTK_LIBS"

  if test x$gimp_config_exec_prefix != x ; then
     gimp_config_args="$gimp_config_args --exec-prefix=$gimp_config_exec_prefix"
     if test x${GIMP_CONFIG+set} != xset ; then
        GIMP_CONFIG=$gimp_config_exec_prefix/bin/gimp-config
     fi
  fi

  if test x$gimp_config_prefix != x ; then
     gimp_config_args="$gimp_config_args --prefix=$gimp_config_prefix"
     if test x${GIMP_CONFIG+set} != xset ; then
        GIMP_CONFIG=$gimp_config_prefix/bin/gimp-config
     fi
  fi

  AC_PATH_PROG(GIMP_CONFIG, gimp-config, no)
  if test "$GIMP_CONFIG" = "no" ; then
    if test x$gimp_config_exec_prefix != x ; then
       gimp_config_args="$gimp_config_args --exec-prefix=$gimp_config_exec_prefix"
       if test x${GIMP_TOOL+set} != xset ; then
          GIMP_TOOL=$gimp_config_exec_prefix/bin/gimptool
       fi
    fi
    if test x$gimp_config_prefix != x ; then
       gimp_config_args="$gimp_config_args --prefix=$gimp_config_prefix"
       if test x${GIMP_TOOL+set} != xset ; then
          GIMP_TOOL=$gimp_config_prefix/bin/gimptool
       fi
    fi
    AC_PATH_PROG(GIMP_TOOL, gimptool, no)
    GIMP_CONFIG=$GIMP_TOOL
  fi

  min_gimp_version=ifelse([$1], ,1.0.0,$1)
  no_gimp=""

  if test "$GIMP_CONFIG" = "no" ; then
dnl we do not have gimp-config (gimp-1.0.x does not have gimp-config)
dnl so we have to use the GTK_* things for testing for gimp.h and gimpfeatures.h
    ac_save_CPPFLAGS="$CPPFLAGS"
    CPPFLAGS="${CPPFLAGS} ${GTK_CFLAGS}"
    AC_CHECK_HEADERS(libgimp/gimp.h, GIMP_LIBS="-lgimp", no_gimp=yes)
    AC_CHECK_HEADERS(libgimp/gimpfeatures.h)
    CPPFLAGS="$ac_save_CPPFLAGS"
    CFLAGS="${CFLAGS} ${GTK_CFLAGS}"
    LIBS="${LIBS} ${GTK_LIBS} ${GIMP_LIBS}"
    if test "x$no_gimp" = x ; then
      AC_MSG_CHECKING(GIMP compilation)
      gimp_config_major_version=-1
      gimp_config_minor_version=0
      gimp_config_micro_version=0
    fi
  else
dnl Ok, we have gimp-config and so we do not need the GTK_* things because they are
dnl included in the output of gimp-config
#    GTK_CFLAGS=""
#    GTK_LIBS=""
    GIMP_CFLAGS=`$GIMP_CONFIG $gimp_config_args --cflags`
    GIMP_LIBS=`$GIMP_CONFIG $gimp_config_args --libs`" -lgimp"
    gimp_config_major_version=`$GIMP_CONFIG $gimp_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
    gimp_config_minor_version=`$GIMP_CONFIG $gimp_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
    gimp_config_micro_version=`$GIMP_CONFIG $gimp_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
      CFLAGS="${CFLAGS} ${GIMP_CFLAGS}"
      LIBS="${LIBS} ${GIMP_LIBS}"
      AC_MSG_CHECKING(for GIMP - version >= $min_gimp_version)
  fi

dnl
dnl Now check if the installed GIMP is sufficiently new. (Also sanity
dnl checks the results of gimp-config to some extent
dnl
  if test "x$no_gimp" = x ; then
    if test "x$enable_gimptest" = "xyes" ; then
      rm -f conf.gimptest
      AC_TRY_RUN([
#include <libgimp/gimp.h>
#include <stdio.h>

#define GIMP_TEST_CHECK_VERSION(major, minor, micro) \
    ($gimp_config_major_version > (major) || \
     ($gimp_config_major_version == (major) && $gimp_config_minor_version > (minor)) || \
     ($gimp_config_major_version == (major) && $gimp_config_minor_version == (minor) && \
      $gimp_config_micro_version >= (micro)))                                

#if !GIMP_TEST_CHECK_VERSION(1,1,25)
#  define GimpPlugInInfo GPlugInInfo /* do test with gimp interface version 1.0 */
#endif

GimpPlugInInfo PLUG_IN_INFO =
{
  NULL, NULL, NULL, NULL
};


int 
main ()
{
  int major, minor, micro;

  system ("touch conf.gimptest");

  if (sscanf("$min_gimp_version", "%d.%d.%d", &major, &minor, &micro) != 3) {
     printf("%s, bad version string\n", "$min_gimp_version");
     exit(1);
   }

  if ( ($gimp_config_major_version != -1) &&
       ((gimp_major_version != $gimp_config_major_version) ||
       (gimp_minor_version != $gimp_config_minor_version) ||
       (gimp_micro_version != $gimp_config_micro_version)) )
  {
      printf("\n*** 'gimp-config --version' returned %d.%d.%d, but GIMP (%d.%d.%d)\n", 
             $gimp_config_major_version, $gimp_config_minor_version, $gimp_config_micro_version,
             gimp_major_version, gimp_minor_version, gimp_micro_version);
      printf ("*** was found! If gimp-config was correct, then it is best\n");
      printf ("*** to remove the old version of GIMP. You may also be able to fix the error\n");
      printf("*** by modifying your LD_LIBRARY_PATH enviroment variable, or by editing\n");
      printf("*** /etc/ld.so.conf. Make sure you have run ldconfig if that is\n");
      printf("*** required on your system.\n");
      printf("*** If gimp-config was wrong, set the environment variable GIMP_CONFIG\n");
      printf("*** to point to the correct copy of gimp-config, and remove the file config.cache\n");
      printf("*** before re-running configure\n");
  } 
  else
  {
      if ((gimp_major_version > major) ||
        ((gimp_major_version == major) && (gimp_minor_version > minor)) ||
        ((gimp_major_version == major) && (gimp_minor_version == minor) && (gimp_micro_version >= micro)))
      {
        return 0;
       }
     else
      {
        printf("\n*** An old version of GIMP (%d.%d.%d) was found.\n",
               gimp_major_version, gimp_minor_version, gimp_micro_version);
        printf("*** You need a version of GIMP newer than %d.%d.%d. The latest version of\n",
	       major, minor, micro);
        printf("*** GIMP is always available from ftp://ftp.gimp.org.\n");
        printf("***\n");
        printf("*** If you have already installed a sufficiently new version, this error\n");
        printf("*** probably means that the wrong copy of the gimp-config shell script is\n");
        printf("*** being found. The easiest way to fix this is to remove the old version\n");
        printf("*** of GIMP, but you can also set the GIMP_CONFIG environment to point to the\n");
        printf("*** correct copy of gimp-config. (In this case, you will have to\n");
        printf("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
        printf("*** so that the correct libraries are found at run-time))\n");
      }
  }
  return 1;
}
], , no_gimp=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
     fi
  fi

  if test "x$no_gimp" = x ; then
dnl gimp test succeeded or not tested
     if test "x$enable_gimptest" = "xyes" ; then
       AC_MSG_RESULT(yes)
     else
       AC_MSG_RESULT(not tested)
     fi
     if test "$GIMP_CONFIG" != "no" ; then
       ac_save_CPPFLAGS="$CPPFLAGS"
       CPPFLAGS="${CPPFLAGS} ${GIMP_CFLAGS}"
       AC_CHECK_HEADERS(libgimp/gimp.h)
       AC_CHECK_HEADERS(libgimp/gimpfeatures.h)
       CPPFLAGS="$ac_save_CPPFLAGS"
     fi
     CFLAGS="$ac_save_CFLAGS"
     LIBS="$ac_save_LIBS"
     ifelse([$2], , :, [$2])     
  else
     AC_MSG_RESULT(no)
       if test -f conf.gimptest ; then
        :
       else
        echo "*** Could not run GIMP test program, checking why..."
        CFLAGS="$CFLAGS $GIMP_CFLAGS"
        LIBS="$LIBS $GIMP_LIBS"
        AC_TRY_LINK([
#include <libgimp/gimp.h>
#include <stdio.h>
#define GIMP_TEST_CHECK_VERSION(major, minor, micro) \
    ($gimp_config_major_version > (major) || \
     ($gimp_config_major_version == (major) && $gimp_config_minor_version > (minor)) || \
     ($gimp_config_major_version == (major) && $gimp_config_minor_version == (minor) && \
      $gimp_config_micro_version >= (micro)))                                

#if !GIMP_TEST_CHECK_VERSION(1,1,25)
#  define GimpPlugInInfo GPlugInInfo /* do test with gimp interface version 1.0 */
#endif
GimpPlugInInfo PLUG_IN_INFO = { NULL, NULL, NULL, NULL };
],    [ return ((gimp_major_version) || (gimp_minor_version) || (gimp_micro_version)); ],
      [ echo "*** The test program compiled, but did not run. This usually means"
        echo "*** that the run-time linker is not finding GIMP or finding the wrong"
        echo "*** version of GIMP. If it is not finding GIMP, you'll need to set your"
        echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
        echo "*** to the installed location  Also, make sure you have run ldconfig if that"
        echo "*** is required on your system"
        echo "***"
        echo "*** If you have an old version installed, it is best to remove it, although"
        echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH"
        echo "***"
        echo "***" ])
        CFLAGS="$ac_save_CFLAGS"
        LIBS="$ac_save_LIBS"
     fi
dnl ok, gimp does not work, so we have to use the gtk_* things again
     GIMP_CFLAGS=""
     GIMP_LIBS=""
#     GTK_CFLAGS="$ac_save_GTK_CFLAGS"
#     GTK_LIBS="$ac_save_GTK_LIBS"
#     CFLAGS="${CFLAGS} ${GTK_CFLAGS}"
#     LIBS="${LIBS} ${GTK_LIBS} ${GIMP_LIBS}"
     ifelse([$3], , :, [$3])
  fi
  AC_SUBST(GIMP_CFLAGS)
  AC_SUBST(GIMP_LIBS)
  rm -f conf.gimptest
])


# ********************************************************************
# Configure paths for SANE 
# Oliver Rauch 2000-10-30

dnl AM_PATH_SANE([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]]])
dnl Test for SANE, and define SANE_CFLAGS and SANE_LIBS
dnl
AC_DEFUN(AM_PATH_SANE,
[dnl 
dnl Get the cflags and libraries from the sane-config script
dnl
AC_ARG_WITH(sane-prefix,[  --with-sane-prefix=PFX  Prefix where SANE is installed (optional)],
            sane_config_prefix="$withval", sane_config_prefix="")
AC_ARG_WITH(sane-exec-prefix,[  --with-sane-exec-prefix=PFX Exec prefix where SANE is installed (optional)],
            sane_config_exec_prefix="$withval", sane_config_exec_prefix="")
AC_ARG_ENABLE(sanetest, [  --disable-sanetest      Do not try to compile and run a test SANE program], , enable_sanetest=yes)

  if test x$sane_config_exec_prefix != x ; then
     sane_config_args="$sane_config_args --exec-prefix=$sane_config_exec_prefix"
     if test x${SANE_CONFIG+set} != xset ; then
        SANE_CONFIG=$sane_config_exec_prefix/bin/sane-config
     fi
  fi
  if test x$sane_config_prefix != x ; then
     sane_config_args="$sane_config_args --prefix=$sane_config_prefix"
     if test x${SANE_CONFIG+set} != xset ; then
        SANE_CONFIG=$sane_config_prefix/bin/sane-config
     fi
  fi

  AC_PATH_PROG(SANE_CONFIG, sane-config, no)
  min_sane_version=ifelse([$1], ,1.0.0,$1)
  AC_MSG_CHECKING(for SANE - version >= $min_sane_version)
  no_sane=""
  if test "$SANE_CONFIG" = "no" ; then
    no_sane=yes
  else
    SANE_CFLAGS=`$SANE_CONFIG $sane_config_args --cflags`
    SANE_LDFLAGS=`$SANE_CONFIG $sane_config_args --ldflags`
#    SANE_LIBS=`$SANE_CONFIG $sane_config_args --libs`
    SANE_LIBS=`$SANE_CONFIG $sane_config_args --libs | sed -e 's/-lintl//g'`
    SANE_PREFIX=`$SANE_CONFIG $sane_config_args --prefix`
    sane_config_major_version=`$SANE_CONFIG $sane_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
    sane_config_minor_version=`$SANE_CONFIG $sane_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
    sane_config_micro_version=`$SANE_CONFIG $sane_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
    if test "x$enable_sanetest" = "xyes" ; then
      ac_save_CFLAGS="$CFLAGS"
      ac_save_LDFLAGS="$LDFLAGS"
      ac_save_LIBS="$LIBS"
      CFLAGS="$CFLAGS $SANE_CFLAGS"
      LDFLAGS="$LDFLAGS $SANE_LDFLAGS"
      LIBS="$LIBS $SANE_LIBS"
dnl
dnl Now check if the installed SANE is sufficiently new. (Also sanity
dnl checks the results of sane-config to some extent
dnl
      rm -f conf.sanetest
      AC_TRY_RUN([
#include <sane/sane.h>
#include <stdio.h>

int 
main ()
{
  int major, minor, micro;

  system ("touch conf.sanetest");

  if (sscanf("$min_sane_version", "%d.%d.%d", &major, &minor, &micro) != 3) {
     printf("%s, bad version string\n", "$min_sane_version");
     exit(1);
   }

   if ( ($sane_config_major_version == major) &&
        ( ($sane_config_minor_version > minor) ||
          ( ($sane_config_minor_version == minor) && ($sane_config_micro_version >= micro))))
   {
     return 0;
   }
   else if ($sane_config_major_version > major)
   {
     printf("\n*** A too new version of SANE (%d.%d.%d) was found.\n",
            $sane_config_major_version, $sane_config_minor_version, $sane_config_micro_version);
     printf("*** You need a version of SANE with the major version number %d.\n", major);
   }
   else
   {
     printf("\n*** An old version of SANE (%d.%d.%d) was found.\n",
            $sane_config_major_version, $sane_config_minor_version, $sane_config_micro_version);
     printf("*** You need a version of SANE newer than %d.%d.%d. The latest version of\n",
            major, minor, micro);
   }

   printf("*** SANE is always available from http://www.sane-project.org\n");
   printf("***\n");
   printf("*** If you have already installed a sufficient version, this error\n");
   printf("*** probably means that the wrong copy of the sane-config shell script is\n");
   printf("*** being found. The easiest way to fix this is to remove the old version\n");
   printf("*** of SANE, but you can also set the SANE_CONFIG environment to point to the\n");
   printf("*** correct copy of sane-config. (In this case, you will have to\n");
   printf("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
   printf("*** so that the correct libraries are found at run-time))\n");

  return 1;
}
],, no_sane=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
       CFLAGS="$ac_save_CFLAGS"
       LDFLAGS="$ac_save_LDFLAGS"
       LIBS="$ac_save_LIBS"
     fi
  fi
  if test "x$no_sane" = x ; then
     AC_MSG_RESULT(yes)
     ifelse([$2], , :, [$2])     
  else
     AC_MSG_RESULT(no)
     if test "$SANE_CONFIG" = "no" ; then
       echo "*** The sane-config script installed by SANE could not be found"
       echo "*** If SANE was installed in PREFIX, make sure PREFIX/bin is in"
       echo "*** your path, or set the SANE_CONFIG environment variable to the"
       echo "*** full path to sane-config."
     else
       if test -f conf.sanetest ; then
        :
       else
          echo "*** Could not run SANE test program, checking why..."
          CFLAGS="$CFLAGS $SANE_CFLAGS"
          LIBS="$LIBS $SANE_LIBS"
          LDFLAGS="$LDFLAGS $SANE_LDFLAGS"
          AC_TRY_LINK([
#include <sane/sane.h>
#include <stdio.h>
],      [ return (SANE_CURRENT_MAJOR); ],
        [ echo "*** The test program compiled, but did not run. This usually means"
          echo "*** that the run-time linker is not finding SANE or finding the wrong"
          echo "*** version of SANE. If it is not finding SANE, you'll need to set your"
          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
          echo "*** to the installed location.  Also, make sure you have run ldconfig if that"
          echo "*** is required on your system."
	  echo "***"
          echo "*** If you have an old version installed, it is best to remove it, although"
          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH"
          echo "***" ],
        [ echo "*** The test program failed to compile or link. See the file config.log for the"
          echo "*** exact error that occured. This usually means SANE was incorrectly installed"
          echo "*** or that you have moved SANE since it was installed. In the latter case, you"
          echo "*** may want to edit the sane-config script: $SANE_CONFIG" ])
          CFLAGS="$ac_save_CFLAGS"
          LDFLAGS="$ac_save_LDFLAGS"
          LIBS="$ac_save_LIBS"
       fi
     fi
     SANE_CFLAGS=""
     SANE_LDFLAGS=""
     SANE_LIBS=""
     ifelse([$3], , :, [$3])
  fi
  AC_SUBST(SANE_LDFLAGS)
  AC_SUBST(SANE_CFLAGS)
  AC_SUBST(SANE_LIBS)
  AC_SUBST(SANE_PREFIX)
  rm -f conf.sanetest
])

# ********************************************************************



# serial 1

# @defmac AC_PROG_CC_STDC
# @maindex PROG_CC_STDC
# @ovindex CC
# If the C compiler in not in ANSI C mode by default, try to add an option
# to output variable @code{CC} to make it so.  This macro tries various
# options that select ANSI C on some system or another.  It considers the
# compiler to be in ANSI C mode if it handles function prototypes correctly.
#
# If you use this macro, you should check after calling it whether the C
# compiler has been set to accept ANSI C; if not, the shell variable
# @code{am_cv_prog_cc_stdc} is set to @samp{no}.  If you wrote your source
# code in ANSI C, you can make an un-ANSIfied copy of it by using the
# program @code{ansi2knr}, which comes with Ghostscript.
# @end defmac

AC_DEFUN(AM_PROG_CC_STDC,
[AC_REQUIRE([AC_PROG_CC])
AC_BEFORE([$0], [AC_C_INLINE])
AC_BEFORE([$0], [AC_C_CONST])
dnl Force this before AC_PROG_CPP.  Some cpp's, eg on HPUX, require
dnl a magic option to avoid problems with ANSI preprocessor commands
dnl like #elif.
dnl FIXME: can't do this because then AC_AIX won't work due to a
dnl circular dependency.
dnl AC_BEFORE([$0], [AC_PROG_CPP])
AC_MSG_CHECKING(for ${CC-cc} option to accept ANSI C)
AC_CACHE_VAL(am_cv_prog_cc_stdc,
[am_cv_prog_cc_stdc=no
ac_save_CC="$CC"
# Don't try gcc -ansi; that turns off useful extensions and
# breaks some systems' header files.
# AIX			-qlanglvl=ansi
# Ultrix and OSF/1	-std1
# HP-UX			-Aa -D_HPUX_SOURCE
# SVR4			-Xc -D__EXTENSIONS__
for ac_arg in "" -qlanglvl=ansi -std1 "-Aa -D_HPUX_SOURCE" "-Xc -D__EXTENSIONS__"
do
  CC="$ac_save_CC $ac_arg"
  AC_TRY_COMPILE(
[#include <stdarg.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
/* Most of the following tests are stolen from RCS 5.7's src/conf.sh.  */
struct buf { int x; };
FILE * (*rcsopen) (struct buf *, struct stat *, int);
static char *e (p, i)
     char **p;
     int i;
{
  return p[i];
}
static char *f (char * (*g) (char **, int), char **p, ...)
{
  char *s;
  va_list v;
  va_start (v,p);
  s = g (p, va_arg (v,int));
  va_end (v);
  return s;
}
int test (int i, double x);
struct s1 {int (*f) (int a);};
struct s2 {int (*f) (double a);};
int pairnames (int, char **, FILE *(*)(struct buf *, struct stat *, int), int, int);
int argc;
char **argv;
], [
return f (e, argv, 0) != argv[0]  ||  f (e, argv, 1) != argv[1];
],
[am_cv_prog_cc_stdc="$ac_arg"; break])
done
CC="$ac_save_CC"
])
if test -z "$am_cv_prog_cc_stdc"; then
  AC_MSG_RESULT([none needed])
else
  AC_MSG_RESULT($am_cv_prog_cc_stdc)
fi
case "x$am_cv_prog_cc_stdc" in
  x|xno) ;;
  *) CC="$CC $am_cv_prog_cc_stdc" ;;
esac
])

# Configure paths for GTK+
# Owen Taylor     1997-2001

dnl AM_PATH_GTK_2_0([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND [, MODULES]]]])
dnl Test for GTK+, and define GTK_CFLAGS and GTK_LIBS, if gthread is specified in MODULES, 
dnl pass to pkg-config
dnl
AC_DEFUN(AM_PATH_GTK_2_0,
[dnl 
dnl Get the cflags and libraries from pkg-config
dnl
AC_ARG_ENABLE(gtktest, [  --disable-gtktest       do not try to compile and run a test GTK+ program],
		    , enable_gtktest=yes)

  pkg_config_args=gtk+-2.0
  for module in . $4
  do
      case "$module" in
         gthread) 
             pkg_config_args="$pkg_config_args gthread-2.0"
         ;;
      esac
  done

  no_gtk=""

  AC_PATH_PROG(PKG_CONFIG, pkg-config, no)

  if test x$PKG_CONFIG != xno ; then
    if pkg-config --atleast-pkgconfig-version 0.7 ; then
      :
    else
      echo *** pkg-config too old; version 0.7 or better required.
      no_gtk=yes
      PKG_CONFIG=no
    fi
  else
    no_gtk=yes
  fi

  min_gtk_version=ifelse([$1], ,2.0.0,$1)
  AC_MSG_CHECKING(for GTK+ - version >= $min_gtk_version)

  if test x$PKG_CONFIG != xno ; then
    ## don't try to run the test against uninstalled libtool libs
    if $PKG_CONFIG --uninstalled $pkg_config_args; then
	  echo "Will use uninstalled version of GTK+ found in PKG_CONFIG_PATH"
	  enable_gtktest=no
    fi

    if $PKG_CONFIG --atleast-version $min_gtk_version $pkg_config_args; then
	  :
    else
	  no_gtk=yes
    fi
  fi

  if test x"$no_gtk" = x ; then
    GTK_CFLAGS=`$PKG_CONFIG $pkg_config_args --cflags`
    GTK_LIBS=`$PKG_CONFIG $pkg_config_args --libs`
    gtk_config_major_version=`$PKG_CONFIG --modversion gtk+-2.0 | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
    gtk_config_minor_version=`$PKG_CONFIG --modversion gtk+-2.0 | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
    gtk_config_micro_version=`$PKG_CONFIG --modversion gtk+-2.0 | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
    if test "x$enable_gtktest" = "xyes" ; then
      ac_save_CFLAGS="$CFLAGS"
      ac_save_LIBS="$LIBS"
      CFLAGS="$CFLAGS $GTK_CFLAGS"
      LIBS="$GTK_LIBS $LIBS"
dnl
dnl Now check if the installed GTK+ is sufficiently new. (Also sanity
dnl checks the results of pkg-config to some extent)
dnl
      rm -f conf.gtktest
      AC_TRY_RUN([
#include <gtk/gtk.h>
#include <stdio.h>
#include <stdlib.h>

int 
main ()
{
  int major, minor, micro;
  char *tmp_version;

  system ("touch conf.gtktest");

  /* HP/UX 9 (%@#!) writes to sscanf strings */
  tmp_version = g_strdup("$min_gtk_version");
  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) != 3) {
     printf("%s, bad version string\n", "$min_gtk_version");
     exit(1);
   }

  if ((gtk_major_version != $gtk_config_major_version) ||
      (gtk_minor_version != $gtk_config_minor_version) ||
      (gtk_micro_version != $gtk_config_micro_version))
    {
      printf("\n*** 'pkg-config --modversion gtk+-2.0' returned %d.%d.%d, but GTK+ (%d.%d.%d)\n", 
             $gtk_config_major_version, $gtk_config_minor_version, $gtk_config_micro_version,
             gtk_major_version, gtk_minor_version, gtk_micro_version);
      printf ("*** was found! If pkg-config was correct, then it is best\n");
      printf ("*** to remove the old version of GTK+. You may also be able to fix the error\n");
      printf("*** by modifying your LD_LIBRARY_PATH enviroment variable, or by editing\n");
      printf("*** /etc/ld.so.conf. Make sure you have run ldconfig if that is\n");
      printf("*** required on your system.\n");
      printf("*** If pkg-config was wrong, set the environment variable PKG_CONFIG_PATH\n");
      printf("*** to point to the correct configuration files\n");
    } 
  else if ((gtk_major_version != GTK_MAJOR_VERSION) ||
	   (gtk_minor_version != GTK_MINOR_VERSION) ||
           (gtk_micro_version != GTK_MICRO_VERSION))
    {
      printf("*** GTK+ header files (version %d.%d.%d) do not match\n",
	     GTK_MAJOR_VERSION, GTK_MINOR_VERSION, GTK_MICRO_VERSION);
      printf("*** library (version %d.%d.%d)\n",
	     gtk_major_version, gtk_minor_version, gtk_micro_version);
    }
  else
    {
      if ((gtk_major_version > major) ||
        ((gtk_major_version == major) && (gtk_minor_version > minor)) ||
        ((gtk_major_version == major) && (gtk_minor_version == minor) && (gtk_micro_version >= micro)))
      {
        return 0;
       }
     else
      {
        printf("\n*** An old version of GTK+ (%d.%d.%d) was found.\n",
               gtk_major_version, gtk_minor_version, gtk_micro_version);
        printf("*** You need a version of GTK+ newer than %d.%d.%d. The latest version of\n",
	       major, minor, micro);
        printf("*** GTK+ is always available from ftp://ftp.gtk.org.\n");
        printf("***\n");
        printf("*** If you have already installed a sufficiently new version, this error\n");
        printf("*** probably means that the wrong copy of the pkg-config shell script is\n");
        printf("*** being found. The easiest way to fix this is to remove the old version\n");
        printf("*** of GTK+, but you can also set the PKG_CONFIG environment to point to the\n");
        printf("*** correct copy of pkg-config. (In this case, you will have to\n");
        printf("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
        printf("*** so that the correct libraries are found at run-time))\n");
      }
    }
  return 1;
}
],, no_gtk=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
       CFLAGS="$ac_save_CFLAGS"
       LIBS="$ac_save_LIBS"
     fi
  fi
  if test "x$no_gtk" = x ; then
     AC_MSG_RESULT(yes (version $gtk_config_major_version.$gtk_config_minor_version.$gtk_config_micro_version))
     ifelse([$2], , :, [$2])     
  else
     AC_MSG_RESULT(no)
     if test "$PKG_CONFIG" = "no" ; then
       echo "*** A new enough version of pkg-config was not found."
       echo "*** See http://pkgconfig.sourceforge.net"
     else
       if test -f conf.gtktest ; then
        :
       else
          echo "*** Could not run GTK+ test program, checking why..."
	  ac_save_CFLAGS="$CFLAGS"
	  ac_save_LIBS="$LIBS"
          CFLAGS="$CFLAGS $GTK_CFLAGS"
          LIBS="$LIBS $GTK_LIBS"
          AC_TRY_LINK([
#include <gtk/gtk.h>
#include <stdio.h>
],      [ return ((gtk_major_version) || (gtk_minor_version) || (gtk_micro_version)); ],
        [ echo "*** The test program compiled, but did not run. This usually means"
          echo "*** that the run-time linker is not finding GTK+ or finding the wrong"
          echo "*** version of GTK+. If it is not finding GTK+, you'll need to set your"
          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
          echo "*** to the installed location  Also, make sure you have run ldconfig if that"
          echo "*** is required on your system"
	  echo "***"
          echo "*** If you have an old version installed, it is best to remove it, although"
          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH" ],
        [ echo "*** The test program failed to compile or link. See the file config.log for the"
          echo "*** exact error that occured. This usually means GTK+ is incorrectly installed."])
          CFLAGS="$ac_save_CFLAGS"
          LIBS="$ac_save_LIBS"
       fi
     fi
     GTK_CFLAGS=""
     GTK_LIBS=""
     ifelse([$3], , :, [$3])
  fi
  AC_SUBST(GTK_CFLAGS)
  AC_SUBST(GTK_LIBS)
  rm -f conf.gtktest
])

# Configure paths for GIMP-2.0
# Manish Singh, Sven Neumann
# Large parts shamelessly stolen from Owen Taylor

dnl AM_PATH_GIMP_2_0([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]]])
dnl Test for GIMP, and define GIMP_CFLAGS and GIMP_LIBS
dnl
AC_DEFUN([AM_PATH_GIMP_2_0],
[dnl 
dnl Get the cflags and libraries from pkg-config
dnl

AC_ARG_ENABLE(gimptest, [  --disable-gimptest      do not try to compile and run a test GIMP program],, enable_gimptest=yes)

  pkg_name=gimp-2.0
  pkg_config_args="$pkg_name gimpui-2.0"

  no_gimp=""

  AC_PATH_PROG(PKG_CONFIG, pkg-config, no)

  if test x$PKG_CONFIG != xno ; then
    if pkg-config --atleast-pkgconfig-version 0.7 ; then
      :
    else
      echo *** pkg-config too old; version 0.7 or better required.
      no_gimp=yes
      PKG_CONFIG=no
    fi
  else
    no_gimp=yes
  fi

  min_gimp_version=ifelse([$1], ,2.0.0,$1)
  AC_MSG_CHECKING(for GIMP - version >= $min_gimp_version)

  if test x$PKG_CONFIG != xno ; then
    ## don't try to run the test against uninstalled libtool libs
    if $PKG_CONFIG --uninstalled $pkg_config_args; then
	  echo "Will use uninstalled version of GIMP found in PKG_CONFIG_PATH"
	  enable_gimptest=no
    fi

    if $PKG_CONFIG --atleast-version $min_gimp_version $pkg_config_args; then
	  :
    else
	  no_gimp=yes
    fi
  fi

  if test x"$no_gimp" = x ; then
    GIMP_CFLAGS=`$PKG_CONFIG $pkg_config_args --cflags`
    GIMP_LIBS=`$PKG_CONFIG $pkg_config_args --libs`
    GIMP_CFLAGS_NOUI=`$PKG_CONFIG $pkg_name --cflags`
    GIMP_LIBS_NOUI=`$PKG_CONFIG $pkg_name --libs`
    GIMP_DATA_DIR=`$PKG_CONFIG $pkg_name --variable=gimpdatadir`
    GIMP_PLUGIN_DIR=`$PKG_CONFIG $pkg_name --variable=gimplibdir`

    gimp_pkg_major_version=`$PKG_CONFIG --modversion $pkg_name | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
    gimp_pkg_minor_version=`$PKG_CONFIG --modversion $pkg_name | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
    gimp_pkg_micro_version=`$PKG_CONFIG --modversion $pkg_name | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
    if test "x$enable_gimptest" = "xyes" ; then
      ac_save_CFLAGS="$CFLAGS"
      ac_save_LIBS="$LIBS"
      CFLAGS="$CFLAGS $GIMP_CFLAGS"
      LIBS="$GIMP_LIBS $LIBS"

dnl
dnl Now check if the installed GIMP is sufficiently new. (Also sanity
dnl checks the results of pkg-config to some extent
dnl
      rm -f conf.gimptest
      AC_TRY_RUN([
#include <stdio.h>
#include <stdlib.h>

#include <libgimp/gimp.h>

GimpPlugInInfo PLUG_IN_INFO =
{
  NULL,  /* init_proc */
  NULL,  /* quit_proc */
  NULL,  /* query_proc */
  NULL   /* run_proc */
};

int main ()
{
  int major, minor, micro;
  char *tmp_version;

  system ("touch conf.gimptest");

  /* HP/UX 9 (%@#!) writes to sscanf strings */
  tmp_version = g_strdup("$min_gimp_version");
  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) != 3) {
     printf("%s, bad version string\n", "$min_gimp_version");
     exit(1);
   }

    if (($gimp_pkg_major_version > major) ||
        (($gimp_pkg_major_version == major) && ($gimp_pkg_minor_version > minor)) ||
        (($gimp_pkg_major_version == major) && ($gimp_pkg_minor_version == minor) && ($gimp_pkg_micro_version >= micro)))
    {
      return 0;
    }
  else
    {
      printf("\n*** 'pkg-config --modversion %s' returned %d.%d.%d, but the minimum version\n", "$pkg_name", $gimp_pkg_major_version, $gimp_pkg_minor_version, $gimp_pkg_micro_version);
      printf("*** of GIMP required is %d.%d.%d. If pkg-config is correct, then it is\n", major, minor, micro);
      printf("*** best to upgrade to the required version.\n");
      printf("*** If pkg-config was wrong, set the environment variable PKG_CONFIG_PATH\n");
      printf("*** to point to the correct the correct configuration files\n");
      return 1;
    }
}

],, no_gimp=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
       CFLAGS="$ac_save_CFLAGS"
       LIBS="$ac_save_LIBS"
     fi
  fi
  if test "x$no_gimp" = x ; then
     AC_MSG_RESULT(yes (version $gimp_pkg_major_version.$gimp_pkg_minor_version.$gimp_pkg_micro_version))
     ifelse([$2], , :, [$2])     
  else
     if test "$PKG_CONFIG" = "no" ; then
       echo "*** A new enough version of pkg-config was not found."
       echo "*** See http://www.freedesktop.org/software/pkgconfig/"
     else
       if test -f conf.gimptest ; then
        :
       else
          echo "*** Could not run GIMP test program, checking why..."
          CFLAGS="$CFLAGS $GIMP_CFLAGS"
          LIBS="$LIBS $GIMP_LIBS"
          AC_TRY_LINK([
#include <stdio.h>
#include <libgimp/gimp.h>

GimpPlugInInfo PLUG_IN_INFO =
{
  NULL,  /* init_proc */
  NULL,  /* quit_proc */
  NULL,  /* query_proc */
  NULL   /* run_proc */
};
],      [ return 0; ],
        [ echo "*** The test program compiled, but did not run. This usually means"
          echo "*** that the run-time linker is not finding GIMP or finding the wrong"
          echo "*** version of GIMP. If it is not finding GIMP, you'll need to set your"
          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
          echo "*** to the installed location  Also, make sure you have run ldconfig if that"
          echo "*** is required on your system"
	  echo "***"
          echo "*** If you have an old version installed, it is best to remove it, although"
          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH"],
        [ echo "*** The test program failed to compile or link. See the file config.log for the"
          echo "*** exact error that occured. This usually means GIMP is incorrectly installed."])
          CFLAGS="$ac_save_CFLAGS"
          LIBS="$ac_save_LIBS"
       fi
     fi
     GIMP_CFLAGS=""
     GIMP_LIBS=""
     GIMP_CFLAGS_NOUI=""
     GIMP_LIBS_NOUI=""
     ifelse([$3], , :, [$3])
  fi
  AC_SUBST(GIMP_CFLAGS)
  AC_SUBST(GIMP_LIBS)
  AC_SUBST(GIMP_CFLAGS_NOUI)
  AC_SUBST(GIMP_LIBS_NOUI)
  AC_SUBST(GIMP_DATA_DIR)
  AC_SUBST(GIMP_PLUGIN_DIR)
  rm -f conf.gimptest
])

