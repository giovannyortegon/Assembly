# Emulate ARM x32 program
## Install
``
$ sudo apt-get install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf

``
## Install qemu emulator
``
$ sudo apt install qemu-user qemu-user-static build-essential
``
## Install debugger ARM x32
``
$ sudo apt install gdb-multiarch
``
## Assemble, Link Program and Debug
``
$ arm-linux-gnueabihf-as -g name_program -o obj.o
``
``
$ arm-linux-gnueabihf-ld obj.o -o main
``
## Debug
Open 2 Terminals
### Terminal 1

Create a gdb server with port 1234

``
$ qemu-arm -g 1234 ./main
``

Connecto with port 1234

### Terminal 2

Start gdb

``
$ gdb-multiarch -q --nh -ex 'set architecture arm' -ex 'file main' -ex 'target remote :1234' -ex 'layout split' -ex 'layout regs'
``
``
(gdb) break _start
(gdb) next
``
