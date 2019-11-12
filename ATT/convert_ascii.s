# convert_ascii.s - Converted this input data in ASCII
.section .data
	msg:
		.ascii "The sum is: \n",

	num:
		.int 1

.section .text
	.globl _start
_start:
	movl $4, %eax
	movl $3, num

	xadd %eax, num
	

	movl $4, %eax
	movl $1, %ebx
	movl $msg, %ecx
	movl $12, %edx
	int $0x80

	movl $4, %eax
	movl $1, %ebx
	movl num, %ecx
	movl $1, %edx
	int $0x80

	movl $1, %eax
	movl $0, %ebx
	int $0x80
