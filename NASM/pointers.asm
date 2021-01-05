; pointes.asm - An example of hot to use pinters
section .data
arregloB db 10h, 20h, 30h
arregloW dw 1, 2, 3
arregloD dd 4, 5, 6
section .text
	global _start
_start:
	mov esi, arregloB
	mov al, [esi+1]
	mov esi, arregloW
	mov ax, [esi]
	mov esi, arregloD
	mov eax, [esi]

	mov eax, 1
	mov ebx, 0
	int 0x80
