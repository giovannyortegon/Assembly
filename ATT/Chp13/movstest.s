	.file	"movstest.c"
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
	subq	$64, %rsp
	movabsq	$2338328219631577172, %rax
	movabsq	$7863412988361056353, %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movabsq	$733635283998962533, %rax
	movq	%rax, -16(%rbp)
	movb	$0, -8(%rbp)
	movl	$25, -4(%rbp)
	leaq	-32(%rbp), %rax
	leaq	-64(%rbp), %rdx
	movl	-4(%rbp), %ecx
	movq	%rax, %rsi
	movq	%rdx, %rdi
#APP
# 10 "movstest.c" 1
	cld
	rep movsb
# 0 "" 2
#NO_APP
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 9.3.0-14) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
