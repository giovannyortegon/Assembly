; fibonacci.asm
extern printf
section .data
	msg db "%ld", 10, 0
	arr dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
section .bss
	idx resw 1
section .text
	global main
main:
	push rbp
	mov rbp, rsp

	xor rax, rax
	inc rax
	xor rbx, rbx
	xor rcx, rcx
	xor rdx, rdx
	xor rdi, rdx
	xor r10, r10

	mov [arr+rdi], rbx

L2:
	cmp rdi, 10
	jl L1
	jmp end

L1:
	inc rdi
	add rax, rbx

	mov [arr+rdi], rbx
	mov [idx], rbx

	push rdi
	push rax

	mov rdi, msg
	mov rsi, [idx]
	xor rax, rax
	call printf

	pop rax
	pop rdi

	mov rcx, rbx
	mov rbx, rax
	mov rax, rcx

	jmp L2

end:
	mov rsp, rbp
	pop rbp
	ret
