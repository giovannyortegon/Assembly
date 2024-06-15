# NASM EXERCISES

## Add 32 bits architecture
``
$ sudo dpkg --add-architecture i386
``

now

## Update and intall 32 bits packages

``
$ sudo apt-get update
$ sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386
``

## Command Compile

with __start plus c

``
$ nasm -f elf <file.asm
``

with main

``
$ gcc -m32 -g -o file file.o
``

``
$ ld -m elf_i386 -s -o <name execute> <object file .o>
``

only 32bits assembly

``
$ nasm -f elf -F dwarf -g file.asm
``

``
$ ld -m elf_i386 -o file file.o
``

