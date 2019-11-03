; or.asm - An example of OR logical operator
section .bss
	result resb 1

section .text
	global _start
_start:
	nop
	mov al, 5
	mov bl, 3
	xor	al, bl
	add	al, byte '0'

	mov [result], al
	mov	eax, 4
	mov ebx, 1
	mov ecx, result
	mov edx, 1
	int 0x80

outprog:
	mov eax, 1
	int 0x80
