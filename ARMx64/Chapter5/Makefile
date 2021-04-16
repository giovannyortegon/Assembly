# Makefile
main: obj.o
	ld -o main obj.o
obj.o: LoadAddress.s
	as -ggdb3 LoadAddress.s -o obj.o
