// extern "C" int MoveImmA_(void);
	.text
	.global MoveImmA_
MoveImmA_:
// Move immediate examples using unsigend integers
	mov r0, #25			// r0 = 25
	mov r1, #1000		// r1 = 100

	mov r2, #1001		// movw r2, #1001
	mov r3, #50000		// movw r3, #50000
	bx lr

// extern "C" int MoveImmB_(void);
	.global MoveImmB_
MoveImmB_:
// Move immediate example - 32 bits unsigned integers
	mov r0, #260096		// r0 = 26006

// Move immediate example - invalid after fixup error
//	mov r1, #260096		// invalid constant

// Alternative move immediate example
	movw r1, #0xf801
	movt r1, #0x0003	// r1 = 260097

	movw r2, #(260097 & 0xffff)
	movt r2, #(260097 >> 16)	// r2 = 260097

	ldr r3, =#260097	// r3 = 260097

	bx lr

// extern "C" int MoveImmC_(void);
	.global MoveImmC_
MoveImmC_:
// Move immediate examples - negative numbers
	mov r0, #-57		// mov r0, #56
	mov r1, #-6401		// mov r1, #6400

// Move immediate examples - invalid constant
// after error
// mov r1, #-1000		// invalid constant

// Alternative move immediate examples
	movw r0, #0xfc18
	movt r0, #0xffff	// r0 = -1000

//	movw r1, #(-1000 & 0xffff)
//	movt r1, #(-1000 >> 16)	// r2 = -1000

	ldr r2, =#-1000		// r2 = -1000

	mvn r3, #1000
	add r3, #1			// r3 = -1000

	bx lr
