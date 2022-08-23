; define_directive - An example how to difeine directive
section .data
	choice DB 'y'
section .text
	global _start
_start:
	; Print character
	mov eax, 4			; sys_write
	mov ebx, 1			; file description
	mov ecx, choice		; move 'y' to ecx register
	mov edx, 1			; length 
	int 0x80

	mov eax, 1			; sys_exit
	int 0x80
