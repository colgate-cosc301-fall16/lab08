CC=clang
CFLAGS=-g -Wall -pthread
TARGETS=procshare threadshare mtlist part1
INCLUDES=list.h

all: $(TARGETS)

procshare: procshare.o
	$(CC) $(CFLAGS) -o $@ procshare.o

threadshare: threadshare.o
	$(CC) $(CFLAGS) -o $@ threadshare.o

mtlist: list.o mtlist.o list.h
	$(CC) $(CFLAGS) -o $@ list.o mtlist.o

part1: part1.o
	$(CC) $(CFLAGS) -o $@ part1.o

.PHONY: clean
clean:
	rm -f *.o $(TARGETS) list.o

%.o: %.c $(INCLUDES) 
	$(CC) -c $(CFLAGS) $<
