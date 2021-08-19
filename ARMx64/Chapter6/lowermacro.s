/* Convert to lowercase string */
.MACRO tolower instr, outstr
	ldr x0, =\instr
	ldr x1, =\outstr
	mov x2, x1

1:
	ldrb w3, [x0], #1
	cmp w3, #'Z'
	b.gt 2f

	cmp w3, #'A'
	b.lt 2f

	add w3, w3, #('a'-'A')

2:
	strb w3, [x1], #1
	cmp w3, #0
	b.ne 1b
	sub x0, x1, x2
.ENDM
