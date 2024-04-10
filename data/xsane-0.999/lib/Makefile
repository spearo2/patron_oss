SHELL = /bin/sh


srcdir = .
top_srcdir = ..
top_builddir = ..

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

INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644

RANLIB = ranlib

CC = gcc
INCLUDES = -I. -I$(srcdir) \
	-I$(top_builddir)/include/sane -I$(top_srcdir)/include
CPPFLAGS =  -D_GNU_SOURCE 	  -DV_MAJOR=0 -DV_MINOR=999 -DSANE_V_MAJOR=1
CFLAGS = -g -O2 -Wall
LDFLAGS = 
LIBS = -lpng -llcms2 -ltiff -ljpeg -lz -lm 
DEFS = -DHAVE_CONFIG_H

COMPILE = $(CC) -c $(DEFS) $(INCLUDES) $(CPPFLAGS) $(CFLAGS)



LIBLIB_OBJS	= alloca.o getopt.o getopt1.o strndup.o \
		  strdup.o strsep.o snprintf.o usleep.o md5.o
LIBLIB_LTOBJS	= alloca.lo getopt.lo getopt1.lo strndup.lo \
		  strdup.lo strsep.lo snprintf.lo usleep.lo md5.lo

TARGETS = $(LIBLIB_OBJS)
TARGETS = liblib.a

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

.PHONY: all install check depend clean distclean
