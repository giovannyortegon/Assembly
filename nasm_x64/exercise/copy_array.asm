section .data
	a: dd 1, 2, 3, 4, 5

section .bss
	b: resd 5

section .text
	global main
main:
	push rbp
	mov rbp, rsp
	sub rsp, 48

	lea rdi, [b]	; destination
	lea rsi, [a]	; source
	mov rdx, 5		; count
	call copy_array

	xor eax, eax
	leave
	ret

copy_array:
	push rbp
	mov rbp, rsp
	sub rsp, 48

	xor rcx, rcx

more:
	mov eax, [rsi + 4 * rcx]
	mov [rdi + 4 * rcx], eax
	add rcx, 1
	cmp rcx, rdx
	jne more

	leave
	ret
