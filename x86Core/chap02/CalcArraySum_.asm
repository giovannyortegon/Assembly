	.model flat, c
	.code

CalcArraySum_ proc

	push ebp
	mov ebp, esp

; Load arguments and initialize sum
	mov edx, [ebp + 8]
	mov ecx, [ebp + 12]
	xor eax, eax

; Make sure 'n' is greater than zero
	cmp ecx, 0
	jle InvalidCount

; Calculate the array element
@@:
	add eax, [edx]
	add edx, 4
	dec ecx
	jnz @B

InvalidCount:
	pop ebp
	ret

CalcArraySum_ endp
	end