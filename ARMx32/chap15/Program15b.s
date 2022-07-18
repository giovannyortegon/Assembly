/**** Use pre-indexed addr to move chars ****/
/* */
	.global _start
_start:
	LDR R1, =string		@ Get 1st string location
	LDR R3, =numbers	@ Get 2nd string location
	MOV R2, #26			@ chars in alphabet
_loop:
	LDRB R0, [R1, R2]
	STRB R0, [R3, R2]
	SUBS R2, R2, #1
	BPL _loop
_write:
	MOV R0, #1			@ get byte at R1+R2
	LDR R1, =numbers	@ save byte to R3+R2
	MOV R2, #26			@ decrement and flag set
	MOV R7, #4			@ and loop while positive
	SWI 0
_exit:
	MOV R7, #1
	SWI 0
.data
string:
	.ascii "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
numbers:
	.ascii "01234567891011121314151617"
