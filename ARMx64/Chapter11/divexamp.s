/*
 * Example of 64 bit Integer Division
 */
.include "debug.s"
	.global main
main:
	mov x2, #100
	mov x3, #4

	printStr "Inputs: "
	printReg 2
	printReg 3

	sdiv x4, x2, x3
	printStr "Outputs: "
	printReg 4

	udiv x4, x2, x3
	printStr "Outputs:"
	printReg 4

	// Division by zero
	printStr "Division by zero:"
	mov x3, #0
	sdiv x4, x2, x3
	printStr "Outputs: "
	printReg 4

	mov x0, #0
	ret
