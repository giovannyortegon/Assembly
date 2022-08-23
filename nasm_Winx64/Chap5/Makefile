# addsub.asm
addsub.exe: addsub.obj
	gcc -g -o addsub.exe addsub.obj
addsub.obj: addsub.asm
	nasm -f win64 -g -F cv8 addsub.asm -l addsub.lst
