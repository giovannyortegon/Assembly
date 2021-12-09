	.model flat, c
; simple  lookup table(.const section data is read only)

		.const
FibVals dword 0, 1, 1, 2, 3, 5, 8, 13
		dword 21, 34, 55, 89, 144, 233, 377, 610

NumFibVals_ dword($ - FibVals) / sizeof dword
			public NumFibVals_

	.code
MemoryAddress_ proc
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi

; make sure 'i' is valid
	xor eax, eax
	mov ecx, [ebp + 8]
	cmp ecx, 0
	jl InvalidIndex
	cmp ecx, [NumFibVals_]
	jge InvalidIndex

; Example #1 - base register
	mov ebx, offset FibVals
	mov esi, [ebp + 8]
	shl esi, 2
	add ebx, esi
	mov eax, [ebx]
	mov edi, [ebp + 12]
	mov [edi], eax

; Example #2 - base register + displacement
; esi is used as the base register
	mov esi, [ebp + 8]
	shl esi, 2
	mov eax, [esi + FibVals]
	mov edi, [ebp + 16]
	mov [edi], eax

; Example #3 - base register + index register
	mov ebx, offset FibVals
	mov esi, [ebp + 8]
	shl esi, 2
	mov eax, [ebx + esi]
	mov edi, [ebp + 20]
	mov [edi], eax

; Example #4 - base register + index register
	mov ebx, offset FibVals
	mov esi, [ebp + 8]
	mov eax, [ebx + esi * 4]
	mov edi, [ebp + 24]
	mov [edi], eax
	mov eax, 1

InvalidIndex:
	pop edi
	pop esi
	pop ebx
	pop ebp
	ret

MemoryAddress_ endp
	end