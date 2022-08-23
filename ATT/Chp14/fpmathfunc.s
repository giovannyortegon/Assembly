# fpmathfunc.s - An example of reading multiple input values
# to solve the mathematical expression:
# ((43.65 / 22) + (76.34 * 3.1)) / ((12.43 * 6) – (140.2 / 94.21))
.section .text
.type fpmathfunc, @function
	.globl fpmathfunc
fpmathfunc:
	pushl %ebp
	movl %esp, %ebp
	flds 8(%ebp)
	fidiv 12(%ebp)
	flds 16(%ebp)
	flds 20(%ebp)
	fmul %st(1), %st(0)
	fadd %st(2), %st(0)
	flds 24(%ebp)
	fimul 28(%ebp)
	flds 32(%ebp)
	flds 36(%ebp)
	fdivrp
	fsubr %st(1), %st(0)
	fdivr %st(2), %st(0)
	movl %ebp, %esp
	popl %ebp
	ret
