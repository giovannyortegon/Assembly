; inc_dec.asm - An example to increment and decrement a value
segment .data
	count	dw	0
	value	db	50

segment .bss
	num resb 2

segment .text
	global _start
_start:
; increment count 35 times	
	times 35 inc word [count]
; print count
	mov eax, 4
	mov ebx, 1
	mov ecx, count
	mov edx, 1 
	int 0x80
; decrement value one time
	dec byte [value]
; print value
	mov eax, 4
	mov ebx, 1
	mov ecx, value
	mov edx, 1
	int 0x80
; move 100 to eax 
	mov eax, 100		; ascii 'd'
	inc eax				; ascii 'e'
;	sub eax, '0'		; convert to ascii adding '0' or 48 101 - 48 = 53 '5'
	mov [num], eax		; mov the stored of eax to num '5' or 'e'
; print num
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 2
	int 0x80
; called to sys_exit
	mov eax, 1
	mov ebx, 0
	int 0x80
