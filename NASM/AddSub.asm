; TITLE Addition and Subtraction	(AddSub3)
section .data 
	Xval dd	26
	Yval dd	30
	Zval dd	40

section .bss
	Rval resd 4

section .text
	global _start

_start:
	; INC and DEC
	mov ax, 1000h
	inc ax
	dec ax
	; Expresision: Rval = -Xval + (Yval - Zval)
	mov eax, Xval
	neg eax						; -26
	mov ebx, Yval
	sub edx, Zval				; -10
	add eax, ebx
	mov eax, Rval			; -36

	; Zero flag example:
	mov cx, 1
	sub cx, 1					; ZF = 1
	mov ax, 0FFFFh
	inc ax						; ZF = 1

	; Sign flag example:
	mov cx, 0
	sub cx, 1					; SF = 1
	mov ax, 7FFFh
	add ax, 2

	; Carry flag example:
	mov al, 0FFh
	add al, 1					; CF = 1, AL = 00

	; Overflow flag example:
	mov al, +127
	add al, 1
	mov al, -128
	sub al, 1

	mov eax, 1
	int 0x80
