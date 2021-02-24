# console2.asm
main: obj.o
	gcc obj.o -o main -no-pie
obj.o: console2.asm
	nasm -f elf64 -g -F dwarf console2.asm -o obj.o
