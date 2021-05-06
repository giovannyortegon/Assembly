# array.s
TOOLPATH=/usr/aarch64-linux-gnu/bin/
main: obj.o
    $(TOOLPATH)/ld obj.o -o main
obj.o: array.s
    $(TOOLPATH)/as -g array.s -o obj.o
