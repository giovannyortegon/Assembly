/* perform R0 =  R1 + R2 */
	.global _start
_start:
	mov r1, #50			@ Get 50 into r1
	mov r2, #60			@ Get 60 into r2
	adds r0, r1, r2		@ Add the two, resutl

	mov r7, #1			@ exit through syscall
	swi 0
