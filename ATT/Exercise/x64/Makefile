main: obj.o
	gcc -o main obj.o -no-pie
obj.o: add.s
	as -gstabs add.s -o obj.o
