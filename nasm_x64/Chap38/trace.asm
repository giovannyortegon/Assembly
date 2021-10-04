; trace.asm
section .data
	fmt0 db "8x8 SINGLE PRECISION FLOATING POINT MATRIX TRACE", 10, 0
	fmt1 db 10, "This is the matrix: ", 10, 0
	fmt2 db 10, "This is the trace (sequential version: )"
	fmt5 db "This is the trace (AVX blend version): %f", 10, 0
	fmt6 db 10, "This is the transpose: ", 10, 0
	fmt30 db "Sequential version elapsed cycles: %u", 10, 0
	fmt31 db "AVX blend version elapsed cycle %d", 10, 0
	fmt4 db 10, "Number of loops: %d", 10, 0
	align 32
	matrix	dd 1.,	2.,		3.,		4.,		5.,		6.,		7.,		8.
			dd 9.,	10.,	11.,	12.,	13.,	14.,	15.,	16.
			dd 17.,	18.,	19.,	20.,	21.,	22.,	23.,	24.
			dd 25.,	26.,	27.,	28.,	29.,	30.,	31.,	32.
			dd 33.,	34.,	35.,	36.,	37.,	38.,	39.,	40.
			dd 41.,	42.,	43.,	44.,	45.,	46.,	47.,	48.
			dd 49.,	50.,	51.,	52.,	53.,	54.,	55.,	56.
			dd 57.,	58.,	59.,	60.,	61.,	62.,	63.,	64.

	loops dq 1000
	permps dd 0,1,2,3,4,5,6,7			; mask for permutation

section .bss
	align 32
	transpose resq 16
	trace resq 1
	bbhi_cy resq 1
	bblo_cy resq 1
	ebhi_cy resq 1
	eblo_cy resq 1
	bshi_cy resq 1
	bslo_cy resq 1
	eshi_cy resq 1
	eslo_cy resq 1

section .text
	global main
main:
	push rbp
	mov rbp, rsp
; print tittle
	mov rdi, fmt0
	call printf

; print matrix
	mov rdi, fmt1
	call printf

	mov rsi, matrix
	call printm8x8

; SEQUENTIAL VERSION
; compute trace
	mov rdi, matrix
	mov rsi, [loops]

; start measuring the cycles
	cpuid
	rdtsc
	mov [bshi_cy], edx
	mov [bslo_cy], eax
	call seq_trace

; stop measuring the cycles
	rdtscp
	mov [eshi_cy], edx
	mov [eslo_cy], eax
	cpuid

; print the result
	mov rdi, fmt2
	mov rax, 1
	call printf

; BLEND VERSION
; compute trace
	mov rdi, matrix
	mov rsi, [loops]

; start measuring the cycles
	cpuid
	rdtsc
	mov [bbhi_cy], edx
	mov [bblo_cy], eax
	call blend_trace

; stop measuring the cycles
	rdtscp
	mov [ebhi_cy], edx
	mov [eblo_cy], eax
	cpuid

; print the result
	mov rdi, fmt5
	mov rax, 1
	call printf

; print the loops
	mov rdi, fmt4
	mov rsi, [loops]
	call printf

; print the cycles
; cycles sequential version
	mov rdx, [eslo_cy]
	mov rsi, [eshi_cy]
	shl rsi, 32
	or rsi, rdx
	mov r8, [bslo_cy]
	mov r9, [bshi_cy]
	shl r9, 32
	or r9, r8
	sub rsi, r9

; print
	mov rdi, fmt30
	call printf


