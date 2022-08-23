sum: sum.o
	ld -o sum sum.o -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2
sum.o: sum.asm
	nasm -f elf64 -g -F dwarf sum.asm -l sum.lst
clean:
	rm sum
