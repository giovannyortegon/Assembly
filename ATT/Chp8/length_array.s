# lngth_array.s - An example to count elements of an array
.section .data
array:
	.int 3, 4, 5, 1, 6
size = . - array
len = (. - array) / 4  # Length array
.section .bss
	.lcomm num, 4
.section .text
	.globl _start
_start:
	nop
	movl $0, %edi
	movl $4, %edx

L1:
	movl array(, %edi, 4), %ecx
	movl %ecx, %edx
	pushl %ecx
	addl $'0', %edx
	movl %edx, num

	movl $4, %eax
	movl $1, %ebx
	movl $num, %ecx
	movl $4, %edx
	int $0x80

	popl %ecx
	addl $8, %esp
	inc %edi
	cmpl $len, %edi
	jne L1

	movl $1, %eax
	movl $0, %ebx
	int $0x80
