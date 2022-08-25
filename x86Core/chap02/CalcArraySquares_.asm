	.model flat, c
	.code

CalcArraySquares_ proc
	push ebp
	mov ebp, esp

	push ebx
	push esi
	push edi

; Load arguments
	mov edi, [ebp + 8]					; y array empty
	mov esi, [ebp + 12]					; x array
	mov ecx, [ebp + 16]					; n

; Initialize array sum registers, calculate size of array in bytes
	xor eax, eax
	cmp ecx, 0
	jle EmptyArray
	shl ecx, 2							; ecx = size of array in bytes
	xor ebx, ebx

; Reapet loop until finished
@@:
	mov edx, [esi+ebx]					; x array
	imul edx, edx						; square x
	mov [edi + ebx], edx				; save square x in y
	add eax, edx						; sum array
	add ebx, 4							; add to index for next element
	cmp ebx, ecx
	jl @B								; jump if not finished

EmptyArray:
	pop edi
	pop esi
	pop ebx
	pop ebp
	ret

CalcArraySquares_ endp
	end