// extern "C" void CalcQuoRem_(const int *, const int *, int *, int *);

	.text
	.cpu cortex-a72
	.global CalcQuoRem_
CalcQuoRem_:
// Save no volatile registers
	push {r4, r5}		// save r4 y r5 on stack

// Load a and b
	ldr r4, [r0]		// r4 = a (dividend)
	ldr r5, [r1]		// r5 = b (divisor)

// Calculate quotient and remainder
	sdiv r0, r4, r5		// r0 = quotient
	str r0, [r2]		// save quotiente

// Calculate reaminder
	mul r1, r0, r5		// r1 = quotient * b
	sub r2, r4, r1		// r2 = a - quotient * b
	str r2, [r3]		// save remainder

// Restore non-volatile register and return
	pop {r4, r5}
	bx lr
