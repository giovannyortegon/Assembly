	.global _start
_start:
	mov r0, #1

loop:
	add r0, r0, #1
	cmp r0, #50
	ble loop

_exit:
	mov r7, #1
	swi 0
