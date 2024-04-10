Summary: a CDDB capable CD player for X11/GTK+
Name: cccd
Version: 0.3beta3
Release: 1
Copyright: GPL
Group: X11/Amusements
Source: http://home.pages.de/~jst/cccd/cccd-0.3beta3.tar.gz
BuildRoot: /var/tmp/cccd-root
Requires: gtk+
Vendor: Jochen Stein <jst@writeme.com>

%description
This program plays audio CDs on your cdrom drive. It queries CD
info from CDDB, uses GTK+ as user interface and takes up very
little screen space.

%prep
%setup

%build
make 

%install
make install prefix=$RPM_BUILD_ROOT/usr/local

%clean
rm -fr $RPM_BUILD_ROOT

%files
%doc README COPYING CHANGES BUGREPORT README.original
/usr/local/bin/cccd
/usr/local/man/man1/cccd.1
