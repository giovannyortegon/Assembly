# movexamps.s
TOOLPATH=/usr/aarch64-linux-gnu/bin/
OBJS = movexamps.o
ifdef DEBUG
	DEBUGFLGS = -ggdb3
else
	DEBUGFLGS = 
endif
%.o : %.s
	$(TOOLPATH)/as $(DEBUGFLGS) $< -o $@
main: $(OBJS)
	$(TOOLPATH)/ld $(OBJS) -o main
