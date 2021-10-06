/***** Use pre-indexed addr to move chars *****/
	.global _start
_start:
	ldr r1, =string		// get 1st string location
	ldr r3, =numbers	// get 2nd string location
	mov r2, #26			// chars in alphabet

_loop:
	ldrb r0, [r1, r2]	// get byte at r1 + r2
	strb r0, [r3, r2]	// save byte to r3 + r2
	subs r2, r2, #1		// decrement and flag set
	bpl _loop			// and loop while positive

_write:
	mov r0, #1
	ldr r1, =numbers
	mov r2, #26
	mov r7, #4
	swi 0

_exit:
	mov r7, #1
	mov r0, #0
	swi 0

	.data
string:
	.ascii "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
numbers:
	.ascii "01234567891011121314151617"
