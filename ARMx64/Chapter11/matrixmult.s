/*
 * Multiply 2 3x3 integer matrices
 *
 * Registers:
 *		w1 - Row index
 *		w2 - Column index
 *		x4 - Address of row
 *		x5 - Address of column
 *		X7 - 64 bit accumulated sum
 *		w9 - Cell of A
 *		w10 - Cell of B
 *		x19 - Position in C
 *		x20 - row in dotloop
 *		x12	- row in dotloop
 *		x6 - col in dotloop
 */
	.global main
	.equ N, 3			// matrix dimension
	.equ WDSIZE, 4		// size of element

main:
	str lr, [sp, #-16]			// save required regs
	stp x19, x20, [sp, #-16]	// save required regs

	mov w1, #N					// row index
	ldr x4, =A					// Address of current row
	ldr x19, =C					// Address of result matrix

rowloop:
	ldr x5, =B					// first column in B
	mov w2, #N					// Column index (will count to 0)

colloop:
	// zero accumulator registers
	mov x7, #0
	mov w0, #N					// dot product loop counter
	mov x12, x4					// row for dot product
	mov x6, x5					// column for dot product

dotloop:
	// dot dot product of a row A with column of B
	ldr w9, [x12], #WDSIZE		// load A[row, i] and incrment
	ldr w10, [x6], #(N*WDSIZE)	// load B[i, col]
	smaddl x7, w9, w10, x7		// do multiply and accumulated

	subs w0, w0, #1				// dec loop counter
	b.ne dotloop				// if not zero loop

	str w7,[x19], #4			// C[row, col] = dotprod
	add x5, x5, #WDSIZE			// inc current col
	subs w2, w2, #1				// dec col loop counter
	b.ne colloop				// if not zero loop

	add x4, x4, #(N * WDSIZE)	// increment to next row
	subs w1, w1, #1				// dec row loop counter
	b.ne rowloop				// if not zero loop

// Print out matrix C
// loop through 3 rows printing 3 col each time.
	mov w20, #3					// Print 3 rows
	ldr x19, =C					// addr of result matrix

printloop:
	ldr x0, =prtstr				// printf format string
	ldr w1, [x19], #WDSIZE		// first element in current row
	ldr w2, [x19], #WDSIZE		// second element in current row
	ldr w3, [x19], #WDSIZE		// third element in current row
	bl printf					// call printf
	subs w20, w20, #1			// Dec loop counter
	b.ne printloop				// if not zero loop

	mov x0, #0					// return code
	ldp x19, x20, [sp], #16		// restore regs
	ldr lr, [sp], #16			// restore lr
	ret

	.data
// first matrix
A:	.word 1, 2, 3
	.word 4, 5, 6
	.word 7, 8, 9

// second matrix
B:	.word 9, 8, 7
	.word 6, 5, 4
	.word 3, 2, 1

// result matrix
C:	.fill 9, 4, 0

prtstr: .asciz "%3d %3d %3d\n"
