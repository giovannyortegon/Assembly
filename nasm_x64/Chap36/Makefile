# matrix4x4.asm
main: obj.o
	gcc obj.o -o main -no-pie
obj.o: matrix4x4.asm
	nasm -felf64 -g -F dwarf matrix4x4.asm -o obj.o
clean:
	rm -f main obj.o
