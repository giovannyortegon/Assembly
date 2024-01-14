// lower_case.s
	.global _start
_start:
	ldr x3, =in_string
	ldr x5, =out_string
	mov w6, #0

loop:
	ldrb w4, [x3], #1
	cmp w4, #'Z'
	b.gt next
	cmp w4, #'A'
	b.lt next
	add w4, w4, #('a' - 'A')	// sum to char 32

next:
	strb w4, [x5], #1
	add x6, x6, #1
	cmp w4, #0
	b.ne loop

	mov x0, #1
	ldr x1, =out_string
//	ldr x1, =in_string
	mov x2, x6
	mov x8, #64
	svc 0

	mov x0, #0
	mov x8, #93
	svc 0

	.data
in_string: .asciz "HOLA A TODOS\n"
out_string: .fill 30, 1, 0 // array of 1 byte, fill with zeros
