# movexamps.s
OBJS = movexamps.o
DEBUGFLGS = -ggdb3

%.o : %.s
	as $(DEBUGFLGS) $< -o $@
main: $(OBJS)
	ld $(OBJS) -o main
clean:
	rm main movexamps.o
