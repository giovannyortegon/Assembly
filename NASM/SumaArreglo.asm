; SumaArreglo.asm
section .data
	arr dw 100h, 200h, 300h, 400h
	len equ $ - arr
section .text
	global _start
_start:
	mov edi, arr
	mov ecx, 4
	mov ax, 0
L1:
	add ax, [edi]
	add edi, 2 
	loop L1

	mov eax, 1
	mov eax, 0
	int 0x80
