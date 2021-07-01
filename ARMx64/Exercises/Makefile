#add_two_numbers.s
TOOLPATH = aarch64-linux-gnu-
FILEOBJES = add_two_numbers.o sum.o
all: main

%.o : %.s
	$(TOOLPATH)as -g $< -o $@

main: $(FILEOBJES)
	$(TOOLPATH)ld $(FILEOBJES) -o main
