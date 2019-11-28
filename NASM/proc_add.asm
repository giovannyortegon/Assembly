; proc_add.asm - Simple procedure named sum that adds the variables 
;				 stored in the ECX and EDX register and returns the 
;				 sum in the EAX register.
section .data
	msg db "The sum is: ", 0xa, 0xd
	len equ $ - msg

segment .bss
	res resb 1

section .text
	global _start

_start:
	mov ecx, '4'
	sub	ecx, '0'

	mov edx, '5'
	sub edx, '0'

	call sum
	mov [res], eax
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80

sum:
	mov eax, ecx
	add eax, edx
	add eax, '0'
	ret
