	.model flat, c
	.code
; Returns:		0 Error
;				1 Success
;
; Computes:		* prod = a * b
;				* quo = a / b
;				* rem = a % b
;
; Arguments:
;				ebp + 8 = a
;				ebp + 12 = b
;				ebp + 16 = prod
;				ebp + 20 = quo
;				ebp + 24 = rem
; 
IntegerMulDiv_ proc
	; prologo
	push ebp
	mov ebp, esp
	push ebx

;make sure the divisor is not zero
	xor eax, eax
	mov ecx, [ebp+8]			; ecx = a
	mov edx, [ebp+12]			; edx = b
	or edx, edx
	jz InvalidDivisor			; jump if b is zero

; calculate product and save result
	imul edx, ecx				; edx = a * b
	mov ebx, [ebp+16]			; ebx = prod
	mov [ebx], edx				; save prod

; calculate quotient and remainder, save result
	mov eax, ecx				; eax = a
	cdq							; edx:eax contains dividend
	idiv dword ptr [ebp+12]		; eax = quo, edx = rm

	mov ebx, [ebp + 20]			; ebx = quo
	mov [ebx], eax				; save quotient
	mov ebx, [ebp+24]			; ebx = rem
	mov [ebx], edx				; save remainder
	mov eax, 1					; set success return code

	; epilog
InvalidDivisor:
	pop ebx
	pop ebp
	ret

IntegerMulDiv_ endp
	end