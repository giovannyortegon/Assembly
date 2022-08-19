// Example function to calculate the distance
// between two points in single precision
// floating-point.
//
// Inputs:
//    X0 - pointer to the 4 FP numbers
//           they are x1, y1, x2, y2
// Outputs:
//    X0 - the length (as single precision FP)
	.global distance		// Allow function to be called by others
distance:
	// Push all registers to be safe, we don't really
	// need to push so many
	str lr, [sp, #-16]!

	// load all 4 numbers at once
	ldp s0, s1, [x0], #8
	ldp s2, s3, [x0]

	// call s4 = x2 - x1
	fsub s4, s2, s0

	// calc s5 = y2 - y1
	fsub s5, s3, s1

	// calc s4 = s4 * s4 (x2 - x1) ^ 2
	fmul s4, s4, s4

	// calc s5 = s5 * s5 (y2 - y1) ^ 2
	fmul s5, s5, s5

	// calc s4 = s4 + s5
	fadd s4, s4, s5

	// calc sqrt(4)
	fsqrt s4, s4

	// move result to x0 to be returned
	fmov w0, s4

	// restore what we preserved
	ldr lr, [sp], #16
	ret
