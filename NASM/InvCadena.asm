; InvCadena.asm - Invertir una cadena de caracteres
section .data
	nombre db "Abraham Lincon", 0xa
	tam equ ($ - nombre) - 1
section .text
	global _start
_start:
	nop
; Input name in stack
	mov ecx, tam
	mov esi, 0
L1:
	mov eax, [nombre + esi]
	push eax
	inc esi
	loop L1
; Output from stack
	mov ecx, tam
	mov esi, 0
L2:
	pop eax
	mov [nombre + esi], al
	inc esi
	loop L2
; Print name
	mov eax, 4
	mov ebx, 1
	mov ecx, nombre
	mov edx, tam
	int 0x80

;exit
	mov eax, 1
	mov ebx, 0
	int 0x80

