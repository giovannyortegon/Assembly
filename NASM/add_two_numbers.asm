# add_two_numbers.asm
section .data
	msg db 'The sum is: ', 0xa
	len equ	$ - msg
	num1 db	'12345'
	num2 db '23456'
	sum db '     '

section .text
	global _start

_start:
	mov esi, 4
	mov ecx, 5
	clc

add_loop:
	mov al, [num1 + esi]
	mov al, [num2 + esi]
	aaa
	pushf
	or	al, 30h
	popf

	mov [sum + esi], al
	dec esi
	loop add_loop

	mov eax, 4
	mov ebx, 1
	mov ecx, sum
	mov edx, 5
	int 0x80

	mov eax, 1
	int 0x80
