// extern "C" int IntegerAddSub_(int a, int b, int c, int d)
	.text
	.global IntegerAddSub_
IntegerAddSub_:
	// calculate a + b + c - d
	add r0, r0, r1
	add r0, r0, r2
	sub r0, r0, r3

	bx lr
