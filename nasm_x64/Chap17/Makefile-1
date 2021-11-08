# Make of macro
main: obj.o
	gcc obj.o -o main -no-pie
obj.o: macro.asm
	nasm -f elf64 -g -F dwarf macro.asm -o obj.o -l macro.lst
