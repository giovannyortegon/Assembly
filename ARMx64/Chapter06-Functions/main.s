/*
 * Assembly program to convert a string to
 * all upper case by calling a function.
 *
 * x0 - x2 - parameters to linux function services
 * x1 - address of output string
 * x0 - address of input string
 * x8 - linux function number
 */
	.global _start
_start:
	ldr x0, =instr		// start of input string
	ldr x1, =outstr		// address of output string
	bl toupper

// print outstr
	mov x2, x0		// return length

	mov x0, #1		// 1 = stdout
	ldr x1, =outstr	// string all in upper-case
	mov x8, #64		// linux write syscall
	svc 0
// exit syscall
	mov x0, #0		// return 0
	mov x8, #93		// Service command code 93
	svc 0

	.data
instr:	.asciz "THis is our Test String that we will convert.\n"
outstr: .fill 255, 1, 0
