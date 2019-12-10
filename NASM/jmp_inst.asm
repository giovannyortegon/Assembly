section .data
	arr db 1, 2, 3, 4
section .text
	global _start
_start:

	mov esi, arr
	mov ebx, 0
arreglo:
	mov al, [esi + ebx]
	add esi, 1
	inc ebx
	cmp ebx, 4
	jge exit
	jmp arreglo
exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
