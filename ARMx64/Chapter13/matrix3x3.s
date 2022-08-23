//
// Multiply 2 3x3 integer matrices
// Uses the NEON Coprocessor to do
// some operations in parallel.
//
// Registers:
//    D0 - first column of matrix A
//    D1 - second column of matrix A
//    D2 - third column of matrix A
//    D3 - first column of matrix B
//    D4 - second column of matrix B
//    D5 - third column of matrix B
//    D6 - first column of matrix C
//    D7 - second column of matrix C
//    D8 - third column of matrix C
	.global main
main:
	stp x19, x20, [sp, #-16]!
	str lr, [sp, #-16]!

// load matrix A into Neon registers D0, D1, D2
	ldr x0, =A				// Address of A
	ldp d0, d1, [x0], #16
	ldr d2, [x0]

// load matrix B into Neon registers D3, D4, D5
	ldr x0, =B				// Address B
	ldp d3, d4, [x0], #16
	ldr d5, [x0]

.macro mulcol ccol bcol
	mul \ccol\().4h, v0.4h, \bcol\().4h[0]
	mla \ccol\().4h, v1.4h, \bcol\().4h[1]
	mla \ccol\().4h, v2.4h, \bcol\().4h[2]
.endm

	mulcol v6, v3			// process first column
	mulcol v7, v4			// process second column
	mulcol v8, v5			// process third column

	ldr x1, =C				// Address of C
	stp d6, d7, [x1], #16
	str d8, [x1]

// Print out matrix C
// loop through 3 row printing 3 cols each time.
	mov w19, #3			// Print 3 rows
	ldr x20, =C			// Addr of result matrix

printloop:
	ldr x0, =prtstr		// printf format string

// print transpose so matrix is in usual row column order.
// first ldrh post-indexes by 2 for next row
// so second ldrh adds 6, so is ahead by 2+6=8=row size
// similarly for third ldh ahead by 2+14=16 = 2 x row size
	ldrh w1, [x20], #2	// first element in current row
	ldrh w2, [x20, #6]	// second element in current row
	ldrh w3, [x20, #14]	// third element in current row
	bl printf			// call printf
	subs w19, w19, #1	// dec loop counter
	b.ne printloop		// if not zero loop

	mov x0, #0			// return code
	ldr lr, [sp], #16
	ldp x19, x20, [sp], #16
	ret

	.data
// First matrix in column major order
A:	.short 1, 4, 7, 0
	.short 2, 5, 8, 0
	.short 3, 6, 9, 0
// Second matrix in column major order
B:	.short 9, 6, 3, 0
	.short 8, 5, 2, 0
	.short 7, 4, 1, 0
// Result matrix in column major order
C:	.fill 12, 2, 0
prtstr:	.asciz "%3d  %3d  %3d\n"
