global NumFibVals_
section .data
	FibVals dw 0, 1, 1, 2, 3, 5, 8, 13
			dw 21, 34, 55, 89, 144, 233, 377, 610
section .bss
	NumFibVals_ resw 1

section .text
;	global _start
	global MemoryAddress_

;_start:
MemoryAddress_:
	push ebp
	mov ebp, esp

	push ebx
	push esi
	push edi

	mov dword[NumFibVals_], 16
	; i
	xor eax, eax
	mov ecx, [ebp + 8]
	cmp ecx, 0
	jl InvalidIndex
	cmp ecx, [NumFibVals_]
	jge InvalidIndex

; example #1 base register
	lea ebx, FibVals
	mov esi, [ebp + 8]
	shl esi, 2
	add ebx, esi
	mov eax, [ebx]
	mov edi, [ebp + 12]
	mov [edi], eax

; example #2 base register + displacement
	mov esi, [ebp+8]
	shl esi, 2
	mov eax, [FibVals+esi]
	mov edi, [ebp + 16]
	mov [edi], eax

; example #3 base register + index register
	lea ebx, FibVals
	mov esi, 2
	mov eax, [ebx + esi]
	mov edi, [ebp + 20]
	mov [edi], eax

; example #4 base register + index register
	lea ebx, FibVals
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
