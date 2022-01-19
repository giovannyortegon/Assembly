	.model flat, c
	.code
CalcMatrixRowColSums_ proc
	push ebp
	mov ebp, esp

	push ebx
	push esi
	push edi

; Make sure 'nrow' and 'ncol' are valid
	xor eax, eax						; error return code
	cmp dword ptr [ebp + 12], 0			; [ebp+12] = 'nrows'
	jle InvalidArg						; jump if nrows <= 0
	mov ecx, [ebp + 16]					; ecx = 'ncols'
	cmp ecx, 0
	jle InvalidArg						; jump if ncols <= 0

; Initialize elements of 'col_sums' array to zero
	mov edi, [ebp + 24]					; edi = 'col_sums'
	xor eax, eax						; eax = fill value
	rep stosd							; fill array with zeros

; Initialize outer loop variables
	mov ebx, [ebp+8]					; ebx = 'x'
	xor esi, esi						; i = 0

; outer loop
lp1:
	mov edi, [ebp + 20]					; edi = 'row_sums'
	mov dword ptr [edi+esi*4], 0		; row_sums[i] = 0

	xor edi, edi						; j = 0
	mov edx, esi						; edx = i
	imul edx, [ebp + 16]				; edx = i * ncols

; Inner loop
lp2:
	mov ecx, edx						; ecx = i * ncols
	add ecx, edi						; ecx = i * ncols + j
	mov eax, [ebx + ecx * 4]			; eax = x[i * ncols + j]
	mov ecx, [ebp + 20]					; eax = 'row_sums'
	add [ecx + esi * 4], eax			; row_sums[i] += eax
	mov ecx, [ebp + 24]					; ecx = 'col_sums'
	add [ecx+edi*4], eax				; col_sums[j] += eax

; is inner loop finished?
	inc edi								; j++
	cmp edi, [ebp+16]
	jl lp2								; jump if j < ncols

; is outer loop finished?
	inc esi								; jump if i < nrows
	cmp esi, [ebp+12]
	jl lp1								; jump if i < nrows
	mov eax, 1							; set success return code

InvalidArg:
	pop edi
	pop esi
	pop ebx
	pop ebp
	ret

CalcMatrixRowColSums_ endp
	end