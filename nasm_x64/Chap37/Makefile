# transpose4x4.asm
main: obj.o
	gcc -o main obj.o -no-pie
obj.o: transpose4x4.asm
	nasm -felf64 -g -F dwarf transpose4x4.asm -o obj.o
