/*
 * Assembly program to convert a string to
 * all upper case by calling a function.
 *
 * x0 - x2 - parameters to Linux function services
 * x1 - address of output string
 * x0 - address of input string
 * x2 - original address of input string
 * x8 - Linux function number
 */
.include "uppermacro.s"

	.global _start			// Provide program starting address
_start:
	/*
	 * convert tststr to upper case.
	 */
	toupper tststr, buffer
	/*
	 * Setup the parameters to print
	 * and then call Linux to do it.
	 */
	mov x2, x0			// return code is the len of the string
	mov x0, #1			// 1 = stdout
	ldr x1, =buffer		// string to print
	mov x8, #64			// linux write systam call
	svc 0				// call linux to output the string

	// convert second string tststr2.
	toupper tststr2, buffer

	/*
	 * Setup the parameters to print
	 * and then call linux to do it.
	 */
	mov x2, x0			// return code is the len of the string
	mov x0, #1			// 1 = stdout
	ldr x1, =buffer		// string to print
	mov x8, #64			// linux write system call
	svc 0				// call linux to output the string

	/*
	 * Setup the parameters to exit the program
	 * and then call linux to do it.
	 */
	mov x0, #0		// use 0 return code
	mov x8, #93		// service command code 93 terms
	svc 0			// call linux to terminate

	.data
tststr:		.asciz "This is our Test String that we will convert.\n"
tststr2:	.asciz "A second string to upper case!!\n"
buffer:		.fill	255, 1, 0
