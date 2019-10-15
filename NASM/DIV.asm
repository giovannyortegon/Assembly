; DIV.asm - An exmaple of division
section .data
	msg db "The result is: ", 0xa, 0xd
	len equ $ - msg

segment .bss
	res resb 1

section .text
	global _start

_start:
	nop
	mov ax, '8'
	sub ax, '0'

	mov bl, '2'
	sub bl, '0'
	div bl

	add ax, '0'

	mov [res], ax
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80

	mov eax, 1
	int 0x80
