/*
 * Assembler program to convert a string to
 * all upper case by calling a function.
 *
 * x0 - x2 - parameters to linux function services
 * x1 - address of output string
 * x0 - address of input string
 * x8 - linux function number
 *
 */
	.global _start
_start:
	ldr x0, =instr					// start of input string
	ldr x1, =outstr					// address of output string
	bl toupper

/* setup the parameters to print our hex number
 * and the call linux to do it.
 */
	mov x2, x0						// return code is the length
	mov x0, #1						// 1 = stdout
	ldr x1, =outstr					// string to print
	mov x8, #64						// linux write system call
	svc 0							// call linux to output the string

/* setup the parameters to exit the program
 * and the call linux to do it.
 */
	mov x0, #0						// use 0 return code
	mov x8, #93						// service command code 93
	svc 0							// call linux to terminates

.data
	instr: .asciz "This is our Test string that we will convert.\n"
	outstr: .fill 255, 1, 0
