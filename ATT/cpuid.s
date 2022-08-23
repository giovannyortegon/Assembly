# cpuid.ss Sample program to extract the processor Vendor ID
.section .data
output:
	.ascii "The processor vendor ID is 'xxxxxxxxxxxx'\n"
.section .text
.globl _start	# compile with as 
_start:
#.globl main    ; compile with gcc
#main:
	nop
	movl $0, %eax		# call values CPUID
	cpuid 
	movl $output, %edi	# File description
	movl %ebx, 28(%edi)	# Contein start of the string
	movl %edx, 32(%edi)	# length of the string
	movl %ecx, 36(%edi)
	movl $4, %eax		# sys_write to show
	movl $1, %ebx		# standard STDOUT
	movl $output, %ecx
	movl $42, %edx		# length string
	int $0x80		# Call Kernel System

	movl $1, %eax		# exit function
	movl $0, %ebx		# executed successfully
	int $0x80		# Call Kernel system
