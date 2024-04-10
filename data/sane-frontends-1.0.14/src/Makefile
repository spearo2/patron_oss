SHELL = /bin/sh


srcdir = .
top_srcdir = ..
top_builddir = ..

PACKAGE = sane-frontends
VERSION = 1.0.14
distdir = $(top_srcdir)/$(PACKAGE)-$(VERSION)

sane_prefix = /usr
prefix = /usr/local
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin
libexecdir = ${exec_prefix}/libexec
datadir = ${prefix}/share
sysconfdir = ${prefix}/etc
sharedstatedir = ${prefix}/com
localstatedir = ${prefix}/var
libdir = ${exec_prefix}/lib
infodir = ${prefix}/info
mandir = ${prefix}/man
includedir = ${prefix}/include
oldincludedir = /usr/include
configdir = ${sysconfdir}/sane.d
sanedatadir = ${datadir}/sane

MKDIR = $(top_srcdir)/mkinstalldirs
INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644

CC = gcc
INCLUDES = -I. -I$(srcdir) -I$(top_builddir)/include -I$(top_srcdir)/include \
	 -I/usr/local/include -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/x86_64-linux-gnu -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/fribidi -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/harfbuzz -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -pthread -I/usr/include/gimp-2.0 -I/usr/include/gegl-0.4 -I/usr/include/gio-unix-2.0 -I/usr/include/json-glib-1.0 -I/usr/include/babl-0.1 -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/x86_64-linux-gnu -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/fribidi -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/harfbuzz -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16
DEFS        = -DHAVE_CONFIG_H
CPPFLAGS    =  -D_GNU_SOURCE 	  -DPATH_SANE_DATA_DIR=$(sanedatadir) 	  -DV_MAJOR=1 -DV_MINOR=0 -DV_BUILD=14 -DSANE_V_MAJOR=1
CFLAGS      = -g -O2 -Wall 
LDFLAGS     =  
LIBS        = -lm  -lsane
GTK_LIBS    = -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.0 -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lpango-1.0 -lgobject-2.0 -lglib-2.0 -lharfbuzz -lfontconfig -lfreetype
GTK_CFLAGS  = -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/x86_64-linux-gnu -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/fribidi -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/harfbuzz -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16
GIMP_LIBS   = -lgimpui-2.0 -lgimpwidgets-2.0 -lgimpmodule-2.0 -lgimp-2.0 -lgimpmath-2.0 -lgimpconfig-2.0 -lgimpcolor-2.0 -lgimpbase-2.0 -lgegl-0.4 -lgegl-npd-0.4 -lm -Wl,--export-dynamic -lgmodule-2.0 -pthread -ljson-glib-1.0 -lbabl-0.1 -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.0 -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lpango-1.0 -lgobject-2.0 -lglib-2.0 -lharfbuzz -lfontconfig -lfreetype

BINPROGS = scanadf xscanimage xcam

COMPILE = $(CC) -c $(DEFS) $(INCLUDES) $(CPPFLAGS) $(CFLAGS) $(GTK_CFLAGS)
LINK = $(CC) $(LDFLAGS) -o $@



PROGRAMS = $(BINPROGS)
LIBLIB = ../lib/liblib.a
LIBSANEI = ../sanei/libsanei.a

XSCANIMAGE_OBJS = xscanimage.o progress.o preview.o preferences.o gtkglue.o
XCAM_OBJS = xcam.o preferences.o gtkglue.o
SCANADF_OBJS = scanadf.o

DISTFILES = Makefile.in gtkglue.c gtkglue.h preferences.c preferences.h \
  preview.c preview.h progress.c progress.h sane-style.rc xcam.c \
  xscanimage-gimp-1_0-compat.h xscanimage.c scanadf.c font_6x11.h

.PHONY: all clean depend dist distclean install uninstall

.c.o:
	$(COMPILE) $<

all: $(PROGRAMS)

install: $(PROGRAMS)
	@if test -z "$(BINPROGS)" ; then \
	  echo "*** The list of frontends to install is empty." ; \
	  echo "*** Check the output of configure and the file config.log," ; \
	  echo "*** maybe the GTK libraries weren't found?" ; \
	  exit 1 ; \
	fi
	$(MKDIR) $(DESTDIR)$(bindir) $(DESTDIR)$(datadir) $(DESTDIR)$(sanedatadir)
	@for program in $(BINPROGS); do \
	  echo installing $${program} in $(bindir)/$${program}... ; \
	  $(INSTALL_PROGRAM) $${program} \
	    $(DESTDIR)$(bindir)/$${program}; \
	done
	$(INSTALL_DATA) $(srcdir)/sane-style.rc \
          $(DESTDIR)$(sanedatadir)/sane-style.rc

uninstall:
	@for program in $(BINPROGS); do \
	  echo removing $(bindir)/$${program}...; \
	  rm -f $(bindir)/$${program}; \
	done
	rm -f $(sanedatadir)/sane-style.rc

xscanimage: $(XSCANIMAGE_OBJS) $(LIBSANEI) $(LIBLIB)
	$(LINK) $(XSCANIMAGE_OBJS) $(LIBSANEI) \
		$(LIBLIB) $(GIMP_LIBS) $(GTK_LIBS) $(LIBS)

xcam: $(XCAM_OBJS) $(LIBSANEI) $(LIBLIB)
	$(LINK) $(XCAM_OBJS) $(LIBSANEI) \
		$(LIBLIB) $(GTK_LIBS) $(LIBS)

scanadf: $(SCANADF_OBJS) $(LIBLIB)
	$(LINK) $(SCANADF_OBJS) $(LIBLIB) $(LIBS)

clean:
	rm -f *.o *~ .*~ *.bak
	rm -rf .libs

distclean: clean
	rm -f Makefile $(PROGRAMS)

depend:
	makedepend $(INCLUDES) *.c

dist: $(DISTFILES)
	for file in $(DISTFILES); do \
	  ln $$file $(distdir)/src 2> /dev/null \
	    || cp -p $$file $(distdir)/src ; \
	done
