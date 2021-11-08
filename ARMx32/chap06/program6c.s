/* multiply two numbers r0 = r1 * r2 */
	.global _start
_start:
	mov r1, #20			@ r1 = 20
	mov r2, #5			@ r2 = 5
	mul r0, r1, r2		// r0 = r1 * r2

	mov r7, #1			@ exit through syscall
	swi 0
