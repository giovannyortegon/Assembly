# if_else.s
TOOLPATH = /usr/aarch64-linux-gnu/bin
main: obj.o
	$(TOOLPATH)/ld -o main obj.o
obj.o: if_else.s
	$(TOOLPATH)/as -g if_else.s -o obj.o
