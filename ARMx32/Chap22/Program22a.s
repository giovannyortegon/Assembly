/* Printing a floating point number */
	.global main
main:
	ldr r1, addr_value1			// get addr of value1
	vldr s14, [r1]				// move value1 into s14
	vcvt.f64.f32 d5, s14		// convert to b64

	ldr r0, =string				// point r0 to string
	vmov r2, r3, d5				// load value
	bl printf					// call function

	mov r7, #1					// exit syscall
	swi 0

addr_value1:
	.word value1

	.data
value1: .float 1.54321
string: .asciz "Floating point value is: %f\n"
