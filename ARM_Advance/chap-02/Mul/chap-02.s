//extern "C" int IntegerMulA_(int a, int b)
	.text
	.global IntegerMulA_
IntegerMulA_:
// Calculate a * b and save result
	mul r2, r0, r1
	mov r0, r2
	bx lr

// extern "C" IntegerMulB_(int a, int b)
	.global IntegerMulB_
IntegerMulB_:
// Calculate a * b and save result
	smull r3, r4, r0, r1
	mov r0, r3
	mov r1, r4
	bx lr

// extern "C" IntegerMulB_(int a, int b)
	.global IntegerMulC_
IntegerMulC_:
	umull r3, r4, r0, r1
	mov r0, r3
	mov r1, r4
	bx lr
