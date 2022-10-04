	.file	"changedtest.c"
	.text
	.section	.rodata
.LC0:
	.string	"The result is %d\n"
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
	movl	$10, -4(%rbp)
	movl	$20, -8(%rbp)
	movl	-4(%rbp), %ecx
	movl	-8(%rbp), %eax
	movl	%eax, %edx
#APP
# 10 "changedtest.c" 1
	movl %ecx, %eax
	addl %eax, %edx
# 0 "" 2
#NO_APP
	movl	%edx, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
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
