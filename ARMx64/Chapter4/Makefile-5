# switch_asm.s
TOOLPATH=/usr/aarch64-linux-gnu/bin
main: obj.o
	$(TOOLPATH)/ld -o main obj.o
obj.o: switch_asm.s
	$(TOOLPATH)/as -g switch_asm.s -o obj.o
