# fpadd.asm
main: obj.o
	gcc obj.o -o main -no-pie
obj.o: fpadd.asm
	nasm -felf64 -g -F dwarf fpadd.asm -o obj.o
