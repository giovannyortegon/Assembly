# cpu.asm
main: obj.o
	gcc -o main obj.o -no-pie
obj.o: cpu.asm
	nasm -felf64 -g -F dwarf cpu.asm -o obj.o
