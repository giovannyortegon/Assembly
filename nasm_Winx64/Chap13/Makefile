# struct_number - use struct in assembly
main.exe: struct_number.obj
	gcc struct_number.obj -o main.exe
struct_number.obj: struct_number.asm
	nasm -f win64 -g -F cv8 struct_number.asm