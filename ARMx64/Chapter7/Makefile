# main.S
PATH = /usr/aarch64-linux-gnu/bin/
PATH1 = /usr/bin/
UPPEROBJ = main.o upper.o

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif

all: upper

%.o : %.S
	$(PATH1)aarch64-linux-gnu-gcc $(DEBUGFLGS) -c $< -o $@
%.o : %.s
	$(PATH)as $(DEBUGFLGS) $< -o $@
upper: $(UPPEROBJ)
	$(PATH)ld -o upper $(UPPEROBJ)
