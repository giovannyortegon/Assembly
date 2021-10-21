/*
 * Example of 128 bits addition with the ADD/ADC instructions.
 */
	.global _start
_start:
	// First 64 bit number is 0x0000000000000003FFFFFFFFFFFFFFFF
	mov x2, #0x0000000000000003
	mov x3, #0xFFFFFFFFFFFFFFFF

	// Second 64 bit number is 0x00000000000000050000000000000001
	mov x4, #0x0000000000000005
	mov x5, #0x0000000000000001

	adds x1, x3, x5			// Lower order 64-bits
	adc	 x0, x2, x4			// Higher order 64-bits

	mov x8, #93
	svc  0
