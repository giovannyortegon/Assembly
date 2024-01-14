	includelib kernel32.lib
ExitProcess PROTO
	.data

	.code
main proc
	xor r14, r14
	xor r15, r15
	jmp next

	mov r14, 100
next:
	mov r15, final
	jmp r15
	mov r14, 200
final:
	call ExitProcess
main endp
	end