section .data
	arr dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
section .text
	global _start
_start:
	mov eax, 1
	xor ebx, ebx
	xor ecx, ecx
	xor edi, edi
loop:
	add eax, ebx
	mov ecx, ebx
	mov ebx, eax
	mov eax, ecx

	mov [arr+edi], eax

	inc edi
	cmp edi, 10
	jne loop

	mov eax, 1
	mov ebx, 0
	int 0x80
