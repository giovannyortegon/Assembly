; avergae.asm
extern printf
section .data
	fmt db "El promedio es: %.2f", 10, 0
	n1 dq 3.4
	n2 dq 2.3
	n3 dq 3.4
	n4 dq 4.5
	n dq 4.0
section .bss
	result resq 16
section .text
	global main
main:
	push rbp
	mov rbp, rsp

	movsd xmm0, [n1]
	addsd xmm0, [n2]
	addsd xmm0, [n3]
	addsd xmm0, [n4]
	movsd xmm1, [n]
	divsd xmm0, xmm1

	mov rdi, fmt
	mov rax, 1
	call printf

	leave
	ret
