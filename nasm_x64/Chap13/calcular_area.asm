; calcular_area.asm
extern printf

section .data
	fmt db "Area is %.4f", 10, 0
	pi dq 3.14159265358979
	radio dq 120.0
section .text
area:
	push rbp
	mov rbp, rsp

	movsd xmm0, [radio]
	movsd xmm1, [pi]
	mulsd xmm0, xmm0
	mulsd xmm0, xmm1

	mov rdi, fmt
	mov rax, 1 
	call printf

	mov rsp, rbp
	pop rbp
	ret
; ----------------
	global main
main:
	push rbp
	mov rbp, rsp

	call area

	leave
	ret
