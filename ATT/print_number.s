# print_number - An example to MOV from to register to memory
.section .data
	val1:
		.int 3
	val2:
		.int 4
	res:
		.asciz "La suma es: %d\n"

.section .text
	.globl _start

_start:
	movl val1, %eax
	addl val2, %eax
	pushl %eax
	pushl $res
	call printf

	pushl $0
	call exit
