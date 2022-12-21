	includelib kernel32.lib
ExitProcess PROTO
	.data

	.code
main proc
	xor rcx, rcx
	mov rcx, 0111b
	test rcx, 0001b

	mov rcx, 1000b
	test rcx, 0001b

	mov rcx, 0111b
	test rcx, 0100b

	mov rcx, 1000b
	test rcx, 0100b

	call ExitProcess
main endp
	end