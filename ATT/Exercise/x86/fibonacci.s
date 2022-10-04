# fibonacci.s
.section .data
	msg: .asciz "%d "
	buf: .int 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.section .bss
	.lcomm buffer, 20
.section .text
	.globl _start
_start:

	movl $1, %eax
	movl $0, %ebx
	movl $0, %ecx
	movl $0, %edx
	movl $0, %edi
	
	pushl %eax
	pushl %ebx

	movl %eax, %ebx

	movl %ebx, buffer(, %edi, 4)
	movl %ebx, buf(, %edi, 4)
#	pushl %edi

	push %ebx
	pushl $msg
	call printf
	addl $8, %esp

#	pop %edi
	pop %ebx
	pop %eax

	inc %edi
L2:
	cmpl $10, %edx
	jl L1
	jmp end

L1:
	pushl %edx
	addl %eax, %ebx
	pushl %eax
	
	movl %ebx, buffer(, %edi, 4)
	movl %ebx, buf(, %edi, 4)
#	pushl %edi

	pushl %ebx
	pushl $msg
	call printf
	addl $8, %esp
	
#	popl %edi
	popl %eax
	movl %ebx, %ecx
	movl %eax, %ebx
	movl %ecx, %eax

	popl %edx
	inc %edx
	inc %edi
	jmp L2

end:
	pushl $0
	call exit
