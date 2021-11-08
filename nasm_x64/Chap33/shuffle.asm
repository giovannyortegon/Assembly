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

; buid xmm0 with the numbers - using stack with  xmm0
	pxor xmm0, xmm0
	pinsrd xmm0, dword[number1], 0
	pinsrd xmm0, dword[number2], 1
	pinsrd xmm0, dword[number3], 2
	pinsrd xmm0, dword[number4], 3

	movdqu [rbp-16], xmm0		; save xmm0 for later use
	mov rdi, fmt00
	call printf					; printf title

	movdqu xmm0, [rbp - 16]		; restore xmm0 after printf
	call print_xmm0d			; print xmm0

	; SHUFFLE-BROADCAST
	; shuffle: broad least significant dword (index 0)

	movdqu xmm0, [rbp-16]			; restore xmm0
	pshufd xmm0, xmm0, 00000000b	; shuffle index 0, 0, 0, 0

	mov rdi, fmt2
	mov rsi, 0						; print title
	movdqu [rbp-32], xmm0			; print destroys xmm0
	call printf

	movdqu xmm0, [rbp-32]			; restore xmm0 after printf
	call print_xmm0d				; print the content of xmm0

	; shuffle: broadcast dword index 1
	movdqu xmm0, [rbp - 16]			; restore xmm0
	pshufd xmm0, xmm0, 01010101b	; shuffle - index 1, 1, 1, 1

	mov rdi, fmt2
	mov rsi, 1						; print title
	movdqu [rbp-32], xmm0			; print destroy xmm0
	call printf

	movdqu xmm0, [rbp-32]			; restore xmm0 after printf
	call print_xmm0d				; print the content of xmm0

	; shuffle: broadcast dword index 2
	movdqu xmm0, [rbp-16]			; restore xmm0
	pshufd xmm0, xmm0, 10101010b	; shuffle - 2, 2, 2, 2

	mov rdi, fmt2
	mov rsi, 2						; print title
	movdqu [rbp-32], xmm0			; printf destroy xmm0
	call printf

	movdqu xmm0, [rbp-32]			; restore xmm0 after printf
	call print_xmm0d				; print the content of xmm0

; shuffle: broadcast dword index 3
	movdqu xmm0, [rbp-16]			; restore xmm0
	pshufd xmm0, xmm0, 11111111b	; shuffle- 3, 3, 3, 3
	mov rdi, fmt2
	mov rsi, 3						; print title
	movdqu [rbp-32], xmm0			; printf destroys xmm0
	call printf

	movdqu xmm0, [rbp-32]			; restore xmm0 after printf
	call print_xmm0d				; print the content of xmm0

; SHUFFLE-REVERSE
; reverese double words
	movdqu xmm0, [rbp-16]			; restore xmm0
	pshufd xmm0, xmm0 , 00011011b	; shuffle - index 0, 1, 2, 3
	mov rdi, fmt4					; print title
	movdqu [rbp-32], xmm0			; printf destroys xmm0
	call printf

	movdqu xmm0, [rbp-32]			; resotre xmm0 after printf
	call print_xmm0d				; print the content of xmm0

; SHUFFLE-ROTATE
; rotate left
	movdqu xmm0, [rbp-16]			; restore xmm0
	pshufd xmm0, xmm0, 10010011b	; shffle index 2,1,0,3
	mov rdi, fmt6					; print title
	movdqu [rbp-32], xmm0			; printf destroys xmm0
	call printf

	movdqu xmm0, [rbp-32]			; restore xmm0 after printf
	call print_xmm0d				; print the content of xmm0

; rotate right
	movdqu xmm0, [rbp-16]			; restore xmm0
	pshufd xmm0, xmm0, 00111001b	; shuffle index 0,3,2,1
	mov rdi, fmt7					; print title
	movdqu [rbp-32], xmm0			; printf destroys xmm0
	call printf

	movdqu xmm0, [rbp-32]			; restore xmm0 after printf
	call print_xmm0d				; print the content of xmm0

; SHUFFLING BYTES
	mov rdi, fmt9
	call printf						; print title

	movdqu xmm0, [char]				; load the character in xmm0 from 0 to 15
	movdqu [rbp-32], xmm0			; printf destroys in xmm0
	call print_xmm0b				; print the bytes in xmm0

	movdqu xmm0, [rbp-32]			; restore xmm0 after printf
	movdqu xmm1, [bytereverse]		; load the mask from 15 to 0 index
	pshufb xmm0, xmm1				; shuffle bytes
	mov rdi, fmt5					; print title
	movdqu [rbp-32], xmm0			; printf destroys xmm0
	call printf

	movdqu xmm0, [rbp-32]			; restore xmm0 after printf
	call print_xmm0b				; print the content of xmm0
	leave
	ret

; ------------------ function to print double words ------------------
print_xmm0d:
	push rbp
	mov rbp, rsp

	mov rdi, fmt3
	xor rax, rax
	pextrd esi, xmm0, 3			; extract the double words
	pextrd edx, xmm0, 2			; in reverse, little endian
	pextrd ecx, xmm0, 1
	pextrd r8d, xmm0, 0
	call printf

	leave
	ret

; --------------------- function to print bytes ----------------------
print_xmm0b:
	push rbp
	mov rbp, rsp

	mov rdi, fmt8
	xor rax, rax
	pextrb	esi, xmm0, 0	; in reverse little endian
	pextrb edx, xmm0, 1		; use registers first
	pextrb ecx, xmm0, 2		; then the stack
	pextrb r8d, xmm0, 3
	pextrb r9d, xmm0, 4

	pextrb eax, xmm0, 15
	push rax
	pextrb eax, xmm0, 14
	push rax
	pextrb eax, xmm0, 13
	push rax
	pextrb eax, xmm0, 12
	push rax
	pextrb eax, xmm0, 11
	push rax
	pextrb eax, xmm0, 10
	push rax
	pextrb eax, xmm0, 9
	push rax
	pextrb eax, xmm0, 8
	push rax
	pextrb eax, xmm0, 7
	push rax
	pextrb eax, xmm0, 6
	push rax
	pextrb eax, xmm0, 5
	push rax
	xor rax, rax
	call printf

	leave
	ret
