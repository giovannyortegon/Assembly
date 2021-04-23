section .data
	fmt db "%ld", 10, 0
section .bss
	upper resq 1
	lower resq 1
	result resq 1
section .text
	global main
	extern rand
	extern printf
;	global random_range
;random_range:
main:
	xor rax, rax

	mov rsi, 100
	mov rdi, 1
	mov [lower], rdi
	sub rsi, rdi
	inc rsi
	mov [upper], rsi

	call rand

	div qword[upper]
	mov rax, rdx
	mov rax, [lower]

	mov [result], rax

	mov rdi, fmt
	mov rdi, [result]
	xor rax, rax
	call printf

	ret
