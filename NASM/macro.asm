; macro.asm - An example of a macro to print string
section .data
	msg1 db "Hello, Programers", 0xa, 0xd
	len1 equ $ - msg1
	
	msg2 db "Welcome to the world of", 0xa, 0xd
	len2 equ $ - msg2

	msg3 db "Linux assembly programming", 0xa, 0xd
	len3 equ $ - msg3
; Macro with two parameters
; Implement the write system call
	%macro write_string 2
		mov eax, 4
		mov ebx, 1
		mov ecx, %1
		mov edx, %2
		int 0x80
	%endmacro
section .text
	global _start

_start:
	write_string msg1, len1
	write_string msg2, len2
	write_string msg3, len3

	mov eax, 1
	mov ebx, 0
	int 0x80
