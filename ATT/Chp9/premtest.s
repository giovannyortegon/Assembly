# premtest.s - An example of using the FPREM1 instruction
.section .data
value1:
	.float 20.65
value2:
	.float 3.97
.section .bss
	.lcomm result, 4
.section .text
	.globl _start
_start:
	nop
	finit
	flds value2
	flds value1
loop:
	fprem1
	fstsw %ax
	testb $4, %ah
	jnz loop

	fsts result

	mov $1, %eax
	mov $0, %ebx
	int $0x80
