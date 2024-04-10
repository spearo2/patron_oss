SHELL = /bin/sh


srcdir = .
top_srcdir = ..
top_builddir = ..

PACKAGE = sane-frontends
VERSION = 1.0.14
distdir = $(top_srcdir)/$(PACKAGE)-$(VERSION)

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
infodir = ${prefix}/info
mandir = ${prefix}/man
includedir = ${prefix}/include
oldincludedir = /usr/include
configdir = ${sysconfdir}/sane.d
sanedatadir = ${datadir}/sane
docdir=$(prefix)/doc/sane-1.0.14

MKDIR = $(top_srcdir)/mkinstalldirs
INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644
LN_S = @LN_S@



SANE_INCLUDES = $(addprefix $(top_srcdir)/include/sane/,config.h.in sanei.h \
  sanei_codec_ascii.h sanei_codec_bin.h sanei_debug.h sanei_wire.h)
OTHER_INCLUDES = $(addprefix $(top_srcdir)/include/,Makefile.in getopt.h \
  lalloca.h)

DISTFILES = $(SANE_INCLUDES) $(OTHER_INCLUDES)

.PHONY: all clean depend dist install uninstall

all:

dist: $(DISTFILES)
	$(MKDIR) $(distdir)/include/sane
	for file in $(OTHER_INCLUDES); do \
	  ln $$file $(distdir)/include 2> /dev/null \
	    || cp -p $$file $(distdir)/include; \
	done
	for file in $(SANE_INCLUDES); do \
	  ln $$file $(distdir)/include/sane 2> /dev/null \
	    || cp -p $$file $(distdir)/include/sane; \
	done

install:

uninstall:

clean:

depend:

distclean: clean
	rm -f *~ sane/*~
	rm -f sane/config.h
	rm -f Makefile
