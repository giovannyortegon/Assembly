; Shows how factorial n is implemented in assembly language. 
; To keep the program simple, we will calculate factorial 3.
section .data
	msg db 'Factorial 3 is: ', 0xa
	len equ $ - msg

section .bss
	fact resb 1

section .text
	global _start

_start:
	mov bx, 3
	call proc_fact
	add ax, 30h
	mov [fact], ax

	mov eax, 4
	mov ebx, 1
	mov ecx, fact
	mov edx, 1
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80

proc_fact:
	cmp bl, 1
	jg do_calculation
	mov ax, 1
	ret

do_calculation:
	dec bl
	call proc_fact
	inc bl
	mul bl
	ret
