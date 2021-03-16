# movn_add.s
TOOLPATH = /usr/aarch64-linux-gnu/bin/
DEBUGFLGS = -ggdb3
main: obj.o
	$(TOOLPATH)/ld obj.o -o main
obj.o: movn_add.s
	$(TOOLPATH)/as $(DEBUGFLGS) movn_add.s -o obj.o
