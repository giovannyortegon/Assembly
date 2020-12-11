exit.exe: exit.obj
	gcc -o exit.exe exit.obj
exit.obj: exit.asm
	nasm -f win64 -g -F cv8 exit.asm -l exit.lst
#	nasm -f win64 -P ebe.inc exit.asm -l exit.lst
