# hello_world.s - Stupid Program
.section .bss
.equ sys_write,  4
.equ fd_w,		 1
.equ sys_exit,	 1
.equ linux_int, 0x80
.section .data
msg:
	.ascii "Hello World\n"
.section .text
	.globl _start
_start:
	movl $sys_write, %eax
	movl $fd_w, %ebx
	movl $msg, %ecx
	movl $12, %edx
	int $linux_int

	movl $sys_exit, %eax
	movl $0, %ebx
	int $linux_int
