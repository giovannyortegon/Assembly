# mul_to_array.s
.section .data
	arr1: .int 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	arr2: .int 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
	arr_res: .int 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.section .text
	.globl _start
_start:
	movl $0, %edi
loop:
	movl arr1(, %edi, 4), %eax
	movl arr2(, %edi, 4), %ebx

	mull %ebx

	movl %eax, arr_res(, %edi, 4)
	inc %edi
	cmpl $10, %edi
	jne loop

	movl $1, %eax
	movl $0, %ebx
	int $0x80
