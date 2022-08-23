# funcion1.asm
main.exe: funcion1.obj
	gcc -g -o main.exe funcion1.obj
funcion1.obj: funcion1.asm
	nasm -f win64 -g -F cv8 funcion1.asm -l funcion1.lst