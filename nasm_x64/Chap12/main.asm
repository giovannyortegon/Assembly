section .data
	fmt: db "%s %d", 0x0a, 0
	msg: db "La suma de dos numero es: "

section .bss
	resultado resw 1
section .text
	global main
	extern printf
	extern suma

main:
	push rbp
	mov rbp, rsp

	mov rdi, 10
	mov rsi, 20
	call suma

	mov [resultado], rax

	mov rdi, fmt
	mov rsi, msg
	mov rdx, rax
	xor rax, [resultado]
	call printf

	leave
	ret
