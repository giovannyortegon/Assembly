//
// Main program to test our distance function
//
// W19 - loop counter
// X20 - address to current set of points
	.global main		// provide program starting address
	.equ N, 100			// Number of additions

main:
	stp x19, x20, [sp, #-16]!
	str lr, [sp, #-16]!

// Add up one hundred cents and test if they equal $1.00
	mov w19, #N			// number of loop iterations

// load cents, runnig sum and real sum to fpu
	ldr x0, =cent
	ldp s0, s1, [x0], #8
	ldr s2, [x0]
loop:
	// add cent to running sum
	fadd s1, s1, s0
	subs w19, w19, #1	// decrement loop counter
	b.ne loop			// loop if more options

	// compare running sum to real sum
	fcmp s1, s2

	// print of the numbers are equal or not
	b.eq equal
	ldr x0, =notequalstr
	bl printf
	b next

equal:
	ldr x0, =equalstr
	bl printf

next:
	// load pointer to running sum, real sum and epsilon
	ldr x0, =runsum

// call comparison function
	bl fpcomp			// call comparision function
	cmp x0, #1
	b.eq equal2
	ldr x0, =notequalstr
	bl printf
	b done

equal2:
	ldr x0, =equalstr
	bl printf

done:
	mov x0, #0			// return code
	ldr lr, [sp], #16
	ret

.data
	cent: .single 0.01
	runsum: .single 0.0
	sum:	.single 1.00
	epsilon: .single 0.00001
	equalstr:	.asciz "equal\n"
	notequalstr: .asciz "not equal\n"
