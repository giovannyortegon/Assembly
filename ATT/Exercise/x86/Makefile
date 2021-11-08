main: obj.o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -lc -o main obj.o
obj.o: mul_to_array.s
	as -32 -gstabs pythagorean_triple.s -o obj.o
clean:
	rm main obj.o
