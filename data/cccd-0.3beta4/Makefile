SOURCES = cccd.c cd.c cddb.c cddbp.c info.c options.c misc.c
HEADERS = $(SOURCES:.c=.h) general.h icons.h
OBJECTS = cccd.o cd.o cddb.o cddbp.o info.o options.o misc.o
OTHERS = Makefile CHANGES README TODO README.original BUGREPORT COPYING
TARGET = cccd

CC = gcc

# you may need to change this
MAILPROG = "/usr/bin/mail -i"

# If $(TARGET) spits out too many debug messages, remove -DDEBUG from 
# next line



MY_CFLAGS = `pkg-config --cflags gtk+-2.0`

#MY_LDFLAGS = -lefence `pkg-config --libs gtk+-2.0` 
MY_LDFLAGS = -L/usr/lib `pkg-config --libs gtk+-2.0` 

# production flags (no debugging)
#MY_CFLAGS = -O2 -Wall `pkg-config --cflags gtk+-2.0`
#MY_LDFLAGS = -s `pkg-config --libs gtk+-2.0` 

prefix=/usr/local
bindir=$(prefix)/bin
mandir=$(prefix)/share/man/man1

MY_CFLAGS += -DMAILPROG="\"/usr/bin/mail -i\""

.SUFFIXES: .c

.c.o: $(CC) -c $(CFLAGS) $(MY_CFLAGS) $<

all: $(TARGET)

$(TARGET): $(OBJECTS)
	gcc -o $(TARGET) $(OBJECTS) $(CFLAGS) $(MY_CFLAGS) $(LDFLAGS) $(MY_LDFLAGS)

install: $(TARGET)
	mkdir -p $(bindir)
	install -c -m 0755 cccd $(bindir)
	mkdir -p $(mandir)
	install -c -m 0644 cccd.1 $(mandir)
	@echo "Please read the README for additional installation hints"

static:	$(OBJECTS)
#	gcc -o $(TARGET).static $(OBJECTS) -L/usr/lib -L/usr/X11R6/lib -Wl,-Bstatic  -lgtk -lgdk -lglib -Wl,-Bdynamic -lXext -lX11 -lm
	gcc -static -o $(TARGET).static $(OBJECTS) -L/usr/lib -L/usr/X11R6/lib  -lgtk -lgdk -lglib -lXext -lX11 -lm

clean:
	rm -rf core *.o $(TARGET)

# dependencies, gcc `gtk-config --cflags` -MM *.c
cccd.o: cccd.c general.h misc.h cd.h options.h cddb.h info.h cccd.h icons.h
	$(CC) -c $(CFLAGS) $(MY_CFLAGS) $<
cd.o: cd.c cd.h
	$(CC) -c $(CFLAGS) $(MY_CFLAGS) $<
cddb.o: cddb.c general.h cd.h cddbp.h misc.h options.h cddb.h
	$(CC) -c $(CFLAGS) $(MY_CFLAGS) $<
cddbp.o: cddbp.c misc.h cddbp.h
	$(CC) -c $(CFLAGS) $(MY_CFLAGS) $<
info.o: info.c general.h misc.h cd.h cddb.h options.h cccd.h info.h
	$(CC) -c $(CFLAGS) $(MY_CFLAGS) $<
misc.o: misc.c
	$(CC) -c $(CFLAGS) $(MY_CFLAGS) $<
options.o: options.c general.h misc.h options.h
	$(CC) -c $(CFLAGS) $(MY_CFLAGS) $<
