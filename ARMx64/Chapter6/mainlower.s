/*
 * Assembler program to convert a string to
 * all upper case by calling a function
 *
 * x0 - x2 parameters to Linux function services
 * x1 - address of output string
 * x0 - address of input string
 * x2 - original address of input string
 * x8 - Linux function number
 *
 */

 .include "lowermacro.s"

	.global _start
_start:
	// convet tststr to upper case
	tolower tststr, buffer

// Setup the parameters to print
// and then call linux to do it.
	mov x2, x0		// return code is len of the string

	mov x0, #1			// 1 = stdout
	ldr x1, =buffer		// string to print
	mov x8, #64			// linux write system call
	svc 0				// call linux to output the string

	// convert second string tststr2
	tolower tststr2, buffer

// setup the parameters to print
// and then call linux to do it.
	mov x2, x0			// return code is the len of the string

	mov x0, #1			// 1 = stdout
	ldr x1, =buffer		// string to print
	mov x8, #64			// linux write system call
	svc 0

// setup the parameters to exit the program
// and then call linux to do it.
	mov x0, #0			// Use 0 return code
	mov x8, #93			// service command code 93 terms
	svc 0				// call linux to terminate

.data
	tststr:		.asciz "THIS IS OUR TEST STRING THAT WE WILL CONVERT.\n"
	tststr2:	.asciz "A SECOND STRING TO LOWER CASE!!\n"
	buffer: .fill 255, 1, 0
