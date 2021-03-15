/*
 * Example of the MOV instruction.
 */
	.global _start
_start:
	// Load X2 with 0x1234FEDC4F5D6E3A first using MOV and MOVK
	mov x2, #0x6e3a
	movk x2, #0x4f5d, LSL #16
	movk x2, #0xfedc, LSL #32
	movk x2, #0x1234, LSL #48

// Just move W2 into W1
	mov w1, w2

// Now lets see all shift versions of MOV
	mov x1, x2, LSL #1	// Logical shift left
	mov x1, x2, LSR #1	// Logical shift right
	mov x1, x2, ASR #1	// Aritmetic shift right
	mov x1, x2, ROR #1	// Rotate right

//Repeat the above shitfs using mnemonics.
	LSL x1, x2, #1		// Logical shift left
	LSR x1, x2, #1		// Logical shift right
	ASR x1, x2, #1		// Aritmetic shift right
	ROR x1, x2, #1		// Rotate right

// Example that works with 8 bit immediate and shift
	mov x1, #0xAB000000		// Too big for #imm16

// Example that can't be represented and result in a error
// uncomment the instruction if you want to see the error
	//mov x1, #0xabcdef11	// Too big for #imm16 and can't
							// be represent.
// Example of MOVN
	movn W1, #45

// Example of  a MOV that the Assembler will change to MOVN
	mov w1, #0xFFFFFFFE		// (-2)

// Setup the parameters to exit the program
// and then call Linux to do it
	mov x0, #0
	mov x8, #93		// syscall exit
	SVC 0
