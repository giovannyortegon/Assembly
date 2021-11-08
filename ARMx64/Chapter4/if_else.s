// if_else.s
	.global _start
_start:
	mov w5, #20
	cmp w5, #10
	b.ge else
	mov x0, x5
	b endif
else:
	add x0, x5, #5
endif:
	mov x8, #93
	svc 0
