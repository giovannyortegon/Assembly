section .data
msg	db	'Displaying 9 stars', 0xa	; a message
len 	equ	$ - msg				; length of message
s2	times	9	db 	'*', 0xa

section .text
	global _start

_start:
	mov edx, len	; message length
	mov ecx, msg	; message to write
	mov ebx, 1	; file description (stdout)
	mov eax, 4	; sys_write
	int 0x80	; Call Kernel

	mov edx, 9	; times to show (length)
	mov ecx, s2	; write stars
	mov ebx, 1	; file descriptor (stdout)
	mov eax, 4	; sys_write
	int 0x80	; call kernel

	mov eax, 1	; system call (exit)
	int 0x80	; call kernel
