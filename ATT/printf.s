# printf.s - An example of how to use printf of c
.section .data
	output:
		.ascii "I use prinf of C language\n"
.section .text
	.globl _start
_start:
	pushl $output
	call printf

	pushl $0
	call exit
