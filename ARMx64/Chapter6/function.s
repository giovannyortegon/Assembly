	.arch armv8-a
	.file	"function.c"
	.text
.Ltext0:
	.section	.rodata
	.align	3
.LC0:
	.string	"The result: %d"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.file 1 "function.c"
	.loc 1 7 1
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	.loc 1 10 4
	mov	w0, 9
	str	w0, [sp, 28]
	.loc 1 11 4
	mov	w0, 1
	str	w0, [sp, 24]
	.loc 1 13 8
	ldr	w1, [sp, 24]
	ldr	w0, [sp, 28]
	bl	func1
	str	w0, [sp, 20]
	.loc 1 14 2
	ldr	w1, [sp, 20]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	.loc 1 16 9
	mov	w0, 0
	.loc 1 17 1
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.global	func1
	.type	func1, %function
func1:
.LFB1:
	.loc 1 19 1
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	str	w1, [sp, 24]
	.loc 1 20 6
	ldr	w1, [sp, 24]
	ldr	w0, [sp, 28]
	bl	func2
	str	w0, [sp, 28]
	.loc 1 22 12
	ldr	w1, [sp, 28]
	ldr	w0, [sp, 24]
	add	w0, w1, w0
	.loc 1 23 1
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	func1, .-func1
	.align	2
	.global	func2
	.type	func2, %function
func2:
.LFB2:
	.loc 1 25 1
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, 12]
	str	w1, [sp, 8]
	.loc 1 26 12
	ldr	w1, [sp, 12]
	ldr	w0, [sp, 8]
	sub	w0, w1, w0
	.loc 1 27 1
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	func2, .-func2
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x12b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF10
	.byte	0xc
	.4byte	.LASF11
	.4byte	.LASF12
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x1
	.byte	0x18
	.byte	0x5
	.4byte	0x34
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa9
	.uleb128 0x5
	.string	"a"
	.byte	0x1
	.byte	0x18
	.byte	0xf
	.4byte	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x5
	.string	"b"
	.byte	0x1
	.byte	0x18
	.byte	0x16
	.4byte	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x6
	.4byte	.LASF9
	.byte	0x1
	.byte	0x12
	.byte	0x5
	.4byte	0x34
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe6
	.uleb128 0x5
	.string	"a"
	.byte	0x1
	.byte	0x12
	.byte	0xf
	.4byte	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x5
	.string	"b"
	.byte	0x1
	.byte	0x12
	.byte	0x16
	.4byte	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x1
	.byte	0x6
	.byte	0x5
	.4byte	0x34
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.string	"a"
	.byte	0x1
	.byte	0x8
	.byte	0x6
	.4byte	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x8
	.string	"b"
	.byte	0x1
	.byte	0x8
	.byte	0x9
	.4byte	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x8
	.string	"sum"
	.byte	0x1
	.byte	0x8
	.byte	0xc
	.4byte	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF3:
	.string	"unsigned int"
.LASF10:
	.string	"GNU C17 10.2.1 20210110 -mlittle-endian -mabi=lp64 -g -fasynchronous-unwind-tables"
.LASF9:
	.string	"func1"
.LASF8:
	.string	"func2"
.LASF0:
	.string	"long unsigned int"
.LASF11:
	.string	"function.c"
.LASF1:
	.string	"unsigned char"
.LASF13:
	.string	"main"
.LASF6:
	.string	"long int"
.LASF2:
	.string	"short unsigned int"
.LASF4:
	.string	"signed char"
.LASF12:
	.string	"/home/skill/Documents/Assembly/ARMx64/Chapter6"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"char"
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
