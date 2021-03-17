// Example of the ADD / MOVN instruction.
	.global _start		// Provide program starting address
// Multi 2 by -1 by using MOVN and then adding 1
_start:
	movn w0, #2
	add w0, w0, #1

// exit
	mov x8, #93
	svc 0
