# average.s
.section .data
	fmt: .asciz "el promedio es: %d\n"
	n1: .int 4
	n2: .int 5
	n3: .int 5
	n4: .int 3
	n: .int 4
	quotient: .float 0
.section .bss
.section .text
	.globl _start
_start:
	mov n1, %eax
	addl n2, %eax
	addl n3, %eax
	addl n4, %eax
	movl $0, %edx
	divl n
	movl %eax, quotient

	pushl quotient
	pushl $fmt
	call printf
	add $8, %esp

	pushl $0
	call exit
