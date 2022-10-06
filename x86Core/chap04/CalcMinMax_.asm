	.model flat, c
	.const
r4_MinFloat dword 0ff7fffffh			; smallest float number
r4_MaxFloat dword  7f7fffffh			; largest float number
	.code
; extern "C" bool CalcMinMax_(const float *, int, float *, float *);
;
; Description:	The following function calculates the min and max values
;				of a single-precision floating-point array.
;
; Return:		0 = invalid 'n'
;				1 = valid 'n' 
;
CalcMinMax_ proc
	push ebp
	mov ebp, esp

; Load argument values and make sure 'n' is valid.
	xor eax, eax
	mov edx, [ebp+8]
	mov ecx, [ebp+12]
	test ecx, ecx
	jle Done

	fld [r4_MinFloat]
	fld [r4_MaxFloat]

; find min and max of input array
@@:
	fld real4 ptr [edx]
	fld st(0)

	fcomi st(0), st(2)
	fcmovnb st(0), st(2)
	fstp st(2)

	fcomi st(0), st(2)
	fcmovb st(0), st(2)
	fstp st(2)

	add edx, 4
	dec ecx
	jnz @B

; Save reuslts
	mov eax, [ebp+16]
	fstp real4 ptr [eax]
	mov eax, [ebp+20]
	fstp real4 ptr [eax]
	mov eax, 1

Done:
	pop ebp
	ret
CalcMinMax_ endp
	end