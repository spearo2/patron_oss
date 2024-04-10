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

INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644

RANLIB = ranlib

CC = gcc
INCLUDES = -I. -I$(srcdir) -I$(top_builddir)/include -I$(top_srcdir)/include
CPPFLAGS =  -D_GNU_SOURCE 	  -DPATH_SANE_DATA_DIR=$(sanedatadir) 	  -DV_MAJOR=1 -DV_MINOR=0 -DV_BUILD=14 -DSANE_V_MAJOR=1
CFLAGS = -g -O2 -Wall 
LDFLAGS = 
LIBS = -lm 
DEFS = -DHAVE_CONFIG_H

COMPILE = $(CC) -c $(DEFS) $(INCLUDES) $(CPPFLAGS) $(CFLAGS)
MCOMP	= --mode=compile
MLINK	= --mode=link



LIBSANEI_OBJS = sanei_init_debug.o \
	sanei_wire.o sanei_codec_ascii.o sanei_codec_bin.o \
	sanei_save_values.o sanei_load_values.o

LIBSANEI_LTOBJS = sanei_init_debug.lo \
	sanei_wire.lo sanei_codec_ascii.lo sanei_codec_bin.lo \
	sanei_save_values.lo sanei_load_values.lo

TARGETS = libsanei.a

DISTFILES = Makefile.in sanei_codec_ascii.c sanei_codec_bin.c \
  sanei_init_debug.c sanei_load_values.c sanei_save_values.c \
  sanei_thread.c sanei_wire.c 

.PHONY: all install check depend clean distclean uninstall dist

.SUFFIXES:
.SUFFIXES: .c .o
.c.o:
	$(COMPILE) $<
	@test -f $@ || $(COMPILE) $<

all:	$(TARGETS)

libsanei.a: $(LIBSANEI_OBJS)
	ar r $@ $(LIBSANEI_OBJS)
	$(RANLIB) $@

install:

uninstall:

depend:
	makedepend -I. -I../include *.c

clean:
	rm -f *.out *.o *.lo *~ *.a *.bak $(OBJS)
	rm -rf .libs

distclean: clean
	rm -f Makefile

dist: $(DISTFILES)
	for file in $(DISTFILES); do \
	  ln $$file $(distdir)/sanei 2> /dev/null \
	    || cp -p $$file $(distdir)/sanei ; \
	done
