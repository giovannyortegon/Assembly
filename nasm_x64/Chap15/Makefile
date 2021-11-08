# function5.asm
main: obj.o
	gcc -o main obj.o -no-pie
obj.o: function5.asm
	nasm -f elf64 function6.asm -o obj.o -l function6.lst
