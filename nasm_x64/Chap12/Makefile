# suma de dos numeros
main: main.o suma.o
	gcc -o main main.o suma.o -no-pie
suma.o: suma.asm
	nasm -f elf64 -g -F dwarf suma.asm
main.o: main.asm
	nasm -f elf64 -g -F dwarf main.asm
