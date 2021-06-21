# Add two 64 bit numbers together
main: obj.o
	arm-linux-gnueabihf-ld obj.o -o main
obj.o: program6b.s
	arm-linux-gnueabihf-as -g program6b.s -o obj.o
