	.model flat, c
	.code

CalculateSums_ proc
	; prolog
	push ebp
	mov ebp, esp
	sub esp, 12

	push ebx
	push esi
	push edi

; load arguments
	mov eax, [ebp+8]		; eax = a
	mov ebx, [ebp+12]		; ebx = b
	mov ecx, [ebp+16]		; ecx = c
	mov edx, [ebp+20]		; edx = s1
	mov esi, [ebp+24]		; esi = s2
	mov edi, [ebp+28]		; edi = s3

; compute s1
	mov [ebp-12], eax
	add [ebp-12], ebx
	add [ebp-12], ecx		; final s1 result

; compute s2
	imul eax, eax
	imul ebx, ebx
	imul ecx, ecx
	mov [ebp-8], eax
	add [ebp-8], ebx
	add [ebp-8], ecx		; final s2 result

; compute s3
	imul eax, [ebp+8]
	imul ebx, [ebp+12]
	imul ecx, [ebp+16]
	mov [ebp-4], eax
	add [ebp-4], ebx
	add [ebp-4], ecx		; final s3 result

; save s1, s2 and s3
	mov eax, [ebp-12]
	mov [edx], eax			; save s1
	mov eax, [ebp-8]
	mov [esi], eax			; save s2
	mov eax, [ebp-4]
	mov [edi], eax			; save s3

; function epilog
	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp
	ret

CalculateSums_ endp
	end