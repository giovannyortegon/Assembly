; avx_unaligned.asm
section .data
	spvector1	dd 1.1
				dd 2.1
				dd 3.1
				dd 4.1
				dd 5.1
				dd 6.1
				dd 7.1
				dd 8.1

	spvector2	dd 1.2
				dd 2.2
				dd 3.2
				dd 4.2
				dd 5.2
				dd 6.2
				dd 7.2
				dd 8.2

	dpvector1	dq 1.1
				dq 2.2
				dq 3.3
				dq 4.4

	dpvector2	dq 5.5
				dq 6.6
				dq 7.7
				dq 8.8

	fmt1 db	"Single Precision Vector:", 10, 0
	fmt2 db 10, "Single Precision Vector 2:", 10, 0
	fmt3 db 10, "Sum of single Precision vector 1 and vector 2:", 10, 0
	fmt4 db 10, "Double Precision Vector 1:", 10, 0
	fmt5 db 10, "Double Precision Vector 2:", 10, 0
	fmt6 db 10, "Sum of Double Precision Vector 1 and Vector 2:", 10, 0

section .bss
	spvector_res resd	8
	dpvector_res resq	4

section .text
	global main
	extern printf

main:
	push rbp
	mov rbp, rsp

; SINGLE PRECISION FLOATING POINT VECTORS
; load vector 1 in the register ymm0
	vmovups ymm0, [spvector1]
; extract ymm0
	vextractf128 xmm2, ymm0, 0				; first part of ymm0
	vextractf128 xmm2, ymm0, 1				; second part of ymm0

; load vector in the register ymm1
	vmovups ymm1, [spvector2]

; extract ymm1
	vextractf128 xmm2, ymm1, 0
	vextractf128 xmm2, ymm1, 1

; add 2 single precision floating point vectors
	vaddps ymm2, ymm0, ymm1
	vmovups [spvector_res], ymm2

; print the vectors
	mov rdi, fmt1
	call printf

	mov rsi, spvector1
	call printspfpv

	mov rdi, fmt2
	call printf

	mov rsi, spvector2
	call printspfpv

	mov rdi, fmt3
	call printf

	mov rsi, spvector_res
	call printspfpv

; DOUBLE PRECISION FLOATING POINT VECTORS
; load vector 1 in the registers ymm0
	vmovupd ymm0, [dpvector1]

; extract ymm0
	vextractf128 xmm2, ymm0, 0			; first part of ymm0
	vextractf128 xmm2, ymm0, 1			; second part of ymm0

; load vextor 2 in the register ymm1
	vmovupd ymm1, [dpvector2]

; extract ymm1
	vextractf128 xmm2, ymm1, 0
	vextractf128 xmm2, ymm1, 1

; add 2 double precision floating point vectors
	vaddpd ymm2, ymm0, ymm1
	vmovupd [dpvector_res], ymm2

; print the vectors
	mov rdi, fmt4
	call printf

	mov rsi, dpvector1
	call printdpfpv

	mov rdi, fmt5
	call printf

	mov rsi, dpvector2
	call printdpfpv

	mov rdi, fmt6
	call printf

	mov rsi, dpvector_res
	call printdpfpv

	leave
	ret

; ----------------------------------------------------------------
printspfpv:
section .data
	.NL db 10, 0
	.fmt1 db "%.1f, ", 0

section .text
	push rbp
	mov rbp, rsp

	push rcx
	push rbx
	mov rcx, 8
	mov rbx, 0
	mov rax, 1

.loop:
	movss xmm0, [rsi + rbx]
	cvtss2sd xmm0, xmm0
	mov rdi, .fmt1
	push rsi
	push rcx
	call printf

	pop rcx
	pop rsi

	add rbx, 4
	loop .loop

	xor rax, rax
	mov rdi, .NL
	call printf

	pop rbx
	pop rcx

	leave
	ret

printdpfpv:
section .data
	.NL db 10, 0
	.fmt db "%.1lf, %.1lf, %.1f, %.1f", 0

section .text
	push rbp
	mov rbp, rsp

	mov rdi, .fmt
	mov rax, 4				; four floats
	call printf

	mov rdi, .NL
	call printf

	leave
	ret
