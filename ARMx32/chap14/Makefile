# program6a.s - suma dos numeros
main: obj.o
	arm-linux-gnueabihf-ld obj.o -o main
obj.o: convert_binary.s
	arm-linux-gnueabihf-as -g convert_binary.s -o obj.o
