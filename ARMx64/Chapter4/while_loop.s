// while_loop.s
	.global _start
_start:

loop:
	cmp w4, #10
	b.ge loopdone
	add w4, w4, #1
	b loop

loopdone:
	mov x0, x4
	mov x8, #93
	svc 0
