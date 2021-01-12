# two_points.asm
main: obj.o
	gcc -o main obj.o -no-pie
two_points.o: two_points.asm
	nasm -f elf64 -g -F dwarf two_points.asm
