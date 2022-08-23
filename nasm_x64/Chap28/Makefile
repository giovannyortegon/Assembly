# sse_aligned.asm
main: obj.o
	gcc obj.o -o main -no-pie
obj.o: sse_aligned.asm
	nasm -felf64 sse_aligned.asm -o obj.o
