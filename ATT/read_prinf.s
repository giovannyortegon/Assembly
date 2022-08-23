# read_printf - An example to how to read and prinf with printf of C
.section .data
	msg1:
		.ascii "Enter a number: "
	msg2:
		.ascii "You entry: "

.section .bss
	.lcomm num, 2

.section .text
	.globl _start
_start:
	movl $4, %eax
	movl $1, %ebx
	movl $msg1, %ecx
	movl $16, %edx
	int $0x80

	movl $3, %eax
	movl $0, %ebx
	movl $num, %ecx
	movl $2, %edx
	int $0x80

	pushl $msg2
	call printf

	pushl $num
	call printf
	
	pushl $0
	call exit
