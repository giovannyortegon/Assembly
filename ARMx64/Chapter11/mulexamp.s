/*
 * Example of 32 & 64 bit multiplication
 */
.include "debug.s"
	.global main
main:
	mov x2, #25
	mov x3, #4

	printStr "Inputs: "
	printReg 2
	printReg 3

	mul x4, x2, x3
	printStr "MUL x4 = x2 * x3: "
	printReg 4

	mneg x4, x2, x3
	printStr "MNEG x4 = -x2 * x3: "
	printReg 4

	smull x4, w2, w3
	printStr "SMULL x4 = -w2 * w3: "
	printReg 4

	smnegl x4, w2, w3
	printStr "SMNEGL x4 = -w2 * W3: "
	printReg 4

	umull x4, w2, w3
	printStr "UMULL x4 = w2 * W3: "
	printReg 4

	umnegl x4, w2, w3
	printStr "UMNEGL x4 = -w2 * w3: "
	printReg 4

	ldr x2, =A
	ldr x2, [x2]
	ldr x3, =B
	ldr x3, [x3]
	mul x4, x2, x3
	printStr "Inputs: "
	printReg 2
	printReg 3

	mul x4, x2, x3
	printStr "mul x4 = bottom 64 bits od x2 * x3: "
	printReg 4
	smulh x4, x2, x3
	printStr "SMULL x4 = top 64 bits of x2 * x3 (signed): "
	printReg 4

	mov x0, #0
	ret

	.data
A: .dword 0x7812345678
B: .dword 0xFABCD12345678901
