/* multiply two numbers with accumulate */
	.global _start
_start:
	mov r1, #20			@ r1 = 20
	mov r2, #5			@ r2 = 5
	mov r3, #10			@ r3 = 10
	mla r0, r1, r2, r3	@ r0 = (r1 * r2) + r3

	mov r7, #1			@ exit through syscall
	swi 0
