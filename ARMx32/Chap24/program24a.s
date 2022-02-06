/* simple Neon Test */
	.global _start
_start:
	ldr r0, =number1
	ldr r1, =number2

	vld1.32 {q1}, [r0]
	vld1.32 {q2}, [r1]

	vadd.i32 q0, q1, q2

	mov r7, #1
	swi 0

	.data
number1: .word 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
number2: .word 2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
