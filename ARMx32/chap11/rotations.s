	.global _start
_start:
	mov r1, #0xF000000F
	movs r0, r1, ROR #4
	movs r0, r0, ROR #8

_exit:
	mov r7, #1
	swi 0
