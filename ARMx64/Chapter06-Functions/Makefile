# mainmacro.s uppermacro.s
TOOLPATH = /usr/aarch64-linux-gnu/bin/
UPPEROBJS = mainmacro.o uppermacro.o
DEBUGFLGS = -g
all: upper
%.o: %.s
	$(TOOLPATH)/as $(DEBUGFLGS) $< -o $@
upper: $(UPPEROBJS)
	$(TOOLPATH)/ld -o upper $(UPPEROBJS)
