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
xsanedocdir = ${datadir}/sane/xsane/doc

MKINSTALLDIRS = $(top_srcdir)/mkinstalldirs
INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644



SECT1	= xsane.1
MANPAGES = $(SECT1)
LATEX	= TEXINPUTS=$(srcdir):$$TEXINPUTS latex
DLH	= TEXINPUTS=$(srcdir):$$TEXINPUTS dlh
MAN2HTML= nroff -man |\
	  man2html -compress -title $${page} -cgiurl '$$title.$$section.html'|\
	  sed 's,<BODY>,<BODY BGCOLOR=\#FFFFFF TEXT=\#000000><H1 ALIGN=CENTER><IMG SRC="../sane.jpg" HEIGHT=117 WIDTH=346></H1>,'

all: $(MANPAGES)

%.1: %.man
	sed -e 's|@DATADIR@|$(datadir)|g' \
	    -e 's|@SANEDATADIR@|$(sanedatadir)|g' \
	    -e 's|@CONFIGDIR@|$(configdir)|g' \
	    -e 's|@LIBDIR@|$(libdir)|g' \
	    -e 's|@BINDIR@|$(bindir)|g' \
	    -e 's|@SBINDIR@|$(sbindir)|g' $^ >$@

install: $(MANPAGES)
	$(MKINSTALLDIRS) $(DESTDIR)$(mandir)/man1 
	@for page in $(SECT1); do \
	  echo installing $${page} in $(DESTDIR)$(mandir)/man1/$${page}...; \
	  $(INSTALL_DATA) $${page} $(DESTDIR)$(mandir)/man1/$${page} || exit 1; \
	done
	$(MKINSTALLDIRS) $(DESTDIR)$(datadir)

	$(MKINSTALLDIRS) $(DESTDIR)$(xsanedocdir)
	@for page in *.html; do\
	  echo installing $${page} in $(DESTDIR)$(xsanedocdir)/$${page}...; \
	  $(INSTALL_DATA) $${page} $(DESTDIR)$(xsanedocdir)/$${page} || exit 1; \
	done

	@for image in *.jpg; do\
	  echo installing $${image} in $(DESTDIR)$(xsanedocdir)/$${image}...; \
	  $(INSTALL_DATA) $${image} $(DESTDIR)$(xsanedocdir)/$${image} || exit 1; \
	done

uninstall:
	@for page in $(SECT1); do \
	  echo uninstalling $(DESTDIR)$(mandir)/man1/$${page}...; \
	  rm -f $(DESTDIR)$(mandir)/man1/$${page} || exit 1; \
	done

	@for page in *.html; do\
	  echo uninstalling $(DESTDIR)$(xsanedocdir)/$${page}...; \
	  rm -f $(DESTDIR)$(xsanedocdir)/$${page} || exit 1; \
	done

	@for image in *.jpg; do\
	  echo uninstalling $${image} in $(DESTDIR)$(xsanedocdir)/$${image}...; \
	  rm -f $(DESTDIR)$(xsanedocdir)/$${image} || exit 1; \
	done

docs: ps html

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
	rm -f Makefile *~

depend:

.PHONY: all install depend clean ps html htmlman sane-backends-html
