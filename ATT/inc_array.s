# inc_array - An example to increment each element of an array
.section .data
	output:
		.asciz "%d\n"
	array:
		.int 0, 1, 2, 3, 4, 5
.section .text
	.globl _start
_start:
	movl $0, %edi

loop:
	movl array(, %edi, 4), %eax
	inc %eax
	pushl %eax
	pushl $output
	call printf
	addl $8, %esp
	inc %edi
	cmpl $6, %edi
	jne loop
	movl $1, %eax
	movl $0, %ebx
	int $0x80
