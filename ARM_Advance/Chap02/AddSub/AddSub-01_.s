// extern "C" int IntegerAddSub_(int, int, int, int);
	.text
	.global IntegerAddSub_
// r0 = a
// r1 = b
// r2 = c
// r3 = d
IntegerAddSub_:
// Calculate a + b + c - d
	add r0, r0, r1		// r0 = a + b
	add r0, r0, r2		// r0 = a + b + c
	sub r0, r0, r3		// r0 = a + b + c - d

	bx lr				// return caller
