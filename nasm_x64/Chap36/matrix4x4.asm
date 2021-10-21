; matrix4x4.asm
section .data
	fmt0  db 10, "4x4 Double precision float point matrices", 10, 0
	fmt1  db 10, "This is matrix A: ", 10, 0
	fmt2  db 10, "This is matrix B: ", 10, 0
	fmt3  db 10, "This is matrix A x matrix B: ", 10, 0
	fmt4  db 10, "This is matrix C: ", 10, 0
	fmt5  db 10, "This is the inverse of matrix C: ", 10, 0
	fmt6  db 10, "Proof: matrix C x inverse = ", 10, 0
	fmt7  db 10, "This is matrix S:", 10, 0
	fmt8  db 10, "This is the inverse of matrix S:", 10, 0
	fmt9  db 10, "Proof: matrix S x inverse = ", 10, 0
	fmt10 db 10, "This matrix is singular!", 10, 10, 0
	aligne 32
	matrixA		dq 1.,	3.,		5.,		7.
				dq 9.,	11.,	13.,	15.
				dq 17.,	19.,	21.,	32.
				dq 25.,	27.,	29.,	31.
	matrixB		dq 2.,	4.,		6.,		8.
				dq 10.,	12.,	14.,	16.
				dq 18.,	20.,	22.,	24.
				dq 26.,	28.,	30.,	32.
	matrixC		dq 2.,	11.,	21.,	7.
				dq 3.,	13.,	23.,	41.
				dq 5.,	17.,	29.,	43.
				dq 7.,	19.,	31.,	47.
	matrixS		dq 1.,	2.,		3.,		4.
				dq 5.,	6.,		7.,		8.
				dq 9.,	10.,	11.,	12.
				dq 13.,	14.,	15.,	16.

section .bss
	align 32
	product resq	16
	inverse resq	16

section .text
	global main
	extern printf
main:
	push rbp
	mov rbp, rsp

; print title
	mov rdi, fmt0
	call printf

; print matrix A
	mov rdi, fmt1
	call printf

	mov rsi, matrixA
	call printm4x4

; print matrix B
	mov rdi, fmt2
	call printf

	mov rsi, matrixB
	call printm4x4

; compute the product matrix A x matrix B
	mov rdi, matrixA
	mov rsi, matrixB
	mov rdx, product
	call multi4x4

; print product
	mov rdi, fmt3
	call printf

	mov rsi, product
	call printm4x4

; print matrix C
	mov rdi, fmt4
	call printf

	mov rsi, matrixC
	call printm4x4

; compute the inverse of matrix C
	mov rdi, matrixC
	mov rsi, inverse
	call inverse4x4

	cmp rax, 1
	je singular

; print the inverse
	mov rdi, fmt5
	call printf

	mov rsi, inverse
	call printm4x4

; proof multiply matrixC and inverse
	mov rsi, matrixC
	mov rdi, inverse
	mov rdx, product
	call multi4x4
; print the proof
	mov rdi, fmt6
	call printf

	mov rsi, product
	call printm4x4

; singular matrix
; print matrix S
	mov rdi, fmt7
	call printf

	mov rsi, matrixS
	call printm4x4

; compute the inverse of matrixS
	mov rdi, matrixS
	mov rsi, inverse
	call inverse4x4

	cmp rax, 1
	je singular

; print the inverse
	mov rdi, fmt8
	call printf

	mov rsi, inverse
	call printm4x4

; proof multiply matrix S and inverse
	mov rsi, matrixS
	mov rsi, inverse
	mov rdx, product
	call multi4x4

; print the proof
	mov rdi, fmt9
	call printf

	mov rsi, product
	call printm4x4

	jmp exit
singular:
; print error
	mov rdi, fmt10
	call printf

exit:
	leave
	ret

inverse4x4:
	align 32
	.identity	dq	1.,		0.,		0.,		0.
				dq	0.,		1.,		0.,		0.
				dq	0.,		0.,		1.,		0.
				dq	0.,		0.,		0.,		1.
	.minus_mask	dq 8000000000000000h
	.size		dq 4					; 4 x 4 matrix
	.one		dq 1.0
	.two		dq 2.0
	.three		dq 3.0
	.four		dq 4.0

section .bss
	align 32
	.matrix1	resq	16
	.matrix2	resq	16
	.matrix3	resq	16
	.matrix4	resq	16
	.mxcsr		resd	1				; used for checking zero divisor

section .text
	push rbp
	mov rbp, rsp
	push rsi							; save address of inverse matrix
	vzeroall							; clear all ymm registers

; compute the intermediate matrices
; compute the intermediate matrix2
; rdi contains address of the original matrix
	mov rsi, rdi
	mov rdx, .matrix2
	push rdi
	call multi4x4
	pop rdi

; compute the intermediate matrix3
	mov rsi, .matrix2
	mov rdx, .matrix3
	push rdi
	call multi4x4
	pop rdi

; compute the intermediate matrix4
	mov rsi, .matrix3
	mov rdx, .matrix4
	push rdi
	call multi4x4
	pop rdi

; compute the traces
; compute trace1
	mov rsi, [.size]
	call vtrace
	movsd xmm8, xmm0					; trace 1 in xmm8
; compute trace 2
	push rdi							; save address of the original matrix
	mov rdi, .matrix2
	mov rsi, [.size]
	call vtrace
	movsd xmm9, xmm0					; trace 2 in xmm9
; compute trace 3
	mov rdi, .matrix3
	mov rsi, [.size]
	call vtrace
	movsd xmm10, xmm0					; trace 3 in xmm10

; compute trace 4
	mov rdi, .matrix4
	mov rsi, [.size]
	call vtrace
	movsd xmm11, xmm0					; trace 4 in xmm11
; compute the coefficients
; compute coefficient p1
; p1 = -s1
	vxorpd xmm12, xmm8, [.minus_mask]
; compute coeffiecient p2
; p2 = -1/2 * (p1 * s1 + s2)
	movsd xmm13, xmm12					; copy p1 to xmm13
	vfmadd213sd xmm13, xmm8, xmm9		; xmm13 = xmm13 * xmm8 + xmm9
	vxorpd	xmm13, xmm13, [.minus_mask]
	divsd xmm13, [.two]					; divide by 2 and p2 in xmm13
; compute coefficient p3
; p3 = -1/3 * (p2 * s1 + p1 * s2 + s3)
	movsd xmm14, xmm12					; copy p1 to xmm14
	vfmadd213sd xmm14, xmm9, xmm10		; p1 * s2 + s3
										; xmm14 = xmm14 * xmm9 + xmm10
	vfmadd231sd xmm14, xmm13, xmm8		; xmm14 + p2 * s1
										; xmm14 = xmm14 + xmm13 * xmm8
	vxorpd xmm14, xmm14, [.minus_mask]
	divsd xmm14, [.three]				; p3 in xmm14
; compute coefficient p4
; p4 = -1/4 * (p3 * s1 + p2 * s2 + p1 * s3 + s4)
	movsd xmm15, xmm12					; copy p1 to xmm15
	vfmadd213sd xmm15, xmm10, xmm11		; p1 * s3 + s4
										; xmm15 = xmm15 * xmm10 + xmm11
	vfmadd231sd xmm15, xmm13, xmm9		; xmm15 + p2 * s2
										; xmm15 = xmm15 + xmm13 * xmm9
	vfmadd231sd xmm15, xmm14, xmm8		; xmm15 + p3 * s1
										; xmm15 = xmm15 + xmm14 * xmm8
	vxorpd xmm15, xmm15, [.minus_mask]
	divsd xmm15, [.four]				; p4 in xmm15
; multiply matrices with proper coefficient
	mov rcx, [.size]
	xor rax, rax
	vbroadcastsd ymm1, xmm12	; p1
	vbroadcastsd ymm2, xmm13	; p2
	vbroadcastsd ymm3, xmm14	; p3
	pop rdi						; restore the address of the origianl matrix
