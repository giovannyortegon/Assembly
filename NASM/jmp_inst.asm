section .data
	arr db "Hola"
section .text
	global _start
_start:

	mov esi, arr
	mov ebx, 0
arreglo:
	mov al, [esi + ebx]
	inc ebx
	cmp ebx, 4
	jge exit
	jmp arreglo
exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
