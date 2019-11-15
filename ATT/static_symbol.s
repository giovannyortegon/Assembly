# static_symbol.s - An Example of constant variable
.section .data
	output:
		.ascii "Hola\n"
.equ sys_write, 4
.equ fd_w, 1
.equ sys_exit, 1
.equ sys_call, 0x80
.section .text
	.globl _start

_start:
	movl $sys_write, %eax
	movl $fd_w, %ebx
	movl $output, %ecx
	movl $5, %edx
	int $sys_call

	movl $sys_exit, %eax
	movl $0, %ebx
	int $sys_call
