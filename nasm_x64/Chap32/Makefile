# sse_string3_exp.asm
main: obj.o
	gcc obj.o -o main -no-pie
obj.o: sse_string3_exp.asm
	nasm -f elf64 -g -F dwarf sse_string3_exp.asm -o obj.o
