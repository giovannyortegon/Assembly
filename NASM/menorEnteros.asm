; menorEnteros.asm - busca el numero menor de tres numeros

section .data
	v1 dw 1
	v2 dw 2
	v3 dw 3

section .bss
	res resw 1

section .text
	global _start

_start:
	nop
	mov ax, [v1]
	cmp ax, [v2]
	jbe L1
	mov ax, [v2]
L1:
	cmp ax, [v3]
	jbe L2
	mov ax, [v3]
L2:
	mov word [res], ax

	mov eax, 1
	mov ebx, 0
	int 0x80
