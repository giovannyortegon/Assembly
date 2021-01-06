# cmpstest2.s - An example of using the REPE CMPS instruction
.section .data
value1:
	.ascii "This is a test of the CMPS intructions"
value2:
	.ascii "This is a test of The CMPS intructions"
.section .text
	.globl _start
_start:
	nop
	movl $1, %eax
	lea value1, %esi
	leal value2, %edi
	movl $39, %ecx
	cld
	repe cmpsb
	je equal
	movl %ecx, %ebx
	int $0x80
equal:
	movl $0, %ebx
	int $0x80
