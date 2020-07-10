# paramstest1.s - Listing command line parameters
.section .data
output1:
	.asciz "There are %d parameters: \n"
output2:
	.asciz "%s\n"
.section .text
	.globl _start
_start:
	nop
	movl (%esp), %ecx # pass parameters numbers
	pushl %ecx
	pushl $output1
	call printf
	addl $4, %esp	  # Restor pointer to parameter number
	popl %ecx		  # Restore parameters namber
	movl %esp, %ebp   # copy esp to ebp
	addl $4, %ebp     # mov 4 bits pointer to name of program
loop1:
	pushl %ecx
	pushl (%ebp)	  # Send to stack name of program
	pushl $output2
	call printf
	addl $8, %esp	  # Clean esp of number of parms and first param
	popl %ecx		  # Restore num params
	addl $4, %ebp     # mov next param 
	loop loop1

	push $0
	call exit
