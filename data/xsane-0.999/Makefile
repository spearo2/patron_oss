SHELL = /bin/sh


srcdir = .
top_srcdir = .
top_builddir = .

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

sanedatadir = ${prefix}/share/sane
desktopappdir = ${prefix}/share/applications

MKDIR = $(top_srcdir)/mkinstalldirs
INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644



SUBDIRS	= lib  src po doc

all: all-recursive

install: install-recursive

uninstall: uninstall-recursive

clean: clean-recursive

rpm: all-recursive
	checkinstall -R --strip=no --pkgname=xsane --pkgversion=0.999 \
                     --pkgsource=http://www.xsane.org --pkgaltsource=ftp://ftp.sane-project.org/pub/sane/xsane/ \
                     --pkggroup=Applications/Graphics --spec=xsane.spec --pkglicense=GPL --pkgrelease=1

distclean: clean distclean-recursive
	rm -f *~ include/*~ include/sane/*~ *.log *.bak libtool
	rm -f include/sane/config.h Makefile config.cache config.status
	rm -f intl/Makefile
	rm -rf autom4te.cache

autoconfig: autoconfig-recursive 
	aclocal -I m4
	autoconf configure.in >configure
	rm -rf autom4te.cache

depend: depend-recursive

all-recursive install-recursive uninstall-recursive clean-recursive distclean-recursive \
depend-recursive rpm-recursive:
	for subdir in $(SUBDIRS); do		\
	  target=`echo $@ | sed s/-recursive//`; \
	  echo making $$target in $$subdir;	\
	  (cd $$subdir && $(MAKE) $$target)	\
	   || case "$(MFLAGS)" in *k*) fail=yes;; *) exit 1;; esac; \
	done && test -z "$$fail"

.PHONY: all clean depend rpm autoconfig \
	all-recursive install-recursive clean-recursive depend-recursive autoconfig-recursive
