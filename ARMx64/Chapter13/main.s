//
// Main program to test our distance function
//
// W19 - loop counter
// X20 - address to current set of points
	.global main
	.equ N, 3
main:
	stp x19, x20, [sp, #-16]!
	str lr, [sp, #-16]!

	ldr x20,  =points		// pointer to current points
	mov w19, #N				// number to current points

loop:
	mov x0, x20				// move pointer to parameter 1 (r0)
	bl distance				// call distance function

// need to take the single precision return value
// and convert it to a double, because the C printf
// function can only print doubles.
	fmov s2, w0				// move back to fpu for conversion
	fcvt d0, s2				// convert single to double
	fmov x1, d0				// return double to r2, r3
	ldr x0, =ptrstr			// load print string
	bl printf				// print the distance

	add x20, x20, #(8*4)	// 8 elements each 4 bytes
	subs w19, w19, #1		// decrement loop counter
	b.ne loop				// loop if more points

	mov x0, #0				// return code

	ldr lr, [sp], #16
	ldp x19, x20, [sp], #16

	ret

	.data
points: .single 0.0, 0.0, 0.0, 0.0, 17.0, 4.0, 2.0, 1.0
		.single 1.3, 5.4, 3.1, -1.5, -2.4, 0.323, 3.4, -0.232
		.single 1.323e10, -1.2e-4, 34.55, 5454.234, 10.9, -3.6, 4.2, 1.3
ptrstr:
	.asciz "Distance = %f\n"
