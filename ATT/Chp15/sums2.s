	.file	"sums.c"
	.text
	.p2align 4,,15
	.globl	sums
	.type	sums, @function
sums:
.LFB24:
	.cfi_startproc
	movl	4(%esp), %ecx
	testl	%ecx, %ecx
	jle	.L4
	addl	$1, %ecx
	xorl	%eax, %eax
	movl	$1, %edx
	.p2align 4,,7
	.p2align 3
.L3:
	addl	%edx, %eax
	addl	$1, %edx
	cmpl	%ecx, %edx
	jne	.L3
	rep ret
.L4:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE24:
	.size	sums, .-sums
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Value: %d Sum: %d\n"
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
	movl	$55, 12(%esp)
	movl	$10, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
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
