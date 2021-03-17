# file.asm
main: obj.o
	gcc -o main obj.o -no-pie
obj.o: file.asm
	nasm -f elf64 -g -F dwarf file.asm -o obj.o
