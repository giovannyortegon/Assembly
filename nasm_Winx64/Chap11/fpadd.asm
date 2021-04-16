section .data
	a	dd	3.25
	b	dd 10.53

section .text
	global main

main:
	push rbp
	mov rbp, rsp
	sub rsp, 48

	movss xmm0, [a]		; load a
	movss xmm1, [b]		; load b
	vaddss xmm2, xmm0, xmm1		; xmm2 = xmm0 + xmm1

	leave
	ret
