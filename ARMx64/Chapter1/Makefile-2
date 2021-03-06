# Activity1.s
TOOLPATH=/usr/aarch64-linux-gnu/bin
main: obj.o
	$(TOOLPATH)/ld -o main obj.o
obj.o: Activity1.s
	$(TOOLPATH)/as -g Activity1.s -o obj.o
