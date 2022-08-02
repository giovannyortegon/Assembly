// extern "C" int IntegerMulA_(int, int);
	.text
	.global IntegerMulA_

IntegerMulA_:
	mul r2, r0, r1	// a * b (32 bits)
	mov r0,r2
	bx lr

// extern "C" long long IntegerMulB_(int, int);
	.global IntegerMulB_

IntegerMulB_:
	smull r3, r4, r0, r1    // a * b singned (64 bits)
	mov r0, r3
	mov r1, r4
	bx lr

// extern "C" unsigned long long IntegerMulC_(unsigned int, unsigned int);
	.global IntegerMulC_

IntegerMulC_:
	umull r3, r4, r0, r1 // a * b unsigned 64 bits
	mov r0, r3
	mov r1, r4
	bx lr

