section .data
	arr1 dw	1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	arr2 dw 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
	res_arr dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

section .text
	global _start
_start:
	mov edi, 0
loop:
	mov eax, [arr1+edi]
	mov ebx, [arr2+edi]

	mul ebx

	mov [res_arr+edi], eax

	inc edi
	cmp edi, 10
	jne loop

	mov eax, 1
	mov ebx, 0
	int 0x80
