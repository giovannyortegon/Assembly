	.file	"areatest.c"
	.text
	.section	.rodata
.LC0:
	.string	"The result is %f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$10, -8(%rbp)
#APP
# 9 "areatest.c" 1
	fild -8(%rbp)
	fimul -8(%rbp)
	fldpi 
	fmul %st(1), %st(0)
# 0 "" 2
#NO_APP
	fstps	-4(%rbp)
	cvtss2sd	-4(%rbp), %xmm0
	leaq	.LC0(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 9.3.0-14) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
