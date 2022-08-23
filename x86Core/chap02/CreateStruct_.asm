<<<<<<< HEAD
	.model flat, c
	include TestStruct_.inc
	extern malloc:proc
	extern free:proc
	.code
; extern "C" TestStruct * CreateStruct_(__int8, __int16, __int32, __int64);
; Description:	This function allocate and initializes a new TestStruct
; Return:		A pointer to the new TestStruct or NULL
CreateStruct_ proc
	push ebp
	mov ebp, esp

; Allocate a block memory
; malloc return a memory block to eax
	push sizeof TestStruct
	call malloc
	add esp, 4
	or eax, eax				; NULL pointer Test
	jz MallocError			; Jump if malloc failed.

; Initialize the new TestStruct
	mov dl, [ebp + 8]
	mov [eax + TestStruct.Val8], dl

	mov dx, [ebp + 12]
	mov [eax + TestStruct.Val16], dx

	mov edx, [ebp + 16]
	mov [eax + TestStruct.Val32], edx

	mov ecx, [ebp + 20]
	mov edx, [ebp + 24]
	mov dword ptr [eax + TestStruct.Val64], ecx
	mov dword ptr [eax + TestStruct.Val64 + 4], edx

MallocError:
	pop ebp 
	ret

CreateStruct_ endp

; extern "C" void ReleaseTestStruct_(TestStruct *);
; Description:	This funciton release a previously created TestStruct
; Return:		None
ReleaseTestStruct_ proc
	push ebp
	mov ebp, esp

; Call free() to release previously created TestStruct
	push [ebp + 8]
	call free
	add esp, 4

	pop ebp 
	ret
ReleaseTestStruct_ endp
=======
	.model flat, c
	include TestStruct_.inc
	extern malloc:proc
	extern free:proc
	.code
; extern "C" TestStruct * CreateStruct_(__int8, __int16, __int32, __int64);
; Description:	This function allocate and initializes a new TestStruct
; Return:		A pointer to the new TestStruct or NULL
CreateStruct_ proc
	push ebp
	mov ebp, esp

; Allocate a block memory
; malloc return a memory block to eax
	push sizeof TestStruct
	call malloc
	add esp, 4
	or eax, eax				; NULL pointer Test
	jz MallocError			; Jump if malloc failed.

; Initialize the new TestStruct
	mov dl, [ebp + 8]
	mov [eax + TestStruct.Val8], dl

	mov dx, [ebp + 12]
	mov [eax + TestStruct.Val16], dx

	mov edx, [ebp + 16]
	mov [eax + TestStruct.Val32], edx

	mov ecx, [ebp + 20]
	mov edx, [ebp + 24]
	mov dword ptr [eax + TestStruct.Val64], ecx
	mov dword ptr [eax + TestStruct.Val64 + 4], edx

MallocError:
	pop ebp 
	ret

CreateStruct_ endp

; extern "C" void ReleaseTestStruct_(TestStruct *);
; Description:	This funciton release a previously created TestStruct
; Return:		None
ReleaseTestStruct_ proc
	push ebp
	mov ebp, esp

; Call free() to release previously created TestStruct
	push [ebp + 8]
	call free
	add esp, 4

	pop ebp 
	ret
ReleaseTestStruct_ endp
>>>>>>> 12f99e0939d0546bc7d3973165ffbb8826df7a8a
	end