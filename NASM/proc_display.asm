; proc_display.asm
; Displays the entire ASCII character set.
; The main program calls a procedure named display, 
; which displays the ASCII character set.
section .data
	achar db '0'

section .text
	global _start

_start:
	call display
	mov eax, 1
	mov ebx, 0
	int 0x80

display:
	mov ecx, 80

next:
	push ecx
	mov eax, 4
	mov ebx, 1
	mov ecx, achar
	mov edx, 1
	int 0x80

	pop ecx
	mov dx, [achar]
	cmp byte [achar], 7Fh
	inc byte [achar]
	loop next
	ret
