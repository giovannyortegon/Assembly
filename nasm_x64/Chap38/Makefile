# trace.asm
main: obj.o
	gcc -o main obj.o -no-pie
obj.o: trace.asm
	nasm -felf64 -g -F dwarf trace.asm -o obj.o
