section .data
	userMsg		db	'Please enter a number: '
	lenMsg		equ 	$ - userMsg
	dispMsg		db	'You have entered: '
	lenDisp		equ	$ - dispMsg

section .bss
	num 	resb	5	; Data uninitialized

section .text
	global _start
_start:
	mov eax, 4		; Write " Please enter number: "
	mov ebx, 1
	mov ecx, userMsg
	mov edx, lenMsg
	int 0x80

	; Read or get user input
	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 5		; 5 bytes ( 1 for sign)
	int 0x80

	; OUtput		'The entered number is: '
	mov eax, 4
	mov ebx, 1
	mov ecx, dispMsg
	mov edx, lenDisp
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 0x80
	; Exit code
	mov eax, 1
	mov ebx, 0
	int 0x80

