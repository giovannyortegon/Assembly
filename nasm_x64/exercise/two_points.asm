; two_points.asm
; square_root((x_2 - x_1)^2 + (y_2 - y_1)^2)
extern printf
section .data
	fmt db "La distancia entre dos puentos es: %.2f", 10, 0
	x_1 dq 5.3
	x_2 dq 3.4
	y_1 dq 3.1
	y_2 dq 5.2
section .text
	global main
main:
	push rbp
	mov rbp, rsp

	movsd xmm0, [x_2]
	subsd xmm0, [x_1]
	mulsd xmm0, xmm0

	movsd xmm1, [y_2]
	subsd xmm1, [y_1]
	mulsd xmm1, xmm1

	addsd xmm0, xmm1
	sqrtsd xmm0, xmm0

	mov rdi, fmt
	mov rax, 1
	call printf

	leave
	ret
