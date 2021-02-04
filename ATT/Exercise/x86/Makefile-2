# average.s
main: obj.o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -lc -o main obj.o
obj.o: average.s
	as -32 -gstabs average.s -o  obj.o
