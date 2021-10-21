# function.asm
function1: function1.o
	gcc -o function1 function1.o -no-pie
function1.o: function1.asm
	nasm -f elf64 -g -F dwarf function1.asm -l function1.lst
clean:
	rm function1 function1.o
