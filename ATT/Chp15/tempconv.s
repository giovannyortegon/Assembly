	.file	"tempconv.c"
	.text
	.globl	convert
	.type	convert, @function
convert:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$28, %esp
	movl	8(%ebp), %eax
	subl	$32, %eax
	movl	%eax, -24(%ebp)
	fildl	-24(%ebp)
	fldl	.LC0
	fdivrp	%st, %st(1)
	fstps	-4(%ebp)
	movl	-4(%ebp), %eax
	movl	%eax, -28(%ebp)
	flds	-28(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	convert, .-convert
	.section	.rodata
.LC2:
	.string	"\tTemperature Conversion Chart"
.LC3:
	.string	"Fahrenheit\t\tCelsius"
.LC4:
	.string	"\t%d\t\t%5.2f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	movl	$0, 24(%esp)
	movl	$.LC2, (%esp)
	call	puts
	movl	$.LC3, (%esp)
	call	puts
	movl	$0, 24(%esp)
	jmp	.L4
.L5:
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	call	convert
	fstps	28(%esp)
	flds	28(%esp)
	fstpl	8(%esp)
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC4, (%esp)
	call	printf
	addl	$10, 24(%esp)
.L4:
	cmpl	$229, 24(%esp)
	jle	.L5
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	-858993459
	.long	1073532108
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
