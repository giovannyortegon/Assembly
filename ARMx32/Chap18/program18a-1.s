/* Use of byte and equ to sum a set of numbers */
	.global	_start
_start:
	ldr r1, =values
	ldr r2, =endvalues
	mov r0, #0

_loop:
	ldrb r3, [r1], #increment
	add r0, r0, r3
	cmp r1, r2
	bne _loop

_exit:
	mov r7, #1
	swi 0
		
	.data
.equ increment, 1
values:
	.byte 1, 2, 3, 4, 5, 6, 7, 8, 9
endvalues:
