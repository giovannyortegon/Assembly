	includelib kernel32.lib
ExitProcess PROTO
	.data

	.code
main proc
	xor rcx, rcx

	mov cl, 255
	add cl, 1
	mov cl, 127
	add cl, 1

	call ExitProcess
main endp
	end