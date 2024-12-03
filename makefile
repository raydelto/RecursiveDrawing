CC=g++
CFLAGS=-std=c++17 -g -Wall 
INCLUDES=-I./headers -I.

all: main

simplecanvas.o: simplecanvas/simplecanvas.h simplecanvas/simplecanvas.cpp
	$(CC) $(CFLAGS) -c simplecanvas/simplecanvas.cpp -o bin/simplecanvas.o

shape.o: simplecanvas.o headers/shape.h src/shape.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -c src/shape.cpp -o bin/shape.o

fractal.o: simplecanvas.o src/fractal.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -c src/fractal.cpp -o bin/fractal.o

main: src/main.cpp simplecanvas.o shape.o fractal.o
	$(CC) $(CFLAGS) $(INCLUDES) bin/simplecanvas.o bin/shape.o bin/fractal.o src/main.cpp -o bin/main

clean:
	rm -rf ./bin/*