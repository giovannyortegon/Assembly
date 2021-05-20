# Install on Debian

``
$ sudo apt update -y && sudo apt upgrade -y

$ sudo apt install qemu-user \
                   qemu-user-static \
                   gcc-aarch64-linux-gnu \
                   g++-aarch64-linux-gnu \
                   binutils-aarch64-linux-gnu \
                   binutils-aarch64-linux-gnu-dbg
                   build-essential

$ sudo apt install gdb-multiarch
``

# Install on Arch
``
$ sudo pacman -Syyu

$ sudo pacman -S qemu aarch64-linux-gnu-binutils aarch64-linux-gnu-gcc aarch64-linux-gnu-gdb
``

# Compile

## Using Makefile

``
TOOLPATH=/usr/aarch64-linux-gnu/bin/

OBJS = name_program.o

ifdef DEBUG

	DEBUGFLGS = -ggdb3

else

	DEBUGFLGS =

endif

%.o : %.s

	$(TOOLPATH)/as $(DEBUGFLGS) $< -o $@

main: $(OBJS)

	$(TOOLPATH)/ld $(OBJS) -o main

make DEBUG=1
``

# Compile, link and debug

## Compile

### Assemble

``
$ /usr/aarch64-linux-gnu/bin/as -g program.s -o obj.o
``

### Link

``
$ /usr/aarch64-linux-gnu/bin/ld obj.o -o main
``

# Debug

### First Terminal on Debian or Arch

``
$ qemu-aarch64 -L /usr/aarch64-linux-gnu -g 1234 ./main
``

### Second Terminal on Debian
``
$ gdb-multiarch -q --nh -ex 'set architecture arm64' -ex 'file main' -ex 'target remote :1234' -ex 'layout split' -ex 'layout regs'
``

### Second Terminal on Arch

``
$ aarch64-linux-gnu-gdb -q --nh -ex 'set architecture arm64' -ex 'file main' -ex 'target remote :1234' -ex 'layout split' -ex 'layout regs'
``

``
(gdb) break _start
``

``
(gdb) next
``
