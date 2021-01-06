# Makefile memory.asm
memory.exe: memory.obj
	gcc -o memory.exe memory.obj
memory.obj: memory.asm
#	nasm -f win64 -g -F cv8 memory.asm -l memory.lst
	nasm -f win64 -P ebe.inc memory.asm -l memory.lst
