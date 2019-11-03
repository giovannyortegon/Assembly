section .bss
	result resb 1

section .text
	global _start

_start:
	mov al, 5
	not al
	add al, byte '0'

	mov [result], al
	
	mov eax, 4
	mov ebx, 1
	mov ecx, result
	mov edx, 1
	int 0x80

	mov eax, 1
	int 0x80
