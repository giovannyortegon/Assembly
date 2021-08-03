	.global _start
_start:
	mov r1	, #17
	movs r0, r1, lsl #1
	movs r0, r0, lsr #1

_exit:
	mov r7, #1
	swi 0
