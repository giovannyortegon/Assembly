// for_loop.s
	.global _start
_start:
	mov w2, #0
loop:
	add w2, w2, #1
	cmp w2, #5
	b.le loop

	sub x0, x2, #1
#	mov x0, x2
	mov x8, #93
	svc 0
