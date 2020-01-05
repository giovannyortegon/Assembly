; convert_ascii.asm - An example onverted this input data in ASCII
section .data
	msg		db		"The sum is: ", 0xa, 0xd
	len		equ		$ - msg

segment .bss
	sum resb 1

section .text
	global _start

_start:
	mov eax, '3'
	sub	eax, '0'

	mov ebx, '4'
	sub ebx, '0'
	add eax, ebx
	add eax, '0'

	mov [sum], eax

	mov eax, 4
	mov ebx, 1
	mov	ecx, msg
	mov edx, len
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, sum
	mov edx, 1
	int 0x80

	mov eax, 1
	int 0x80
