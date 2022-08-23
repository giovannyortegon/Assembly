# main - uppercase
TOOLPATH = /usr/aarch64-linux-gnu/bin/
UPPEROBJS = main.o upper.o
ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif
LSTFLGS =

all: upper

%.o: %.s
	$(TOOLPATH)/as $(DEBUGFLGS) $(LSTFLGS) $< -o $@
upper: $(UPPEROBJS)
	$(TOOLPATH)/ld -o upper $(UPPEROBJS)

