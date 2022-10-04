	.model flat, c
	.const
r8_SfFtoC real8 0.5555555556			; 5 / 9
r8_SfCtoF real8 1.8						; 9 / 5
i4_32 dword 32

; extern "C" double FtoC_(double deg_f);
; Description:	Converts a temperature from Farhrentheit to Celsius.
; Returns:		Temperature

	.code
FtoC_ proc
	push ebp
	mov ebp, esp

	fld [r8_SfFtoC]			; loas 5/9
	fld real8 ptr [ebp + 8]	; load 'f'
	fild [i4_32]
	fsubp					; st(0) = f - 32
	fmulp			i		; st(0) = (f - 32) * 5/9

	pop ebp
	ret
FtoC_ endp

; extern "C" double CtoF_(double deg_c);
; Description:	Converts a temperature from Celsius to Farhrentheit.
; Returns:		Temperature in Farhrentheit.
CtoF_ proc
	push ebp
	mov ebp, esp

	fld real8 ptr [ebp + 8]
	fmul [r8_SfCtoF]
	fiadd [i4_32]

	pop ebp
	ret
CtoF_ endp
	end