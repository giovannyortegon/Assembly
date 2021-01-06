	includelib kernel32.lib

ExitProcess proto

	.code
main proc			; Program external
	mov rcx, 78		; Immediate load of registers RCX
	call ExitProcess	; Return  CPU control to Windows
main endp
end
