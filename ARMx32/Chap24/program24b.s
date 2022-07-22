/* Rotate 4x4 Matrix through 90 degrees */
	.global _start
_start:
	// get data pointers
	ldr r0, =matrix0
	ldr r1, =matrix1
	ldr r2, =matrix2
	ldr r3, =matrix3

	// load q0 - q1 with the data
	vld1.32 {q0}, [r0]
	vld1.32 {q1}, [r1]
	vld1.32 {q2}, [r2]
	vld1.32 {q3}, [r3]

	// tranpose matrix
	vzip.32 q0, q1
	vzip.32 q2, q3

	// interleave inner pairs
	vswp d1, d4
	vswp d3, d6

	// mirror flip matrix
	vrev64.32 q0, q0
	vrev64.32 q1, q1
	vrev64.32 q2, q2
	vrev64.32 q3, q3

	// swap high and low halves
	vswp d0, d1
	vswp d2, d3
	vswp d4, d5
	vswp d6, d7

	// store result
	vst1.32 {q0}, [r0]
	vst1.32 {q1}, [r1]
	vst1.32 {q2}, [r2]
	vst1.32 {q3}, [r3]

	mov r7, #1
	swi 0

	.data
matrix0: .word 0, 1, 2, 3
matrix1: .word 4, 5, 6, 7
matrix2: .word 8, 9, 10, 11
matrix3: .word 12, 13, 14, 15
