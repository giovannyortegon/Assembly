# fibonacci.s
.section .data
	msg: .asciz "%d "
	
.section .text
	.globl _start
_start:

	movl $1, %eax
	movl $0, %ebx
	movl $0, %ecx
	movl $0, %edx
	
	pushl %eax
	pushl %ebx

	movl %eax, %ebx

	push %ebx
	pushl $msg
	call printf
	addl $8, %esp

	pop %ebx
	pop %eax
L2:
	cmpl $20, %edx
	jl L1
	jmp end

L1:
	pushl %edx
	addl %eax, %ebx
	pushl %eax

	pushl %ebx
	pushl $msg
	call printf
	addl $8, %esp

	popl %eax
	movl %ebx, %ecx
	movl %eax, %ebx
	movl %ecx, %eax

	popl %edx
	incl %edx
	jmp L2

end:
	pushl $0
	call exit
