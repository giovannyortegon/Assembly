	.model flat, c
	include TestStruct_.inc
	extern malloc:proc
	extern free:proc

	.code
CreateTestStruct_ proc
	push ebp
	mov ebp, esp

; Allocate a block for the new TestStruct, note that
; malloc() returns a pointer to memory block in EAX
	push sizeof TestStruct
	call malloc

	add esp, 4
	or eax, eax				; NULL pointer test
	jz MallocError			; Jump if malloc failed

; Initialize the new TestStruct
	mov dl, [ebp + 8]
	mov [eax + TestStruct.Val8], dl

	mov dx, [ebp + 12]
	mov[eax + TestStruct.Val16], dx

	mov edx, [ebp + 16]
	mov [eax + TestStruct.Val32], edx

	mov ecx, [ebp + 20]
	mov edx, [ebp + 24]
	mov dword ptr [eax + TestStruct.Val64], ecx
	mov dword ptr [eax + TestStruct.Val64 + 4], edx

MallocError:
	pop ebp
	ret

CreateTestStruct_ endp

ReleaseTestStruct_ proc
	push ebp
	mov ebp, esp

; call free() to release previously created TestStruct
	push [ebp + 8]
	call free
	add esp, 4

	pop ebp
	ret

ReleaseTestStruct_ endp 
	end