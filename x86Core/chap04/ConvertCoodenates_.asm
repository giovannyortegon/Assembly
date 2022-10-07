	.model flat, c
	.const
DegToRad real8 0.01745329252
RadToDeg real8 57.2957795131

; extern "C" void RectToPolar_(double, double, double *, double *);
; Description:	This funciton converts a rectangular coordinate to a
;				polar coordinate;
;
	.code
RectToPolar_	proc
	push ebp
	mov ebp, esp

; Calculate the angle. Note that fpatan computes atan2(st(1) / st(0))
	fld real8 ptr [ebp + 16]		; load y
	fld real8 ptr [ebp + 8]			; load x
	fpatan							; calc atan (y / x)
	fmul [RadToDeg]				; convert angle to degrees
	mov eax, [ebp + 28]
	fstp real8 ptr [eax]			; save angle

; Calculate the radius
	fld real8 ptr [ebp + 8]			; load x
	fmul st(0), st(0)				; x * x
	fld real8 ptr [ebp + 16]		; load y
	fmul st(0), st(0)				; y * y
	faddp							; x * x + y * y
	fsqrt							; sqrt( x * x + y * y)
	mov eax, [ebp + 24]				
	fstp real8 ptr [eax]			; save radius

	pop ebp
	ret 
RectToPolar_	endp
; extern "C" void Polar_toRect_(double, double, double *, double *);
;
; Description:	The following function converts a polar coordinate
;				to a regular coordinates.
Polar_toRect_ proc
	push ebp
	mov ebp, esp

; Calculate sin(a) and cos(a)
; following execution of fsincos, st(0) = cos(a) and st(1) = sin(a)
	fld real8 ptr[ebp + 16]			; load angle in degrees
	fmul [DegToRad]					; convert angle to radius
	fsincos							; calc sin(st(0) and cos(st(0)))
	fmul real8 ptr [ebp + 8]		; x = r * cos(a)

	mov eax, [ebp + 24]
	fstp real8 ptr [eax]			; save x

	fmul real8 ptr [ebp + 8]		; y = r * sin(a)
	mov eax, [ebp + 28]
	fstp real8 ptr [eax]			; save y

	pop ebp
	ret
Polar_toRect_ endp
	end