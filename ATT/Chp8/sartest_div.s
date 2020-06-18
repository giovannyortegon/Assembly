.section .data
value1:
	.int 25
.section .text
	.globl _start
_start:
	nop
	movl $20, %eax
	sarl %eax
	sarl value1

	movl $4, %eax
	movl $1, %ebx
	int $0x80
