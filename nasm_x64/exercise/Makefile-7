# random_range
main: random_range.o
	gcc random_range.o -o main -no-pie
random_range.o: random_range.asm
	nasm -felf64 -g -F dwarf random_range.asm
