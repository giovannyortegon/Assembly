; add_sub.asm - An example of adding and subtrading
; Call system
sys_exit	equ	1
sys_read	equ	3
sys_write	equ	4
; file description
stdin	equ	0
stdout	equ	1

segment .data
	msg1	db		"Enter a digit: ", 0xa, 0xd
	len1	equ		$ - msg1

	msg2	db		"Please enter a second digit: ", 0xa, 0xd
	len2	equ		$ - msg2

	msg3	db		"The sum is: "
	len3	equ		$ - msg3

segment .bss
	num1 resb 2
	num2 resb 2
	res	resb 1

segment .text
	global _start

_start:
;print msg1
	mov eax, sys_write
	mov ebx, stdout
	mov ecx, msg1
	mov edx, len1
	int 0x80
; get num1
	mov eax, sys_read
	mov ebx, stdin
	mov ecx, num1
	mov edx, 2
	int 0x80
; print msg2
	mov eax, sys_write
	mov ebx, stdout
	mov ecx, msg2
	mov edx, len2
	int 0x80
; get num2
	mov eax, sys_read
	mov ebx, stdin
	mov ecx, num2
	mov edx, 2
	int 0x80
; print msg3
	mov eax, sys_write
	mov ebx, stdout
	mov ecx, msg3
	mov edx, len3
	int 0x80
; move num1 to eax
	mov eax, [num1]
	sub eax, '0'		; converto to decimal
; move num2 to ebx
	mov ebx, [num2]
	sub ebx, '0'		; convert to decimal

; add eax and ebx
	add eax, ebx		; adding num1 and num2
	add eax, '0'		; convert to ASCII again
; mov for eax value to res, it is addign num1 and num2	
	mov [res], eax
; prent res
	mov eax, sys_write
	mov ebx, stdout
	mov ecx, res
	mov edx, 1
	int 0x80
; exit
exit:
	mov eax, sys_exit
	xor ebx, ebx
	int 0x80
