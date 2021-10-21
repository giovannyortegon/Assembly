	.global _start
_start:
	mov r0, #50

loop:
	subs r0, r0, #1
	bne loop

_exit:
	mov r7, #1
	swi 0
