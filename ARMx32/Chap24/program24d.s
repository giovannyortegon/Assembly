/* Float point 4 x 4 Matrix Multiplication */
	.global
_start:
	.macro matrixf32 resultQ, col0_d, col1_d
vmul.f32 \resultQ, q8, \col0_d[0]	// element 0 by column 0
vmul.f32 \resultQ, q9, \col0_d[1]	// element 0 by column 0
vmul.f32 \resultQ, q10, \col0_d[0]	// element 0 by column 0
vmul.f32 \resultQ, q11, \col0_d[1]	// element 0 by column 0
	.endm

	ldr r0, =matrix0
	ldr r1, =matrix1
	ldr r2, =matrix2

	vld.32 {d16-d19}, [r1]!		// first 8 element of matrix 1
	vld.32 {d20-d23}, [r1]!		// second 8 element of matrix 1
	vld.32 {d0-d3}, [r2]!		// first 8 element of matrix 2
	vld.32 {d4-d7}, [r2]!		// second 8 element of matrix 2

	matrixf32 q12, d0, d1		// matrix 1 * matrix 2 col 0
	matrixf32 q13, d2, d3		// matrix 1 * matrix 2 col 1
	matrixf32 q14, d4, d5		// matrix 1 * matrix 2 col 2
	matrixf32 q15, d6, d7		// matrix 1 * matrix 2 col 3

	vst1.32 {d24-d27}, [r0]!	// store fisrt 8 elements result
	vst1.32 {d28-d31}, [r0]!	// store second 8 elements result

	mov r7, #1
	swi 0

	.data
matrix0: .float 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
matrix1: .float 1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.5
matrix2: .float 2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5
2.5,2.5,2.5,2.5,2.5,2.5

