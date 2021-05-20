# lower_case.s
TOOLPATH=/usr/aarch64-linux-gnu/bin

main: obj.o
	$(TOOLPATH)/ld obj.o -o main
obj.o: lower_case.s
	$(TOOLPATH)/as lower_case.s -o obj.o
