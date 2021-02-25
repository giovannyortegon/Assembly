; fibonacci.asm
section .data
	msg db "%ld", 10, 0
	arr db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
section .bss
	buffer resb 10
	idx resd 1
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


	mov [arr], rbx
	mov [buffer], rbx

L2:
	cmp rdx, 9
	jl L1
	jmp end

L1:
	inc rdx
          add rbx, rax
           
	mov [arr+rdx], rbx
	mov [buffer+rdx], rbx
	mov [idx], rbx
          
          mov rcx, rbx
	mov rbx, rax
	mov rax, rcx
	

	jmp L2

end:
	mov rsp, rbp
	pop rbp
	ret
