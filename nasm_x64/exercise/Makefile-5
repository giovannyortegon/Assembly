#  bill.asm
main: obj.o calculate.o
	gcc -o main obj.o calculate.o -no-pie
calculate.o: calculate.asm
	nasm -felf64 -g -F dwarf calculate.asm
obj.o: bill.asm
	nasm -felf64 -g -F dwarf bill.asm -o obj.o
