; print_number.asm
ascii equ 48
section .data
	num equ 5

section .bss
	number resb 1

section .text

	global _start

_start:
	mov eax, num
	add eax, ascii
	mov [number], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, number
	mov edx, 1
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
