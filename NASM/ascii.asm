# ascii.asm - AAS instruction to demonstrate the concept 
section .data
	msg db 'Te result is: ', 0xa
	len equ $ - msg
section .bss
	res resb 1

section .text
	global _start

_start:
	sub ah, ah
	mov al, '9'
	sub al, '3'
	aas
	or al, 30h
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
