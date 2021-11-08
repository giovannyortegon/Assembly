/* use post indexed addr to concat strings */
	.global _start
_start:
	ldr r2, =string1		// load locations
	ldr r3, =string2		// of both strings

_loop:
	ldrb r0, [r3], #1		// Get string2 byte & + 1
	cmp r0, #0				// is it end of string?
	bne _loop				// no, then get next byte
	sub r3, r3, #1			// Yes, decrement back 1

_copyloop:
	ldrb r0, [r2], #1		// get byte from string 1
	strb r0, [r3], #1		// add to end of string 2
	cmp r0, #0				// is it 0?
	bne _copyloop			// if not get next char

_write:
	mov r0, #1				// is 0 so print new
	ldr r1, =string2
	mov r2, #24
	mov r7, #4
	swi 0

_exit:
	mov r7, #1
	swi 0

	.data
string1:
	.asciz "ABCDEFGHIJKL"
string2:
	.asciz "012345678910"
padding:
	.ascii "            "
