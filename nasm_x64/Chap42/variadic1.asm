; variadic1.asm
section .data
	one dq 1.0
	two dq 2.0
	three dq 3.0
	fmt dq "The values are: %.1f  %.1f %.1f", 10, 0
	
section .bss
section .text
	global main
	extern printf
main:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	
	mov rcx, fmt
	movq xmm0, [one]
	movq rdx, xmm0
	movq xmm1, [two]
	movq r8, xmm1
	movq xmm2, [three]
	movq r9, xmm2
	call printf
	add rsp, 32
	
	leave
	ret