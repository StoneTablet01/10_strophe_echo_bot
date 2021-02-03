all: bot.exe
IDIR = /usr/local/lib
CC = gcc
CFLAGS = -I$(IDIR)

ODIR = object
LDIR = /usr/local/lib
LIBS = -lstrophe

# The general syntax for make files is two Lines
#       target: pre-req-1 pre-req-2 ...
#       command
# The line with the command must start with a tab not spaces
# Since atom substitues tabs with spaces, you should verify that
# tabs exist in a text processor like "wordpad"

bot.exe: bot.o
	$(CC) bot.o -L/usr/local/lib -I/usr/local/include -lstrophe -o bot.exe

# Build main.o (only requires bot.c to exist)
bot.o: bot.c
#	gcc -c main.c -L/usr/local/lib -I/usr/local/lib -lforme -o main.o
	$(CC) -c bot.c -L/usr/local/lib -I/usr/local/include -lstrophe -o bot.o

clean:
	rm bot.o mysum.o bot.exe
