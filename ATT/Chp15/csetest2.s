	.file	"csetest.c"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC0:
	.string	"The result are c = %d d = %d e= %d\n"
	.text
	.p2align 4,,15
	.globl	func1
	.type	func1, @function
func1:
.LFB24:
	.cfi_startproc
	subl	$44, %esp
	.cfi_def_cfa_offset 48
	movl	$500, %eax
	movl	52(%esp), %ecx
	cltd
	imull	48(%esp), %ecx
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	idivl	%ecx
	movl	$1717986919, %edx
	movl	%ecx, 8(%esp)
	movl	%eax, 16(%esp)
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	%edx
	subl	%eax, %edx
	movl	%edx, 12(%esp)
	call	__printf_chk
	addl	$44, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE24:
	.size	func1, .-func1
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	movl	$25, 4(%esp)
	movl	$10, (%esp)
	call	func1
	movl	$10, 4(%esp)
	movl	$20, (%esp)
	call	func1
	xorl	%eax, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
