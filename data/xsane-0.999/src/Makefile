SHELL = /bin/sh


srcdir = .
top_srcdir = ..
top_builddir = ..

sane_prefix = /usr
prefix = /usr/local
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin
sbindir = ${exec_prefix}/sbin
libexecdir = ${exec_prefix}/libexec
datadir = ${prefix}/share
sysconfdir = ${prefix}/etc
sharedstatedir = ${prefix}/com
localstatedir = ${prefix}/var
libdir = ${exec_prefix}/lib
infodir = ${prefix}/share/info
mandir = ${prefix}/share/man
includedir = ${prefix}/include
oldincludedir = /usr/include
configdir = ${sysconfdir}/sane.d
sanedatadir = ${datadir}/sane
xsanedocdir = ${datadir}/sane/xsane/doc
desktopappdir = ${prefix}/share/applications
pixmapdir = ${prefix}/share/pixmaps

MKINSTALLDIRS = $(top_srcdir)/mkinstalldirs
INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644

CC = gcc
INCLUDES = -I. -I$(srcdir) -I$(top_builddir)/include -I$(top_srcdir)/include  -I/usr/local/include
DEFS = -DHAVE_CONFIG_H -DLOCALEDIR=$(datadir)/locale -DSANELOCALEDIR=$(sane_prefix)/share/locale
CPPFLAGS =  -D_GNU_SOURCE 	  -DV_MAJOR=0 -DV_MINOR=999 -DSANE_V_MAJOR=1 -DPATH_XSANE_DOC_DIR=$(xsanedocdir) -DPATH_SANE_DATA_DIR=$(sanedatadir)
CFLAGS   = -g -O2 -Wall  -pthread -I/usr/include/gimp-2.0 -I/usr/include/gegl-0.4 -I/usr/include/gio-unix-2.0 -I/usr/include/json-glib-1.0 -I/usr/include/babl-0.1 -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/atk-1.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/x86_64-linux-gnu -I/usr/include/pango-1.0 -I/usr/include/harfbuzz -I/usr/include/pango-1.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/fribidi -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/harfbuzz -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 
LDFLAGS  =  
LIBS     = -lsane -lgimpui-2.0 -lgimpwidgets-2.0 -lgimpmodule-2.0 -lgimp-2.0 -lgimpmath-2.0 -lgimpconfig-2.0 -lgimpcolor-2.0 -lgimpbase-2.0 -lgegl-0.4 -lgegl-npd-0.4 -lm -Wl,--export-dynamic -lgmodule-2.0 -pthread -ljson-glib-1.0 -lbabl-0.1 -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -latk-1.0 -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lpango-1.0 -lgobject-2.0 -lglib-2.0 -lharfbuzz -lfontconfig -lfreetype   -lpng -llcms2 -ltiff -ljpeg -lz -lm 

COMPILE = $(CC) -c $(DEFS) $(INCLUDES) $(CPPFLAGS) $(CFLAGS)
LINK = $(CC) $(LDFLAGS) -o $@

BINPROGS = xsane



PROGRAMS = $(BINPROGS)
LIBLIB = ../lib/liblib.a

XSANE_OBJS = xsane-back-gtk.o xsane-front-gtk.o xsane-gamma.o \
             xsane-preview.o xsane-viewer.o \
             xsane-fax-project.o \
             xsane-email-project.o \
             xsane-multipage-project.o \
             xsane-rc-io.o xsane-device-preferences.o xsane-batch-scan.o \
             xsane-preferences.o xsane-setup.o xsane-save.o xsane-scan.o \
             xsane-icons.o xsane.o 


.c.o:
	$(COMPILE) $<

all: $(PROGRAMS)

install: $(PROGRAMS)
	$(MKINSTALLDIRS) $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir) $(DESTDIR)$(datadir) $(DESTDIR)$(sanedatadir) $(DESTDIR)$(xsanedocdir) $(DESTDIR)$(sanedatadir)/xsane $(DESTDIR)$(desktopappdir) $(DESTDIR)$(pixmapdir)
	@for program in $(BINPROGS); do \
	  $(INSTALL_PROGRAM) $${program} $(DESTDIR)$(bindir)/$${program}; \
	done
	$(INSTALL_DATA) $(srcdir)/xsane-style.rc $(DESTDIR)$(sanedatadir)/xsane/xsane-style.rc
	$(INSTALL_DATA) $(srcdir)/xsane-startimage.pnm $(DESTDIR)$(sanedatadir)/xsane/xsane-startimage.pnm
	$(INSTALL_DATA) $(srcdir)/xsane-calibration.pnm $(DESTDIR)$(sanedatadir)/xsane/xsane-calibration.pnm
	$(INSTALL_DATA) $(srcdir)/xsane-logo.xpm $(DESTDIR)$(sanedatadir)/xsane/xsane-logo.xpm
	$(INSTALL_DATA) $(srcdir)/xsane-gpl.txt $(DESTDIR)$(sanedatadir)/xsane/xsane-gpl.txt
	$(INSTALL_DATA) $(srcdir)/xsane-eula.txt $(DESTDIR)$(sanedatadir)/xsane/xsane-eula.txt
	$(INSTALL_DATA) $(srcdir)/xsane.desktop $(DESTDIR)$(desktopappdir)/xsane.desktop
	$(INSTALL_DATA) $(srcdir)/xsane.xpm $(DESTDIR)$(pixmapdir)/xsane.xpm
	@for logo in *-logo.xpm; do \
	  echo installing $(DESTDIR)$(sanedatadir)/xsane/$${logo}; \
	  $(INSTALL_DATA) $(srcdir)/$${logo} $(DESTDIR)$(sanedatadir)/xsane/$${logo}; \
	done 

uninstall:
	@for program in $(BINPROGS); do \
	  echo uninstalling $(DESTDIR)$(bindir)/$${program}...; \
	  rm -f $(DESTDIR)$(bindir)/$${program}; \
	done
	echo uninstalling $(DESTDIR)$(sanedatadir)/xsane/xsane-style.rc...
	rm -f $(DESTDIR)$(sanedatadir)/xsane/xsane-style.rc
	echo uninstalling $(DESTDIR)$(sanedatadir)/xsane/xsane-startimage.pnm...
	rm -f $(DESTDIR)$(sanedatadir)/xsane/xsane-startimage.pnm
	echo uninstalling $(DESTDIR)$(sanedatadir)/xsane/xsane-calibration.pnm...
	rm -f $(DESTDIR)$(sanedatadir)/xsane/xsane-calibration.pnm
	echo uninstalling $(DESTDIR)$(sanedatadir)/xsane/xsane-logo.xpm...
	rm -f $(DESTDIR)$(sanedatadir)/xsane/xsane-logo.xpm
	echo uninstalling $(DESTDIR)$(desktopappdir)/xsane.desktop
	rm -f $(DESTDIR)$(desktopappdir)/xsane.desktop
	echo uninstalling $(DESTDIR)$(pixmapdir)/xsane.xpm
	rm -f $(DESTDIR)$(pixmapdir)/xsane.xpm
	@for logo in *-logo.xpm; do \
	  echo uninstalling $(DESTDIR)$(sanedatadir)/xsane/$${logo}; \
	  rm -f $(DESTDIR)$(sanedatadir)/xsane/$${logo}; \
	done 

xsane: $(XSANE_OBJS) $(LIBLIB)
	$(LINK) $(XSANE_OBJS) \
	        $(LIBLIB) $(LIBS) $(SANE_LIBS)

xsane-icon.opc: xsane-icon.rc xsane.ico
	windres -i xsane-icon.rc -o xsane-icon.opc

clean:
	rm -f *.o *~ .*~ *.bak
	rm -rf .libs

distclean: clean
	rm -f Makefile $(PROGRAMS) 

depend:
	makedepend $(INCLUDES) *.c

.PHONY: all install depend clean distclean

xsane.o: xsane.h
xsane.o: xsane-back-gtk.h
xsane.o: xsane-front-gtk.h
xsane.o: xsane-preview.h
xsane.o: xsane-save.h
xsane.o: xsane-gamma.h
xsane.o: xsane-setup.h
xsane.o: xsane-scan.h
xsane.o: xsane-rc-io.h
xsane.o: xsane-device-preferences.h
xsane.o: xsane-preferences.h
xsane.o: xsane-icons.h
xsane.o: xsane-batch-scan.h
xsane.o: xsane-multipage-project.h
xsane.o: xsane-fax-project.h
xsane.o: xsane-email-project.h
xsane.o: xsane-text.h

xsane-back-gtk.o: xsane.h
xsane-back-gtk.o: xsane-back-gtk.h
xsane-back-gtk.o: xsane-front-gtk.h
xsane-back-gtk.o: xsane-preferences.h
xsane-back-gtk.o: xsane-gamma.h
xsane-back-gtk.o: xsane-text.h

xsane-front-gtk.o: xsane.h
xsane-front-gtk.o: xsane-back-gtk.h
xsane-front-gtk.o: xsane-preferences.h
xsane-front-gtk.o: xsane-preview.h
xsane-front-gtk.o: xsane-save.h
xsane-front-gtk.o: xsane-gamma.h
xsane-front-gtk.o: xsane-setup.h
xsane-front-gtk.o: xsane-text.h

xsane-batch-scan.o: xsane.h
xsane-batch-scan.o: xsane-scan.h
xsane-batch-scan.o: xsane-batch-scan.h
xsane-batch-scan.o: xsane-back-gtk.h
xsane-batch-scan.o: xsane-front-gtk.h
xsane-batch-scan.o: xsane-rc-io.h
xsane-batch-scan.o: xsane-preview.h
xsane-batch-scan.o: xsane-gamma.h
xsane-batch-scan.o: xsane-text.h

xsane-preview.o: xsane.h
xsane-preview.o: xsane-back-gtk.h
xsane-preview.o: xsane-front-gtk.h
xsane-preview.o: xsane-batch-scan.h
xsane-preview.o: xsane-preview.h
xsane-preview.o: xsane-preferences.h
xsane-preview.o: xsane-gamma.h
xsane-preview.o: xsane-text.h

xsane-preferecnes.o: xsane.h
xsane-preferecnes.o: xsane-preferences.h
xsane-preferecnes.o: xsane-rc-io.h

xsane-device-preferences.o: xsane.h
xsane-device-preferences.o: xsane-rc-io.h
xsane-device-preferences.o: xsane-back-gtk.h
xsane-device-preferences.o: xsane-front-gtk.h
xsane-device-preferences.o: xsane-gamma.h

xsane-rc-io.o: xsane.h
xsane-rc-io.o: xsane-rc-io.h

xsane-save.o: xsane.h
xsane-save.o: xsane-back-gtk.h
xsane-save.o: xsane-front-gtk.h

xsane-scan.o: xsane.h
xsane-scan.o: xsane-back-gtk.h
xsane-scan.o: xsane-front-gtk.h
xsane-scan.o: xsane-preferences.h
xsane-scan.o: xsane-preview.h
xsane-scan.o: xsane-viewer.h
xsane-scan.o: xsane-save.h
xsane-scan.o: xsane-gamma.h
xsane-scan.o: xsane-setup.h
xsane-scan.o: xsane-email-project.h
xsane-scan.o: xsane-text.h

xsane-gamma.o: xsane.h
xsane-gamma.o: xsane-back-gtk.h
xsane-gamma.o: xsane-front-gtk.h
xsane-gamma.o: xsane-preferences.h
xsane-gamma.o: xsane-preview.h
xsane-gamma.o: xsane-save.h
xsane-gamma.o: xsane-text.h

xsane-setup.o: xsane.h
xsane-setup.o: xsane-back-gtk.h
xsane-setup.o: xsane-front-gtk.h
xsane-setup.o: xsane-preferences.h
xsane-setup.o: xsane-device-preferences.h
xsane-setup.o: xsane-preview.h
xsane-setup.o: xsane-save.h
xsane-setup.o: xsane-gamma.h
xsane-setup.o: xsane-batch-scan.h
xsane-setup.o: xsane-text.h

xsane-viewer.o: xsane.h
xsane-viewer.o: xsane-back-gtk.h
xsane-viewer.o: xsane-front-gtk.h
xsane-viewer.o: xsane-preferences.h
xsane-viewer.o: xsane-viewer.h
xsane-viewer.o: xsane-gamma.h
xsane-viewer.o: xsane-icons.h
xsane-viewer.o: xsane-save.h
xsane-viewer.o: xsane-text.h

xsane-multipage-project.o: xsane.h
xsane-multipage-project.o: xsane-back-gtk.h
xsane-multipage-project.o: xsane-front-gtk.h
xsane-multipage-project.o: xsane-preferences.h
xsane-multipage-project.o: xsane-multipage-project.h
xsane-multipage-project.o: xsane-text.h
xsane-multipage-project.o: xsane-save.h

xsane-fax-project.o: xsane.h
xsane-fax-project.o: xsane-back-gtk.h
xsane-fax-project.o: xsane-front-gtk.h
xsane-fax-project.o: xsane-preferences.h
xsane-fax-project.o: xsane-fax-project.h
xsane-fax-project.o: xsane-text.h

xsane-email-project.o: xsane.h
xsane-email-project.o: xsane-back-gtk.h
xsane-email-project.o: xsane-front-gtk.h
xsane-email-project.o: xsane-preferences.h
xsane-email-project.o: xsane-email-project.h
xsane-email-project.o: xsane-text.h

