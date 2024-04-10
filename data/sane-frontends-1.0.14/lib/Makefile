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
INCLUDES = -I. -I$(srcdir) \
	-I$(top_builddir)/include/sane -I$(top_srcdir)/include
CPPFLAGS =  -D_GNU_SOURCE 	  -DPATH_SANE_DATA_DIR=$(sanedatadir) 	  -DV_MAJOR=1 -DV_MINOR=0 -DV_BUILD=14 -DSANE_V_MAJOR=1
CFLAGS = -g -O2 -Wall
LDFLAGS = 
LIBS = -lm 
DEFS = -DHAVE_CONFIG_H

COMPILE = $(CC) -c $(DEFS) $(INCLUDES) $(CPPFLAGS) $(CFLAGS)



LIBLIB_OBJS	= alloca.o getopt.o getopt1.o strndup.o \
		  strdup.o strsep.o snprintf.o usleep.o isfdtype.o \
		  vsyslog.o getenv.o
LIBLIB_LTOBJS	= alloca.lo getopt.lo getopt1.lo strndup.lo \
		  strdup.lo strsep.lo snprintf.lo usleep.lo isfdtype.lo \
		  vsyslog.lo getenv.lo

TARGETS = $(LIBLIB_OBJS)
TARGETS = liblib.a

DISTFILES = Makefile.in alloca.c getenv.c getopt.c getopt1.c isfdtype.c \
  snprintf.c strdup.c strndup.c strsep.c usleep.c vsyslog.c 

.PHONY: all check clean depend dist distclean install uninstall

.SUFFIXES:
.SUFFIXES: .c .o
.c.o:
	$(COMPILE) $<
	@test -f $@ || $(COMPILE) $<

all:	$(TARGETS)

liblib.a: $(LIBLIB_OBJS)
	ar r $@ $(LIBLIB_OBJS)
	$(RANLIB) $@

install: all

uninstall:

check:

depend:
	makedepend -I. -I../include *.c

clean:
	rm -f *.out *.o *.lo *~ *.a *.bak $(TESTPROGRAMS)
	rm -rf .libs

distclean: clean
	rm -f Makefile

dist: $(DISTFILES)
	for file in $(DISTFILES); do \
	  ln $$file $(distdir)/lib 2> /dev/null \
	    || cp -p $$file $(distdir)/lib ; \
	done
