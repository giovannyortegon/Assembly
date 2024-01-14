/* Printing two floating point numbers */
	.global main
	.func main
main:
	sub sp, sp, #16			// Make space on stack

	ldr r1, addr_value1		// get addr of value2
	vldr s14, [r1]
	vcvt.f64.f32 d0, s14
	ldr r1, addr_value2		// get addr of value2
	vldr s15, [r1]
	vcvt.f64.f32 d1, s15
	ldr r0, =string			// point r0 to string
	vmov r2, r3, d0			// first value
	vstr d1, [sp]			// second on stack
	bl printf
	add sp, sp, #16			// restore stack

	mov r7, #1				// exit syscall
	swi 0

	addr_value1: .word value1
	addr_value2: .word value2

	.data
value1: .float 1.54321
value2: .float 5.1
string: .asciz "The FP values are %f and %f\n"
