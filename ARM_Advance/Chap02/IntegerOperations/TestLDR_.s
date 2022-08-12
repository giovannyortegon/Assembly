// extern "C" int TestLDR_(void);
	.data
Foo: .word 100, 200, 300, 400
	.text
	.global TestLDR_
TestLDR_:
	ldr r1, =Foo		// load address of Foo

	ldr r2, [r1]		// r2 = Foo[0]
	ldr r3, [r1, #4]	// r3 = Foo[1]

	add r0, r2, r3		// r0 = Foo[0] + Foo[1]

	ldr r2, [r1, #8]	// r2 = Foo[2]
	add r0, r0, r2		// ro += Foo[2]

	ldr r2, [r1, #12]	// r2 = Foo[3]
	add r0, r0, r2		// r0 += Foo[3]

	bx lr
