.section .data
	fm: .asciz "%d\n"
	a: .int 1
	b: .int 4
	c: .int 2
.section .bss
.section .text
	.globl main
main:
	mov a, %rax
	add b, %rax
	sbb c, %rax

	mov $fm, %rdi
	mov %rax, %rsi
	xor %rax, %rax
	call printf

	mov $60, %rax
	mov $1, %rdi
	syscall
