TOOLPATH = /usr/aarch64-linux-gnu/bin/
UPPEROBJS = mainlower.o lowermacro.o

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif
LSTFLGS =

all: mainlower

%.o : %.s
	$(TOOLPATH)as $(DEBUGFLGS) $(LSTFLGS) $< -o $@
mainlower: $(UPPEROBJS)
	$(TOOLPATH)ld -o mainlower $(UPPEROBJS)
