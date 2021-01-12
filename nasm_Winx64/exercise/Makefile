# average.asm
main.exe: object.obj
	gcc -o main.exe object.obj
object.obj: average.asm
	nasm -o object.obj -f win64 -g -F cv8 average.asm