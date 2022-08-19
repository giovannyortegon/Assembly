# two_points.s 
.section .data
.align 16
	x1: .int 5
	x2: .int 2
	y1: .int 4
	y2: .int 3
	fmt: .asciz "El resultado es: %d\n"
.section .bss
	.lcomm sum, 1
	.lcomm result, 1
.section .text
	.globl _start
_start:
	movl x1, %eax
	sbbl x2, %eax
	imul %eax, %eax

	movl y1, %ebx
	sbbl y2, %ebx
	imul %ebx, %ebx

	addl %ebx, %eax

	pushl %eax
	pushl $fmt
	call printf
	add $8, %esp

	movl $1, %eax
	movl $0, %ebx
	int $0x80
