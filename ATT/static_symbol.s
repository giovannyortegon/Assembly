# static_symbol.s - An Example of constant variable
.section .data
	output:
		.ascii "Hola\n"
	num:
		.int 8
.equ sys_write, 4
.equ fd_w, 1
.equ sys_exit, 1
.equ sys_call, 0x80
.section .text
	.globl _start

_start:
	movl num, %eax
	movl $4, num
	movl %eax, num

	movl $sys_write, %eax
	movl $fd_w, %ebx
	movl $num, %ecx
	int $sys_call

	movl $sys_exit, %eax
	movl $0, %ebx
	int $sys_call
