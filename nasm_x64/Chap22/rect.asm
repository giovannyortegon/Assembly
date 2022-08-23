; rect.asm
section .data
section .bss
section .text
	global rarea
rarea:
	push rbp
	mov rbp, rsp

	mov rax, rdi
	imul rsi

	leave
	ret

section .text
	global rcircum
rcircum:
	push rbp
	mov rbp, rsp

	mov rax, rdi
	add rax, rsi
	imul rax, 2

	leave
	ret
