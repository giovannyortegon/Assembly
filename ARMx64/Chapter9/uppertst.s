	.arch armv8-a
	.file	"uppertst.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"This is a test."
	.align	3
.LC1:
	.string	"Before str: %s\n"
	.align	3
.LC2:
	.string	"After str: %s\n"
	.align	3
.LC3:
	.string	"Str len: %d\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -288]!
	.cfi_def_cfa_offset 288
	.cfi_offset 29, -288
	.cfi_offset 30, -280
	mov	x29, sp
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	str	x0, [sp, 280]
	add	x0, sp, 16
	mov	x1, x0
	ldr	x0, [sp, 280]
	bl	mytoupper
	str	w0, [sp, 276]
	ldr	x1, [sp, 280]
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	add	x0, sp, 16
	mov	x1, x0
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
	ldr	w1, [sp, 276]
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 288
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 11.2.0-9) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
