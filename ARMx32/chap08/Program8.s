/* Program8.s - use the logical operators */
.text
	.global _start
_start:
	mov r0, #129
	and r0, r0, #1
	orr r0, r0, #2
	eor r0, r0, #255

	mov r7, #1
	swi 0
