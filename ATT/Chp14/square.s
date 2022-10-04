# square.s - An example of a function that returns a integer value
.type square, @function
	.globl square
square:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %eax
	imull %eax, %eax
	movl %ebp, %esp
	popl %ebp
	ret
