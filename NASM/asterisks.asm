; asterisks - An example of define an array
section .data
	stars times 9 db '*'
section .text
	global _start
_start:
	mov eax, 4			; sys_write
	mov ebx, 1			; file description
	mov ecx, stars		; move '*' to ecx
	mov edx, 9			; length
	int 0x80

	mov eax, 1
	int 0x80
