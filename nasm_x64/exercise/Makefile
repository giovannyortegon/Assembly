# use_structs.asm
main: obj.o
	gcc obj.o -o main -no-pie
obj.o: use_structs.asm
	nasm -felf64 -g -F dwarf use_structs.asm -o obj.o
