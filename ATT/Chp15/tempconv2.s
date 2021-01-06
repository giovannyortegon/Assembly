	.file	"tempconv.c"
	.text
	.p2align 4,,15
	.globl	convert
	.type	convert, @function
convert:
.LFB24:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	16(%esp), %eax
	subl	$32, %eax
	movl	%eax, (%esp)
	fildl	(%esp)
	fdivl	.LC0
	fstps	4(%esp)
	flds	4(%esp)
	addl	$12, %esp
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE24:
	.size	convert, .-convert
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"\tTemperature Conversion Chart"
.LC3:
	.string	"Fahrenheit\t\tCelsius"
.LC4:
	.string	"\t%d\t\t%5.2f\n"
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
	pushl	%ebx
	.cfi_offset 3, -12
	xorl	%ebx, %ebx
	andl	$-16, %esp
	subl	$32, %esp
	movl	$.LC2, (%esp)
	call	puts
	movl	$.LC3, (%esp)
	call	puts
	.p2align 4,,7
	.p2align 3
.L5:
	leal	-32(%ebx), %eax
	movl	%eax, 24(%esp)
	fildl	24(%esp)
	fdivl	.LC0
	movl	%ebx, 8(%esp)
	addl	$10, %ebx
	movl	$.LC4, 4(%esp)
	movl	$1, (%esp)
	fstps	28(%esp)
	flds	28(%esp)
	fstpl	12(%esp)
	call	__printf_chk
	cmpl	$230, %ebx
	jne	.L5
	xorl	%eax, %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	-858993459
	.long	1073532108
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
