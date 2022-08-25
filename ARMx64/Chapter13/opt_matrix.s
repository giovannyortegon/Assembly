/*
 * Multiply 2  3x3 integer matrices
 * uses the NEONCo processor to do
 * some operations in parallel.
 *
 * Registers:
 *	D0 - first column of matrix A
 *	D1 - second column of matrix A
 *	D2 - thrid column of matrix A
 *	D3 - first column of matrix B
 *	D4 - second column of matrix B
 *	D5 - third column of matrix B
 *	D6 - first column of matrix C
 *	D7 - second column of matrix C
 *	D8 - third column of matrix C
 */
	.global main
main:
	stp x19, x20, [sp, #-16]!
	str lr, [sp, #-16]!

	// load matrix A into Neon registers D0, D1, D2
	ldr x0, =A			// Address of A
	ldp d0, d1, [x0], #16
	ldr d2, [x0]

	// load matrix B into NEON registers D3, D4,D5
	ldr x0, =B			// Address of B
	ldp d3, d4, [x0], #16
	ldr d5, [x0]

.macro mulcol ccol bcol
	MUL \ccol\().4H,v0.4H, \bcol\().4H[0]
	MLA \ccol\().4H,v1.4H, \bcol\().4H[1]
	MLA \ccol\().4H,v2.4H, \bcol\().4H[2]
.endm

	mulcol v6, v3	// process first column
	mulcol v7, v4	// process second column
	mulcol v8, v5	// process third column

	ldr x1, =C		// Address of C
	stp d6, d7, [x1], #16
	str d8, [x1]

	// print out matrix C
	// loop through 3 rows printing 3 cols each time.
	mov w19, #3		// print 3 rows
	ldr x20, =C		// Addr of result matrix

printloop:
	ldr x0, =ptrstr			// printf format string
	ldrh w1, [x20], #2		// first element in current row
	ldrh w2, [x20, #6]		// third element in current row
	ldrh w3, [x20, #14]		// third element in current row
	bl printf				// call printf
	subs w19, w19, #1		// dec loop counter
	b.ne printloop			// if not zero loop

	mov x0, #0				// return code
	ldr lr, [sp], #16
	ldp x19,  x20, [sp], #16
	ret

.data
	// first matrix in column major order
	A: .short 1, 4, 7, 0
	   .short 2, 5, 8, 0
	   .short 3, 6, 9, 0

	// secind matrix in column major order
	B: .short 9, 6, 3, 0
	   .short 8, 5, 2, 0
	   .short 7, 4, 1, 0

	// result matrix in column major order
	C: .fill 12, 2, 0

ptrstr: .asciz "%3d %3d %3d\n"
