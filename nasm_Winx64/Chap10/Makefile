# args.asm
main.exe: args.obj
	gcc -o main.exe args.obj
args.obj: args.asm
	nasm -f win64 -g -F cv8 args.asm