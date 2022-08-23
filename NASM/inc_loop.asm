; inc_loop.asm
top equ 9
ascii equ 48

section .data
	num db 1

section .text
	global _start
_start:

L1:
	mov eax, [num]
	add eax, ascii
	mov [num], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 1
	int 0x80

	mov eax, [num]
	sub eax, ascii
	inc eax
	mov [num], eax

	cmp eax, top
	jle L1

	mov eax, 1
	mov ebx, 0
	int 0x80
