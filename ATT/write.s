# wrte.s - An example to learn toi write
.section .data
	output:
		.ascii "I use assembly GAS\n"

.section .text
	.globl _start
_start:
	movl $4, %eax
	movl $1, %ebx
	movl $output, %ecx
	movl $19, %edx
	int $0x80

	movl $1, %eax
	movl $0, %ebx
	int $0x80
