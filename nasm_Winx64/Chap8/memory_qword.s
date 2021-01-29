	.file	"memory_qword.c"
	.intel_syntax noprefix
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "data: %ld\12\0"
.LC1:
	.ascii "sum: %ld\12\0"
	.section	.text.startup,"x"
	.p2align 4,,15
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	xor	ebx, ebx
	call	__main
	mov	eax, 64
	movabs	rdx, -81985529216486896
	.p2align 4,,10
.L2:
	mov	rcx, rdx
	sar	rdx
	and	ecx, 1
	add	rbx, rcx
	sub	eax, 1
	jne	.L2
	lea	rcx, .LC0[rip]
	call	printf
	lea	rcx, .LC1[rip]
	mov	rdx, rbx
	call	printf
	xor	eax, eax
	add	rsp, 32
	pop	rbx
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh-rev1, Built by MinGW-W64 project) 6.3.0"
	.def	printf;	.scl	2;	.type	32;	.endef
