# registros.asm
obj.o: resgistro.asm
	nasm -f elf64 -g resgistro.asm -o obj.o
main: obj.o
	ld  -o main obj.o
