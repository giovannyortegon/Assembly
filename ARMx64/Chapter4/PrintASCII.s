// Assembly program to print a register in hex to stdout
// x0 - x2 - parameters to linux function services
// X1 - is also address of byte we are writing
// X4 - register to print
// W5 - loop index
// W6 - current character
// X8 - linux function number
	.global _start
_start:
	mov x4, #0x6e3a
	movk x4, #0x4f5d, lsl #16
	movk x4, #0xfedc, lsl #32
	movk x4, #0x1234, lsl #48

	ldr x1, =hexstr		// start of string
	add x1, x1, #17		// start at least sig digit

	mov w5, #16			// 16 digits to print

loop:
	and w6, w4, #0xf	// mask of least sig digit
	cmp w6, #10			// is 0 - 9 or A -F
	b.ge letter

// else its a number so convert to an ASCII digit
	add w6, w6, #'O'
	b cont				// goto to end if
letter:					// handle the digits A to F
	add w6, w6, #('A' - 10)

cont:					// end if
	strb w6, [x1]		// store ascii digit
	sub x1, x1, #1		// decrement address for next digit
	lsr x4, x4, #4		// shift off the digit
	// next w5
	subs w5, w5, #1		// step w5 by -1
	b.ne loop			// another for loop if not done

// setup the parameters to print our hex number
// and then call Linux to do it.
	mov x0, #1			// 1 - stdout
	ldr	x1, =hexstr		// string to print
	mov x2, #19			// length of our string
	mov x8, #64			// linux wirte system call
	svc 0

// Setup the parameters to exit the program
// and the call linux to do it.
	mov x0, #0			// Use 0 return code
	mov x8, #93			// Service code 93 terminates
	svc 0				// Call linux to terminate

	.data
hexstr:		.ascii "0x123456789ABCDEFG\n"
