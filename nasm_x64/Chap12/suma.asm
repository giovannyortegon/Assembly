section .data
section .bss
section .text
	global suma
suma:
	push rbp
	mov rbp, rsp

	mov rax, rsi
	add rax, rdi

	leave
	ret
