main: obj.o
	ld -m elf_i386 -o main obj.o
obj.o: mul_array.asm
	nasm -felf -g -F dwarf fibonacci.asm -o obj.o
