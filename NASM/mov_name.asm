; mov_name - this change a string in a data section of memory to another
section .data
name		db		'Zara Ali', 0xa

section .text
	global _start
_start:
	; write (print) name variable 'Zara Ali'
	mov eax, 4		; system call (sys_write)
	mov ebx, 1		; file descriptor
	mov ecx, name	; variable that store string 'Zara Ali'
	mov edx, 9		; length mesasge
	int 0x80

	mov [name], dword	'Nuha' ; Chanfe the name to 'Nuha Ali'

	; write (print) name 'NUha Ali'
	mov eax, 4
	mov ebx, 1
	mov ecx, name
	mov edx, 8
	int 0x80

	mov eax, 1		; sys_exit
	int 0x80
