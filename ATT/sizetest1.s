# sizetest1.s - A simple program ti view the executable size
.section .text
.globl _start
_start:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
