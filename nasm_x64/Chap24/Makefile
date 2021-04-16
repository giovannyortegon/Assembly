# move_string.asm
main: obj.o
	gcc-o main obj.o -no-pie
obj.o: strings.asm
	nasm -felf64 -g -F dwarf strings.asm -o obj.o
