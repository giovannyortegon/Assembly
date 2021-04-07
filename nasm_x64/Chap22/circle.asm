; circle.asm
section .data
	pi	dq 3.141592654
section .bss
section .text
	global carea
carea:
	push rbp
	mov rbp, rsp

	movsd xmm1, qword[pi]
	mulsd xmm0, xmm1		; radius in xmm0

	leave
	ret

section .text
	global ccircum
ccircum:
	push rbp
	mov rbp, rsp

	movsd xmm1, qword[pi]
	addsd xmm0, xmm0		; radius in xmm0
	mulsd xmm0, xmm1

	leave
	ret
