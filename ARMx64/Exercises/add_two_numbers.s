.text
	.global _start
_start:
	mov x0, #4
	mov x1, #5
	bl sum

	mov x8, #93
	svc 0
