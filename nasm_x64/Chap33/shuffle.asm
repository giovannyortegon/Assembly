; shuffle.asm
section .data
	fmt0	db "These are the numbers in memory: ", 0xa, 0
	fmt00	db "This is xmm0: ", 0xa, 0
	fmt1	db "%d ", 0
	fmt2	db "Shuffle-broadcast double word %i: ", 0xa, 0
	fmt3	db "%d %d %d %d", 0xa, 0
	fmt4	db "Shuffle-reverse double words: ", 0xa, 0
	fmt5	db "Shuffle-reverse packed byte in xmm0: ", 0xa, 0
	fmt6	db "Shuffle-rotate left: ", 0xa, 0
	fmt7	db "Shuffle-rotate right: ", 0xa, 0
	fmt8	db "%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c", 0xa, 0
	fmt9	db "Packed bytes in xmm0: ", 0xa, 0
	NL		db 0xa, 0

	number1	dd 1
	number2 dd 2
	number3	dd 3
	number4 dd 4

	char	db "abcdefghijklmnop"
	bytereverse db 15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0

section .bss
section .text
	global main
	extern printf

main:
	push rbp
	mov rbp, rsp

	sub rsp, 32			; stackspace for the original xmm0

	; and for the modified xmm0
	; SHUFFLING DOUBLE WORD
	; first print the number in reverse

	mov rdi, fmt0
	call printf

	mov rdi, fmt1
	mov rsi, [number4]
	xor rax, rax
	call printf

	mov rdi, fmt1
	mov rsi, [number3]
	xor rax, rax
	call printf

	mov rdi, fmt1
	mov rsi, [number2]
	xor rax, rax
	call printf

	mov rdi, fmt1
	mov rsi, [number1]
	xor rax, rax
	call printf

	mov rdi, NL
	call printf

; buid xmm0 with the numbers
	pxor xmm0, xmm0
	pinsrd xmm0, dword[number1], 0
	pinsrd xmm0, dword[number2], 1
	pinsrd xmm0, dword[number3], 2
	pinsrd xmm0, dword[number4], 3

	movdqu [rbp-16], xmm0		; save xmm0 for later use
	mov rdi, fmt00
	call printf					; printf title

	movdqu xmm0, [rbq - 16]		; restore xmm0 after printf
	call print_xmm0d			; print xmm0

	movdqu xmm0, [rbp - 16]		; restore xmm0 after printf

	; SHUFFLE-BROADCAST
	; shuffle: broad least significant dword (index 0)

	movdqu xmm0, [rbp-16]			; restore xmm0
	pshufd xmm0, xmm0, 00000000b	; shuffle

	mov rdi, fmt2
	mov rsi, 0						; print title
	movdqu [rbp-32], xmm0			; print destroys xmm0
	call printf

	movdqu xmm0, [rbp-32]			; restore xmm0 after printf
	call print_xmm0d				; print the content of xmm0

	; shuffle: broadcast dword index 1
	movdqu xmm0, [rbp - 16]			; restore xmm0
	pshufd xmm0, xmm0, 01010101b	; shuffle

	mov rdi, fmt2
	mov rsi, 1						; print title
	movdqu [rbp-32], xmm0			; print destroy xmm0
	call printf

	movdqu xmm0, [rbp-32]			; restore xmm0 after printf
	call print_xmm0d				; print the content of xmm0

	; shuffle: broadcast dword index 2
	movdqu xmm0, [rbp-16]			; restore xmm0
	pshufd xmm0, xmm0, 10101010b	; shuffle

	mov rdi, fmt2
	mov rsi, 2						; print title
	movdqu [rbp-32], xmm0			; printf destroy xmm0
	call printf

	movdqu xmm0, [rbp-32]			; restore xmm0 after printf
	call print_xmm0d				; print the content of xmm0
