# addsub.asm
main.exe: stack_frame.obj
	gcc -g -o main.exe stack_frame.obj
stack_frame.obj: stack_frame.asm
	nasm -f win64 -g -F cv8 stack_frame.asm -l stack_frame.lst
