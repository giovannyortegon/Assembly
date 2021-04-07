# move_string.asm
main: obj.o
	gcc -g obj.o -o main -no-pie
obj.o: move_strings.asm
	nasm -f elf64 -g -F dwarf move_strings.asm -o obj.o
