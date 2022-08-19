# sse_string_length.asm
main: obj.o
	gcc -o main obj.o -no-pie
obj.o: sse_string_length.asm
	nasm -felf64 -g -F dwarf sse_string_length.asm -o obj.o
