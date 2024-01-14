	.model flat, c
	.const
r8_4pO	real8 4.0
r8_3pO	real8 3.0

; extern "C" bool CalcSphereAreaVlume_(double r, double * sa, double *v);
;
; Description:	This function calculates the surface area and volume
;				of a sphere.
;
; Return:		0 = invalid radius.
;				1 = valid radius.
;
	.code
CalcSphereAreaVlume_	proc
	push ebp
	mov ebp, esp

; Make sure radius is valid.
	xor eax, eax
	fld real8 ptr [ebp + 8]
	fldz
	fcomip st(0), st(1)
	fstp st(0)
	jp Done
	ja Done

; Calculate sphere surface area
	fld real8 ptr [ebp + 8]
	fld st(0)
	fmul st(0), st(0)
	fldpi
	fmul [r8_4pO]
	fmulp

	mov edx, [ebp + 16]
	fst real8 ptr [edx]

; Calculate sphere volumn
	fmulp
	fdiv [r8_3pO]

	mov edx, [ebp + 20]
	fstp real8 ptr [edx]

	mov eax, 1

Done:
	pop ebp
	ret 
CalcSphereAreaVlume_	endp
	end