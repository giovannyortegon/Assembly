# copy_array.asm
main: obj.o
	gcc -o main obj.o -no-pie
obj.o: copy_array.asm
	nasm -f elf64 -g -F dwarf copy_array.asm -o obj.o
