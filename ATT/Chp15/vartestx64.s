	.file	"vartest.c"
	.text
	.globl	global1
	.data
	.align 4
	.type	global1, @object
	.size	global1, 4
global1:
	.long	10
	.globl	global2
	.align 4
	.type	global2, @object
	.size	global2, 4
global2:
	.long	1101135872
	.section	.rodata
.LC1:
	.string	"The result are %d and %f\n"
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
	movl	$100, -4(%rbp)
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, -8(%rbp)
	movl	global1(%rip), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -12(%rbp)
	movss	global2(%rip), %xmm0
	movss	-8(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -16(%rbp)
	pxor	%xmm2, %xmm2
	cvtss2sd	-16(%rbp), %xmm2
	movq	%xmm2, %rdx
	movl	-12(%rbp), %eax
	movq	%rdx, %xmm0
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$1, %eax
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
	.long	1128808448
	.ident	"GCC: (Debian 10.1.0-6) 10.1.0"
	.section	.note.GNU-stack,"",@progbits
