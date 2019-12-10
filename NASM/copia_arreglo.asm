; SumaArreglo.asm
section .data
	origen db "Esta es la cadena de origen", 0
	len equ $ - origen
section .bss
	destino resb 8
section .text
	global _start
_start:
	mov esi, 0
	mov ecx, len

L1:
	mov al, [origen + esi]
	mov [destino+esi], al
	inc esi
	loop L1

	mov eax, 1
	mov eax, 0
	int 0x80
