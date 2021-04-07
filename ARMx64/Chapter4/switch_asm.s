/* switch_asm.s */
	.global _start

_start:
	mov w0, #3

case1:
	cmp w0, #1
	b.ne case2
	mov w0, #10
	b end

case2:
	cmp w0, #2
	b.ne case3
	mov w0, #20
	b end

case3:
	mov w0, #30

end:
	mov x8, #93
	svc 0
