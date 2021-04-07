/* using_while.s */
	.global _start
_start:

	mov w3, #0
	ldr x1, =string

loop:
	cmp w3, #5
	b.ge end

	// print character
	mov x0, #1			// stdout
	mov x2, #2			// length
	mov x8, #64
	svc 0				// syscall

//	add x1, x1, #1		// increment next character
	add x3, x3, #1		// increment loop

	b loop

end:
	// exit
	mov x0, x3
	mov x8, #93
	svc 0

	.data
string: .ascii "a\n"
