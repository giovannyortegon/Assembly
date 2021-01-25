# aligned.asm
main: obj.o
	gcc -o main obj.o -no-pie
obj.o: calcular_area.asm
	nasm -f elf64 -g -F dwarf calcular_area.asm -o obj.o
