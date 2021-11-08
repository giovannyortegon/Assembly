# replace_in_memory.s
.section .data
	string1:
		.ascii "amazing\n"
	string2:
		.ascii "incredible\n"
.section .bss
	.lcomm buffer, 40
.section .text
	.globl _start
_start:
	leal string1, %esi
	leal buffer, %edi
	movl $8, %ecx
	cld
	repz movsb

	xor %esi, %esi
	xor %edi, %edi
	xor %ecx, %ecx

	leal string2, %esi
	leal buffer, %edi
	movl $11, %ecx
	cld
	repz movsb

	movl $1, %eax
	movl $0, %ebx
	int $0x80
