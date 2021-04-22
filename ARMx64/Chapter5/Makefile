# upper.s
main: obj.o
	ld -o main obj.o
obj.o: upper.s
	as -g upper.s -o obj.o
