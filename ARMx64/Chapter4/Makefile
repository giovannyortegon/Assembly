# using_while.s
TOOLPATH = /usr/aarch64-linux-gnu/bin
main: obj.o
	$(TOOLPATH)/ld -o main obj.o
obj.o: using_while.s
	$(TOOLPATH)/as -g using_while.s -o obj.o
