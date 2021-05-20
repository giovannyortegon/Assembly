/*
 * Assembler program to convert a string to
 * all upper case.
 *
 * x1 - address of output string
 * x0 - address of input string
 * x2 - original output string for length calc.
 * w3 - current character being processed.
 *
 * label 1 = loop
 * label 2 = cont
 */
 .MACRO toupper instr, outstr
	ldr x0, =\instr
	ldr x1, =\outstr
	mov x2, x1
// The loop is until byte pointed to by x1 is non-zero
1:
	ldrb w3, [x0], #1		// load char and incr pointer
// if r5 > 'z' then goto cont
	cmp w3, #'z'			// is letter > 'z'?
	b.gt 2f
// else if r5 < 'a' then goto end if
	cmp w3, #'a'
	b.lt 2f					// goto to end if
/*
* if we got here then the letter is lower case, so convert it.
 */
	sub w3, w3, #('a' - 'A')
2:
	// end if
	strb w3, [x1], #1		// store char to output str
	cmp w3, #0				// stop on hitting a null char
	b.ne 1b					// loop if character isn't null
	sub x0, x1, x2			// get the len by subing the ptrs
.ENDM
