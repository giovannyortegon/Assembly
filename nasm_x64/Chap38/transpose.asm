; transpose.asm
section .data
	fmt0 db "4x4 DOUBLE PRECISION FLOATING POINT MATRIX TRANSPOSE", 10, 0
	fmt1 db 10, "This is the matrix: ", 10, 0
	fmt2 db 10, "This is the transpose (sequential version)", 10, 0
	fmt3 db 10, "This is the transpose (AVX version): ", 10, 0
	fmt4 db 10, "Number of loops: %d", 10, 0
	fmt5 db "Sequential version elapsed cycles: %d", 10, 0
	fmt6 db "AVX shuffle version elapsed cycles: %d". 10, 0
	align 32

	matrix	dq		1.,		2.,		3.,		4.
			dq		5.,		6.,		7.,		8.
			dq		9.,		10.,	11.,	12.,
			dq		13.,	14.,	15.,	16.

	loops	dq 10000

section .bss
	alignb 32
	transpose	resq 16
	bahi_cy		resq 1		; timers for avx version
	balo_cy		resq 1
	eahi_cy		resq 1
	ealo_cy		resq 1
	bshi_cy		resq 1		; timers for sequential version
	bslo_cy		resq 1
	eshi_cy		resq 1
	eslo_lo		resq 1

section .text
	global main
	extern printf
main:
	push rbp
	mov rbp, rsp

; printf title
	mov rdi, fmt0
	call printf

; printf matrix
	mov rdi, fmt1
	call printf

; print matrix
	mov rdi, fmt1
	call printf
	mov rsi, matrix
	call printm4x4

; sequential version
; compute transpose
	mov rdi, matrix
	mov rsi, transpose
	mov rdx, [loops]
; start measuring the cycle
	cpuid
	rdtsc
	mov [bshi_cy], edx
	mov [bslo_cy], eax
	call seq_transpose

; stop measuring the cycles
	rdtscp
	mov [eshi_cy], edx
	mov [eshi_cy], eax
	cpuid

; printf the result
	mov rdi, fmt2
	call printf
	mov rsi, transpose
	call printm4x4

; AVX VERSION
; compute transpose
	mov rdi, matrix
	mov rsi, transpose
	mov rdx, [loops]
; start measuring the cycles
	cpuid
	rdtsc
	mov [bahi_cy], edx
	mov [balo_cy], eax
	call AVX_transpose

; stop measuring the cycles
	rdtscp
	mov [eahi_cy], edx
	mov [ealo_cy], eax
	cpuid

; print the result
	mov rdi, fmt3
	call printf

	mov rsi, transpose
	call printm4x4

; print the loops
	mov rdi, fmt4
	mov rsi, [loops]
	call printf

; print the cycles
; cycles sequential version
	mov rdx, [eslo_lo]
	mov rsi, [eshi_cy]
	shl rsi, 32
	or rsi, rdx				; rsi contains end time

	mov r8, [bslo_cy]
	mov r9, [bshi_cy]
	shl r9, 32
	or	r9, r8				; r9 contains start time
	sub rsi, r9				; rsi contains elapsed

; print the timing result
	mov rdi, fmt5
	call printf

; cycles AVX blend version
	mov rdx, [ealo_cy]
	mov rsi, [eahi_cy]
	shl rsi, 32
	or rsi, rdx					; rsi contains end time
	mov r8, [balo_cy]
	mov r9, [bahi_cy]
	shl r9, 32
	or r9, r8					; r9 contains start time
	sub rsi, r9					; rsi contains elapsed

; print the timing result
	mov rdi, fmt6
	call printf

	leave
	ret

; --------------------------------------------------------
seq_tanspose:
