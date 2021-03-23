# cmdline.asm
main: obj.o
	gcc -g -o main obj.o -no-pie
obj.o: cmdline.asm
	nasm -f elf64 -g -F dwarf cmdline.asm -o obj.o
