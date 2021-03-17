# add_adc.s
TOOLPATH = /usr/aarch64-linux-gnu/bin
main: obj.o
	$(TOOLPATH)/ld -o main obj.o
obj.o: add_adc.s
	$(TOOLPATH)/as -g add_adc.s -o obj.o
