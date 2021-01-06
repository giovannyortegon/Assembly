	.file	"sincostest.c"
	.text
	.section	.rodata
	.align 8
.LC3:
	.string	"The cosine is %f, and the sine is %f\n"
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
	subq	$32, %rsp
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, -4(%rbp)
	movss	-4(%rbp), %xmm0
	movss	.LC1(%rip), %xmm1
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm1
	movsd	.LC2(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -8(%rbp)
	movss	-8(%rbp), %xmm0
	movss	%xmm0, -20(%rbp)
	flds	-20(%rbp)
#APP
# 12 "sincostest.c" 1
	fsincos
# 0 "" 2
#NO_APP
	fstps	-12(%rbp)
	fstps	-16(%rbp)
	cvtss2sd	-16(%rbp), %xmm1
	cvtss2sd	-12(%rbp), %xmm0
	leaq	.LC3(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1119092736
	.align 4
.LC1:
	.long	1127481344
	.align 8
.LC2:
	.long	603906762
	.long	1074340307
	.ident	"GCC: (Debian 9.3.0-14) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
