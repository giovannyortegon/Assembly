# read.s - An example to how to read form user
.section .data
	msg1:	
		.ascii "Enter number: "
	msg2:
		.ascii "You entry: "
.section .bss
	.lcomm number, 2

.section .text
	.globl _start
_start:
# print message 1
	movl $4, %eax
	movl $1, %ebx
	movl $msg1, %ecx
	movl $14, %edx
	int $0x80
# get number
	movl $3, %eax
	movl $0, %ebx
	movl $number, %ecx
	movl $2, %edx
	int $0x80
# print message 2
	movl $4, %eax
	movl $1, %ebx
	movl $msg2, %ecx
	movl $11, %edx
	int $0x80

# print number
	movl $4, %eax
	movl $1, %ebx
	movl $number, %ecx
	movl $2, %edx
	int $0x80

# exit
	movl $1, %eax
	movl $0, %ebx
	int $0x80
