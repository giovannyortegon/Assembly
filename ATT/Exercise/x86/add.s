# declare_add.s
.section .data
	fm: .asciz "%d\n"
	a: .int 4
	b: .int 4
	c: .int 3, 4
.section .bss
	.lcomm result, 1
.section .text
	.globl _start
_start:
	xor %eax, %eax
	movb a, %al
	addb b, %al
	xor %edi, %edi
	addb c(, %edi, 4), %al
	inc %edi
	addb c(, %edi, 4), %al
#	movb %al, result

	pushl %eax
	pushl $fm
	call printf
	addl $8, %esp

	movb $1, %al
	movb $0, %bl
	int $0x80
