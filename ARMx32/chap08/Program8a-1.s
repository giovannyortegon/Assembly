/* Program8a-1.s - Use of Bit clear */
	.global _start
_start:
	mov r0, #0xffffffff
	bic r0, r0, #0xf		@ clear low 4 bits of r0

_exit:
	mov r7, #1
	swi 0
