#adcs.s
OBJS = adcs.o

%.o : abcs.s
	as %< -o $@
main: $(OBJS)
	ld -o main $(OBJS)
