	.file	"stack_structs.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "\12%d %s %s %d %d\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB17:
	.file 1 "./stack_structs.c"
	.loc 1 17 0
	.cfi_startproc
	push	rbp
	.seh_pushreg	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.cfi_def_cfa_register 6
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	.loc 1 17 0
	call	__main
.LVL0:
	.loc 1 21 0
	mov	ecx, 52
	call	malloc
	mov	QWORD PTR -8[rbp], rax
	.loc 1 23 0
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 1
	.loc 1 24 0
	mov	rax, QWORD PTR -8[rbp]
	add	rax, 4
	mov	DWORD PTR [rax], 1986814275
	mov	WORD PTR 4[rax], 28265
	mov	BYTE PTR 6[rax], 0
	.loc 1 25 0
	mov	rax, QWORD PTR -8[rbp]
	add	rax, 24
	movabs	rdx, 7596274526176948785
	mov	QWORD PTR [rax], rdx
	movabs	rdx, 5485494788694370158
	mov	QWORD PTR 8[rax], rdx
	mov	DWORD PTR 16[rax], 6647393
	.loc 1 26 0
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 44[rax], 12500
	.loc 1 27 0
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 48[rax], 1
	.loc 1 29 0
	mov	rax, QWORD PTR -8[rbp]
	mov	ecx, DWORD PTR 48[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR 44[rax]
	mov	rax, QWORD PTR -8[rbp]
	lea	r9, 24[rax]
	mov	rax, QWORD PTR -8[rbp]
	lea	r8, 4[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR 40[rsp], ecx
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	lea	rcx, .LC0[rip]
	call	printf
	.loc 1 31 0
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	free
	.loc 1 32 0
	mov	eax, 0
	.loc 1 33 0
	add	rsp, 64
	pop	rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.seh_endproc
.Letext0:
	.file 2 "C:/mingw/x86_64-w64-mingw32/include/stdlib.h"
	.file 3 "C:/mingw/x86_64-w64-mingw32/include/malloc.h"
	.file 4 "C:/mingw/x86_64-w64-mingw32/include/crtdefs.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0x3d3
	.word	0x4
	.secrel32	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.ascii "GNU C11 6.3.0 -masm=intel -mtune=core2 -march=nocona -g\0"
	.byte	0xc
	.ascii ".\\stack_structs.c\0"
	.ascii "C:\\Users\\Odiseo\\Documents\\Assembly\\nasm_Winx64\\Chap13\0"
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.secrel32	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x3
	.ascii "wchar_t\0"
	.byte	0x4
	.byte	0x62
	.long	0xe3
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x4
	.byte	0x8
	.long	0xa1
	.uleb128 0x4
	.byte	0x8
	.long	0xd4
	.uleb128 0x4
	.byte	0x8
	.long	0xf9
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "sizetype\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x5
	.ascii "__imp___mb_cur_max\0"
	.byte	0x2
	.byte	0x72
	.long	0x118
	.uleb128 0x6
	.long	0x10c
	.long	0x1ac
	.uleb128 0x7
	.long	0x12e
	.byte	0
	.byte	0
	.uleb128 0x5
	.ascii "_sys_errlist\0"
	.byte	0x2
	.byte	0xa4
	.long	0x19c
	.uleb128 0x5
	.ascii "_sys_nerr\0"
	.byte	0x2
	.byte	0xa5
	.long	0xf9
	.uleb128 0x5
	.ascii "__imp___argc\0"
	.byte	0x2
	.byte	0xb4
	.long	0x118
	.uleb128 0x5
	.ascii "__imp___argv\0"
	.byte	0x2
	.byte	0xbc
	.long	0x1f9
	.uleb128 0x4
	.byte	0x8
	.long	0x1ff
	.uleb128 0x4
	.byte	0x8
	.long	0x10c
	.uleb128 0x5
	.ascii "__imp___wargv\0"
	.byte	0x2
	.byte	0xc4
	.long	0x21a
	.uleb128 0x4
	.byte	0x8
	.long	0x220
	.uleb128 0x4
	.byte	0x8
	.long	0x112
	.uleb128 0x5
	.ascii "__imp__environ\0"
	.byte	0x2
	.byte	0xd0
	.long	0x1f9
	.uleb128 0x5
	.ascii "__imp__wenviron\0"
	.byte	0x2
	.byte	0xd9
	.long	0x21a
	.uleb128 0x5
	.ascii "__imp__pgmptr\0"
	.byte	0x2
	.byte	0xe2
	.long	0x1ff
	.uleb128 0x5
	.ascii "__imp__wpgmptr\0"
	.byte	0x2
	.byte	0xeb
	.long	0x220
	.uleb128 0x5
	.ascii "__imp__fmode\0"
	.byte	0x2
	.byte	0xf5
	.long	0x118
	.uleb128 0x8
	.ascii "__imp__osplatform\0"
	.byte	0x2
	.word	0x100
	.long	0x2ac
	.uleb128 0x4
	.byte	0x8
	.long	0x11e
	.uleb128 0x8
	.ascii "__imp__osver\0"
	.byte	0x2
	.word	0x109
	.long	0x2ac
	.uleb128 0x8
	.ascii "__imp__winver\0"
	.byte	0x2
	.word	0x112
	.long	0x2ac
	.uleb128 0x8
	.ascii "__imp__winmajor\0"
	.byte	0x2
	.word	0x11b
	.long	0x2ac
	.uleb128 0x8
	.ascii "__imp__winminor\0"
	.byte	0x2
	.word	0x124
	.long	0x2ac
	.uleb128 0x5
	.ascii "_amblksiz\0"
	.byte	0x3
	.byte	0x35
	.long	0x11e
	.uleb128 0x9
	.ascii "customer\0"
	.byte	0x34
	.byte	0x1
	.byte	0x7
	.long	0x37f
	.uleb128 0xa
	.ascii "c_id\0"
	.byte	0x1
	.byte	0x9
	.long	0xf9
	.byte	0
	.uleb128 0xa
	.ascii "c_name\0"
	.byte	0x1
	.byte	0xa
	.long	0x37f
	.byte	0x4
	.uleb128 0xa
	.ascii "c_address\0"
	.byte	0x1
	.byte	0xb
	.long	0x37f
	.byte	0x18
	.uleb128 0xa
	.ascii "c_balance\0"
	.byte	0x1
	.byte	0xc
	.long	0xf9
	.byte	0x2c
	.uleb128 0xa
	.ascii "c_rank\0"
	.byte	0x1
	.byte	0xd
	.long	0xf9
	.byte	0x30
	.byte	0
	.uleb128 0x6
	.long	0xa1
	.long	0x38f
	.uleb128 0x7
	.long	0x12e
	.byte	0x13
	.byte	0
	.uleb128 0x3
	.ascii "customers\0"
	.byte	0x1
	.byte	0xe
	.long	0x31e
	.uleb128 0xb
	.ascii "main\0"
	.byte	0x1
	.byte	0x10
	.long	0xf9
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x3d0
	.uleb128 0xc
	.ascii "c1\0"
	.byte	0x1
	.byte	0x13
	.long	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x38f
	.byte	0
	.section	.debug_abbrev,"dr"
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
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
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"dr"
	.long	0x2c
	.word	0x2
	.secrel32	.Ldebug_info0
	.byte	0x8
	.byte	0
	.word	0
	.word	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"dr"
.Ldebug_line0:
	.section	.debug_str,"dr"
	.ident	"GCC: (x86_64-posix-seh-rev1, Built by MinGW-W64 project) 6.3.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
