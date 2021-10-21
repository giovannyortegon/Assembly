# sse_integer.asm
main: obj.o
	gcc obj.o -o main -no-pie
obj.o: sse_integer.asm
	nasm -felf64 -g -F dwarf sse_integer.asm -o obj.o
