# call_function.s - An routine of function
function_label:
	pushl %ebp
	movl %esp, %ebp
	< normal function code goes here >
	movl %ebp, %esp
	popl %ebp
	ret
