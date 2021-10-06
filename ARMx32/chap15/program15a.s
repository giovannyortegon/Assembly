/*** using ADR directive ***/
	.global _start
_start:
	adr r0, value
	mov r1, #15

_exit:
	mov r7, #1
	swi 0

value:
	.word 255
