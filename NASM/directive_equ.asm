; directive_equ - An example how to use equ directive
sys_exit	equ	1		; system call to exit
sys_write	equ	4		; system call to write
stdin		equ	0		; file description input
stdout		equ	1		; file description output

section .data
	msg1	db	'Hello, programmers', 0xa, 0xd
	len1	equ $ - msg1

	msg2	db	'Welcome to the  world of, ', 0xa, 0xd
	len2	equ $ - msg2

	msg3	db	'Linux assembly programming '
	len3	equ	$ - msg3

section .text
	global _start

_start:
	mov eax, sys_write
	mov ebx, stdout
	mov ecx, msg1
	mov edx, len1
	int 0x80

	mov eax, sys_write
	mov ebx, stdout
	mov ecx, msg2
	mov edx, len2
	int 0x80

	mov eax, sys_write
	mov ebx, stdout
	mov ecx, msg3
	mov edx, len3
	int 0x80

	mov eax, sys_exit
	int 0x80
