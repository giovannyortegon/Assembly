; sse_string2_imp.asm
; compare strings implicit length
section .data
	string1	db "the quick brown fox jumps over the lazy"
			db " river", 10, 0
	string2	db "the quick brown fox jumps over the lazy"
			db " river", 10, 0
	string3 db "the quick brown fox jumps over the lazy"
			db " dog", 10, 0

	fmt1	db "String 1 and 2 are equal.", 10, 0
	fmt11	db "String 1 and 2 differ at position %i.", 10, 0
	fmt2	db "String 2 and 3 are equal.", 10, 0
	fmt22	db "String 2 and 3 differ at position %i.", 10, 0

section .bss

section .text
	global main
	extern printf

main:
	push rbp
	mov rbp, rsp

; first print the strings
	mov rdi, string1
	xor rax, rax
	call printf

	mov rdi, string2
	xor rax, rax
	call printf

	mov rdi, string3
	xor rax, rax
	call printf

; compare string 1 and 2
	mov rdi, string1
	mov rsi, string2
	call pstrcmp

	mov rdi, string1
	mov rsi, string2
	call pstrcmp

	mov rdi, fmt1
	cmp rax, 0
	je eql1				; the string are equal
	mov rdi, fmt11		; the string are unequal

eql1:
	mov rsi, rax
	xor rax, rax
	call printf

; compare string 2 and 3
	mov rdi, string2
	mov rsi, string3
	call pstrcmp

	mov rdi, fmt2
	cmp rax, 0
	je eql2				; the string are equal
	mov rdi, fmt22		; the string are unequal

eql2:
	mov rsi, rax
	xor rax, rax
	call printf

; exit
	leave
	ret


; -----------string compare --------------------
pstrcmp:
	push rbp
	mov rbp, rsp

	xor rax, rax
	xor rbx, rbx

.loop:
	movdqu xmm1, [rdi + rbx]
	pcmpistri xmm1, [rsi + rbx], 0x18		; equal each | neg polarity
	jc .differ
	jz .equal
	add rbx, 16
	jmp .loop

.differ:
	mov rax, rbx
	add rax, rcx		; the position of the differing character
	inc rax				; because the index start at 0

.equal:
	leave
	ret
