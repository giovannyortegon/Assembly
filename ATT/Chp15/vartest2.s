	.file	"vartest.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"The result are %d and %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	movl	global1, %eax
	flds	.LC0
	fadds	global2
	movl	$.LC1, 4(%esp)
	addl	$100, %eax
	movl	%eax, 8(%esp)
	movl	$1, (%esp)
	fstpl	12(%esp)
	call	__printf_chk
	xorl	%eax, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.globl	global2
	.data
	.align 4
	.type	global2, @object
	.size	global2, 4
global2:
	.long	1101135872
	.globl	global1
	.align 4
	.type	global1, @object
	.size	global1, 4
global1:
	.long	10
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1128808448
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
