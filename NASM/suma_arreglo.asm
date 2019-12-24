; suma_arrgelo.asm
section .data
	arr dd 10000h, 20000h, 30000h, 40000h, 50000h
section .text
	global _start
_start:
	nop
	mov esi, arr
	mov ecx, 5
	call sumArr
	mov ebx, eax

	mov eax, 1
	int 0x80

sumArr:
	push esi
	push ecx
	mov eax, 0
L1:
	add eax, [esi]
;	inc esi
	add esi, 4
	loop L1

	pop ecx
	pop esi
	ret
