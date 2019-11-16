# movtest4.s - An example of indirection addressing
.section .data
values:
	.int 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60
.section .text
.globl _start
_start:
	nop
	movl values, %eax
	movl $values, %edi
	movl $100, 8(%edi)
	movl $1, %edi
	movl values (, %edi, 8), %ebx
	movl $1, %eax
	int $0x80
