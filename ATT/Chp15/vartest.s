	.file	"vartest.c"
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
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	movl	$100, 16(%esp)
	movl	.LC0, %eax
	movl	%eax, 20(%esp)
	movl	global1, %edx
	movl	16(%esp), %eax
	addl	%edx, %eax
	movl	%eax, 24(%esp)
	flds	global2
	fadds	20(%esp)
	fstps	28(%esp)
	flds	28(%esp)
	fstpl	8(%esp)
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1128808448
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
