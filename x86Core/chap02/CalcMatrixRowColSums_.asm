<<<<<<< HEAD
	.model flat, c
	.code
; extern "C" int CalcMatrixRowColSums_(const int * x, int nrows, int ncols, int * row_sums, int * col_sums);
CalcMatrixRowColSums_ proc
	push ebp
	mov ebp, esp

	push ebx
	push esi
	push edi

; Make sure "nrow" and "ncols" ara valid
	xor eax, eax				; error return
	cmp dword ptr [ebp + 12], 0	; [ebp+12] = 'nrows'
	jle InvalidArg				; jump if nrow <= 0
	mov ecx, [ebp + 16]			; ecx = 'ncols'
	cmp ecx, 0
	jle InvalidArg				; jump if ncols <= 0

; Invalide elements of 'cols_sums' array to zero
	mov edi, [ebp + 24]			; cols_sums
	xor eax, eax				; eax is fill value (0)
	rep stosd					; fill arrat with zeros

; Initialize outer loop variables
	mov ebx, [ebp + 8]			; ebx = 'x'
	xor esi, esi				; i = 0

; Outer loop
Lp1:
	mov edi, [ebp + 20]					; edi = 'row_sums'
	mov dword ptr [edi + esi * 4], 0	; row_sums[i] = 0

	xor edi, edi				; j = 0
	mov edx, esi				; edx = i
	imul edx, [ebp + 16]		; edx = i * ncols

; Inner loop
Lp2:
	mov ecx, edx				; ecx = i * ncols
	add ecx, edi				; ecx = i * ncols + j
	mov eax, [ebx + ecx * 4]	; eax = x[i * ncols + j]
	mov ecx, [ebp + 20]			; ecx = 'row_sums'
	add [ecx + esi * 4], eax	; row_sums[i] += eax
	mov ecx, [ebp + 24]			; ecx = 'col_sums'
	add [ecx + edi * 4], eax	; col_sums[j] += eax

; Is inner loop finished?
	inc edi						; j++
	cmp edi, [ebp + 16]
	jl Lp2						; jmp if j < ncols

; Is outer loop finished?
	inc esi						; i++
	cmp esi, [ebp + 12]
	jl Lp1						; jump is i < nrows
	mov eax, 1					; set success return code

InvalidArg:
	pop edi
	pop esi
	pop ebx
	pop ebp
	ret

CalcMatrixRowColSums_ endp
=======
	.model flat, c
	.code
; extern "C" int CalcMatrixRowColSums_(const int * x, int nrows, int ncols, int * row_sums, int * col_sums);
CalcMatrixRowColSums_ proc
	push ebp
	mov ebp, esp

	push ebx
	push esi
	push edi

; Make sure "nrow" and "ncols" ara valid
	xor eax, eax				; error return
	cmp dword ptr [ebp + 12], 0	; [ebp+12] = 'nrows'
	jle InvalidArg				; jump if nrow <= 0
	mov ecx, [ebp + 16]			; ecx = 'ncols'
	cmp ecx, 0
	jle InvalidArg				; jump if ncols <= 0

; Invalide elements of 'cols_sums' array to zero
	mov edi, [ebp + 24]			; cols_sums
	xor eax, eax				; eax is fill value (0)
	rep stosd					; fill arrat with zeros

; Initialize outer loop variables
	mov ebx, [ebp + 8]			; ebx = 'x'
	xor esi, esi				; i = 0

; Outer loop
Lp1:
	mov edi, [ebp + 20]					; edi = 'row_sums'
	mov dword ptr [edi + esi * 4], 0	; row_sums[i] = 0

	xor edi, edi				; j = 0
	mov edx, esi				; edx = i
	imul edx, [ebp + 16]		; edx = i * ncols

; Inner loop
Lp2:
	mov ecx, edx				; ecx = i * ncols
	add ecx, edi				; ecx = i * ncols + j
	mov eax, [ebx + ecx * 4]	; eax = x[i * ncols + j]
	mov ecx, [ebp + 20]			; ecx = 'row_sums'
	add [ecx + esi * 4], eax	; row_sums[i] += eax
	mov ecx, [ebp + 24]			; ecx = 'col_sums'
	add [ecx + edi * 4], eax	; col_sums[j] += eax

; Is inner loop finished?
	inc edi						; j++
	cmp edi, [ebp + 16]
	jl Lp2						; jmp if j < ncols

; Is outer loop finished?
	inc esi						; i++
	cmp esi, [ebp + 12]
	jl Lp1						; jump is i < nrows
	mov eax, 1					; set success return code

InvalidArg:
	pop edi
	pop esi
	pop ebx
	pop ebp
	ret

CalcMatrixRowColSums_ endp
>>>>>>> 27e6d01ab742ee419a449160db6f0a6e7337afcb
	end