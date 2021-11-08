/*
 * Simple function that takes 2 parameters
 * VAR1 and VAR2. The function adds them,
 * storing the result in a variable SUM.
 * The function returns the sum.
 * It is assumed this function does other work,
 * including other functions.
 */
 // Define our variables
 .equ var1, 0
 .equ var2, 4
 .equ sum, 8

 sumfn:
	stp lr, fp, [sp, #-16]!
	sub fp, sp, #16
	sub sp, sp, #16						// room for 3 - 32 bits values
	str w0, [fp, #var1]					// save first param
	str w1, [fp, #var2]					// save second param

// Do a bunch of other work, but don't change SP
	ldr w4, [fp, #var1]
	ldr w5, [fp, #var2]
	add w6, w4, w5
	str w6, [fp, #sum]

// do other work
// function epolog
	ldr w0, [fp, #sum]					// load sum to return
	add sp, sp, #16						// release local vars
	ldp lr, fp, [sp], #16				// restore lr, fp
	ret
