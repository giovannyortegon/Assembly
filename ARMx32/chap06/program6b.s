/* Add two 64 bits numbers together  */
	.global _start
_start:
	mov r2, #0xffffffff		@ low half number 1
	mov r3, #0x1			@ high half number 1
	mov r4, #0xffffffff		@ low half number 2
	mov r5, #0xff			@ high half number 2
	adds r0, r2, r4			// add low and set flags
	adcs r1, r3, r5			// add hi with carry

	mov r7, #1				@ exit through syscall
	swi 0
