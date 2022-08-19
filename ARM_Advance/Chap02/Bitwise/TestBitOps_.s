	.text
	.global TestBitOpsA_
TestBitOpsA_:
	push {r4-r5}

	and r3, r0, r1
	str r3, [r2]

	orr r4, r0, r1
	str r4, [r2, #4]

	eor r5, r0, r1
	str r5, [r2, #8]

	pop {r4 - r5}
	bx lr

	.global TestBitOpsB_
TestBitOpsB_:
	push {r4 - r7}

	and r2, r0, #0x0000ff00
	str r2, [r1]

	orr r3, r0, #0x00ff0000
	str r3, [r1, #4]

	eor r4, r0, #0xff000000
	str r4, [r1, #8]

	movw r5, #0xff00
	movt r5, #0x00ff
	and r6, r0, r5
	str r6, [r1, #12]

	pop {r4 - r7}
	bx lr
