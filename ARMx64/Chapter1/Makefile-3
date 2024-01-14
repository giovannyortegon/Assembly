# More_string.s
TOOLPATH=/usr/aarch64-linux-gnu/bin
main: obj.o
	$(TOOLPATH)/ld -o main obj.o
obj.o: More_string.s
	$(TOOLPATH)/as -g More_string.s -o obj.o
