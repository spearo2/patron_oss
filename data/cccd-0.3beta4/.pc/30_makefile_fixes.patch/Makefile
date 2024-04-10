SOURCES = cccd.c cd.c cddb.c cddbp.c info.c options.c misc.c
HEADERS = $(SOURCES:.c=.h) general.h icons.h
OBJECTS = cccd.o cd.o cddb.o cddbp.o info.o options.o misc.o
OTHERS = Makefile CHANGES README TODO README.original BUGREPORT COPYING
TARGET = cccd

CC = gcc

# you may need to change this
MAILPROG = "/bin/mail -i"

# If $(TARGET) spits out too many debug messages, remove -DDEBUG from 
# next line

CFLAGS = -g -Wall `gtk-config --cflags` -DDEBUG
#LDFLAGS = -lefence `gtk-config --libs` 
LDFLAGS = `gtk-config --libs` 

# production flags (no debugging)
#CFLAGS = -O2 -Wall `gtk-config --cflags`
#LDFLAGS = -s `gtk-config --libs` 

prefix=/usr/local
bindir=$(prefix)/bin
mandir=$(prefix)/man/man1

CFLAGS += -DMAILPROG="\"/bin/mail -i\""

.SUFFIXES: .c

.c.o: $(CC) -c $(CFLAGS) $<

all: $(TARGET)

$(TARGET): $(OBJECTS)
	gcc -o $(TARGET) $(OBJECTS) $(CFLAGS) $(LDFLAGS)

install: $(TARGET)
	mkdir -p $(bindir)
	install -c -s -m 0755 cccd $(bindir)
	mkdir -p $(mandir)
	install -c -m 0755 cccd.1 $(mandir)
	@echo "Please read the README for additional installation hints"

static:	$(OBJECTS)
#	gcc -o $(TARGET).static $(OBJECTS) -L/usr/lib -L/usr/X11R6/lib -Wl,-Bstatic  -lgtk -lgdk -lglib -Wl,-Bdynamic -lXext -lX11 -lm
	gcc -static -o $(TARGET).static $(OBJECTS) -L/usr/lib -L/usr/X11R6/lib  -lgtk -lgdk -lglib -lXext -lX11 -lm

clean:
	rm -rf core *.o $(TARGET)

# dependancies, gcc `gtk-config --cflags` -MM *.c
cccd.o: cccd.c general.h misc.h cd.h options.h cddb.h info.h cccd.h \
 icons.h
cd.o: cd.c cd.h
cddb.o: cddb.c general.h cd.h cddbp.h misc.h options.h cddb.h
cddbp.o: cddbp.c misc.h cddbp.h
info.o: info.c general.h misc.h cd.h cddb.h options.h cccd.h info.h
misc.o: misc.c
options.o: options.c general.h misc.h options.h
