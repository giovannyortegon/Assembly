/*
 * Assembler program to convert a string to
 * all upper case
 *
 * x1 - address of output string
 * x0 - address of input string
 * x4 - original output string for length calc.
 * w5 - current character being processed
 */
	.global toupper		// Allow other files to call this routine
toupper:
	mov x4, x1
// The loop is until byte pointed to x1 is non-zero
loop:
	ldrb w5, [x0], #1 // load character and incr ptr
	// if w5 > 'z'	then goto cont
	cmp w5, #'z'		// is letter > 'z'?
	b.gt cont			// goto to end if
	cmp w5, #'a'
	b.lt cont			// goto to end if
// convert it
	sub w5, w5, #('a' - 'A')  // 32
cont:
	strb w5, [x1], #1	// store character to output str
	cmp w5, #0			// stop null char
	b.ne loop			// if char is not null
	sub x0, x1, x4		// get the len by subing the ptr

	ret					// Return to caller
