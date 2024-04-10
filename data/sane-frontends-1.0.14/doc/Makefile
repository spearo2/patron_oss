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



SECT1	= xscanimage.1 xcam.1 scanadf.1
MANPAGES = $(SECT1)
LATEX	= TEXINPUTS=$(srcdir):$$TEXINPUTS latex
DLH	= TEXINPUTS=$(srcdir):$$TEXINPUTS dlh
MAN2HTML= nroff -man |\
	  man2html -compress -topm 6 -botm 6 -nodepage \
          -title $${page} -cgiurl '$$title.$$section.html'|\
	  sed 's,<BODY>,<BODY BGCOLOR=\#FFFFFF TEXT=\#000000><H1 ALIGN=CENTER><IMG SRC="/images/sane.png" HEIGHT=117 WIDTH=346></H1>,'

DISTFILES = Makefile.in sane.png xcam.man xscanimage.man scanadf.man

.PHONY: all clean depend dist html html-man install ps uninstall

all: $(MANPAGES)

%.1: %.man
	@sed -e 's|@DATADIR@|$(datadir)|g' \
	    -e 's|@CONFIGDIR@|$(configdir)|g' \
	    -e 's|@LIBDIR@|$(libdir)|g' \
	    -e 's|@BINDIR@|$(bindir)|g' \
	    -e 's|@SBINDIR@|$(sbindir)|g' $^ >$@
	@echo Generating manpage $@...

install: $(MANPAGES)
	$(MKDIR) $(DESTDIR)$(mandir)/man1
	@for page in $(SECT1); do \
	  echo installing $${page} in $(mandir)/man1/$${page}...; \
	  $(INSTALL_DATA) $${page} $(DESTDIR)$(mandir)/man1/$${page} \
            || exit 1; \
	done

uninstall:
	@for page in $(SECT1); do \
	  echo Removing $${page} in $(mandir)/man1/$${page}...; \
	  rm -f $(mandir)/man1/$${page} ; \
	done

html-man: $(MANPAGES)
	@for page in $(MANPAGES); do \
	  echo "translating $${page} to $${page}.html..."; \
	  cat $${page} | $(MAN2HTML) > $${page}.html; \
	done

clean:
	rm -f *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky *.blg *.idx *.cb
	rm -f *.ilg

distclean: clean
	rm -f $(MANPAGES)
	for manpage in $(MANPAGES) ; do \
	  rm -f $${manpage}.html ; \
	done
	rm -f Makefile *~
	rm -f *.lot *.lof *.ind

depend:

dist: $(DISTFILES)
	for file in $(DISTFILES); do \
	  ln $$file $(distdir)/doc 2> /dev/null \
	    || cp -p $$file $(distdir)/doc ; \
	done
