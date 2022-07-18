/*** Conditional execution in VFp code ***/
	.global main
	.func main
main:
	ldr r1, addr_value1
	vldr s14, [r1]
	vcvt.f64.f32 d1, s14
	ldr r1, addr_value2
	vldr s15, [r1]
	vcvt.f64.f32 d2, s15
	vcmp.f32 s14, s15
	vmrs apsr_nzcv, fpscr
	moveq r0, #0
	movne r0, #255

	mov pc, lr

	addr_value1: .world value1
	addr_value2: .world value2

	.data
value1: .float 1.54321
value2: .float 5.1
