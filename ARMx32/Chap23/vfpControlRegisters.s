/*** Using LEN and STRIDE to sum vectors ***/
	.global main
	.func main
main:
	sub sp, sp, #24			// room for printf

	ldr r1, addr_value1		// Get addr of values
	ldr r2, addr_value2
	ldr r3, addr_value3
	ldr r4, addr_value4
	ldr r5, addr_value5

	vldr s16, [r1]			// Load values into
	vldr s18, [r1]			// registers
	vldr s20, [r1]
	vldr s22, [r1]
	vldr s24, [r2]
	vldr s26, [r3]
	vldr s28, [r4]
	vldr s30, [r5]

lenstride:
/* Set LEN = 4 0b011 and STRIDE = 2 0b11 */
	vmrs r3, fpscr			// get current fpscr
	mov r4, #0b110011		// bit pattern
	mov r4, r4, lsl #16		// move across to b21
	orr r3, r3, r4			// keep all 1's
	vmsr fpscr, r3			// transfer to fpscr

	vadd.f32 s10, s16, s24	// vector addition
	vadd.f32 s12, s18, s26
	vadd.f32 s14, s20, s28
	vadd.f32 s8, s22, s30

convert:
	/* Do convertsion for printing, making sure not */
	/* to corrupt Sx registers by over writing. */
	vcvt.f64.f32 d0, s10
	vcvt.f64.f32 d1, s12
	vcvt.f64.f32 d2, s14
	vcvt.f64.f32 d3, s8
	ldr r0, =string			// set up for printf
	vmov r2, r3, d0
	vstr d1, [sp]			// push data on stack
	vstr d2, [sp, #8]
	vstr d3, [sp, #16]
	bl printf
	add sp, sp, #24			// restore stack

_exit:
	mov r0, #0
	mov r7, #1
	swi 0

	addr_value1: .word value1
	addr_value2: .word value2
	addr_value3: .word value3
	addr_value4: .word value4
	addr_value5: .word value5

.data
	value1: .float 1.0
	value2: .float 1.25
	value3: .float 1.50
	value4: .float 1.75
	value5: .float 2.0

string:
	.asciz "S10 is %f\n S12 is %f\n S14 is %f\n S8 is %f\n"
