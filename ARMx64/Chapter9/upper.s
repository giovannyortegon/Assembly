/*
 * Assembler program to convert string to all upper case.
 *
 * x0 - address of input string
 * x1 - address of output string
 * x4 - original output string for length calc.
 * w5 - current character being processed.
 */
	.global mytoupper				// allow other files to call this routine
mytoupper:
	mov x4, x1

/* The loop is until byte pointed to by x1 is non-zero */
loop:
	// load character and incr ptr
	ldrb w5, [x0], #1
	// if w5 > 'z' then goto cont
	cmp w5, #'z'				// is letter > 'z'?
	b.gt cont					// goto to end if letter is lower case
	// else if w5 < 'a' then goto end
	cmp w5, #'a'
	b.lt cont					// goto to end
/* if we got here then the letter is lower case,
 * so convert it.
 */
	sub w5, w5, #('a' - 'A')

cont:
	strb w5, [x1], #1			// str character to output str
	cmp w5, #0					// stop on hitting a null char
	b.ne loop					// loop if character isn't null
	sub x0, x1, x4				// get the len by subing the ptrs

	ret
