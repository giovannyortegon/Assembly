.model flat,c
	.code

CalcArraySquares_ proc
	push ebp
	mov ebp, esp

	push ebx
	push esi
	push edi

; Load arguments
	mov edi, [ebp+8]		; edi = 'y'
	mov esi, [ebp+12]		; esi = 'x'
	mov ecx, [ebp+16]		; ecx = 'n'
; Initialize array sum register
	xor eax, eax			; eax = 'sum'

; calculate size of array in byte
	cmp ecx, 0
	jle EmptyArray
	shl ecx, 2				; ecx = size of array in bytes
	xor ebx, ebx			; ebx = array element offset

; go through array with a loop
; repeat loop until finished
@@:	mov edx, [esi + ebx]	; load next x[i]
	imul edx, edx			; compute x[i] * x[i]
	mov [edi + ebx], edx	; save result to y[i]
	add eax, edx			; update array element offset
	add ebx, 4
	cmp ebx, ecx
	jl @B					; jump if not finished

EmptyArray:
	pop edi
	pop esi
	pop ebx
	pop ebp
	ret

CalcArraySquares_ endp
	end