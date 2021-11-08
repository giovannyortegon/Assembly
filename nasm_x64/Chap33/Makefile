# shuffle.asm
main: obj.o
	gcc -o main obj.o -no-pie
obj.o: shuffle.asm
	nasm -f elf64 -g -F dwarf shuffle.asm -o obj.o
