# sse_search.asm
main: obj.o
	gcc -o main obj.o -no-pie
obj.o: sse_search.asm
	nasm -felf64 -g -F dwarf sse_search.asm -o obj.o
