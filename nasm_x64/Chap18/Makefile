# macro.asm
main: obj.o
	gcc -o main obj.o -no-pie
obj.o: macro.asm
	nasm -f elf64 -g -F dwarf macro.asm -o obj.o -l macro.lst
