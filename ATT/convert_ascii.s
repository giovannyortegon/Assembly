# convert_ascii.s - Converted this input data in ASCII
# constant of '0' in ascii
.equ ascii, 48
.section .data
	num:
		.int 5

.section .bss
		.lcomm number, 8

.section .text
	.globl _start
_start:
	nop
# convert number to string
	movl num, %eax
	addl $ascii, %eax

	movl %eax, number
# print number
	movl $4, %eax
	movl $1, %ebx
	movl $number, %ecx
	movl $8, %edx
	int $0x80
# exit program
	movl $1, %eax
	movl $0, %ebx
	int $0x80
