/* Add two 4x4 matrix together */
	.global _start
_start:
	ldr r0, =matrix1
	ldr r1, =matrix2
	ldr r2, =matrix3

	vld1.i32 {q0}, [r0]		// Load 4 x 32 bit integers, 1st array
	vld1.i32 {q1}, [r1]		// Load 4 x 32 bit integers, 2nd array
	vadd.i32 q2, q0, q1		// Add the valueof 4 int32
	vst1.i32 {q2}, [r2]		// store the 4 x 32 bit integers

	mov r7, #1
	swi 0

	.data
matrix1: .word 2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
matrix2: .word 4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
matrix3: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
