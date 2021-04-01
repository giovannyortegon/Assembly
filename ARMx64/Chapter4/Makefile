# Print ASCII
TOOLPATH = /usr/aarch64-linux-gnu/bin
main: obj.o
	$(TOOLPATH)/ld -o main obj.o
obj.o: PrintASCII.s
	$(TOOLPATH)/as PrintASCII.s -o obj.o
