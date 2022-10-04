	.global _start
_start:
	mov r0, #100	@ arbitrary values in R0 & R1
	mov r1, #20

loop:
	cmp r0, r1				// Are they the same: Z=1?
	subgt r0, r0, r1		// sub R1 from R0 if  great than
	sublt r1, r1, r0		// else sub R0 from R1 as less
	bne loop				// branch is not equal

_exit:
	mov r7, #1
	swi 0
