BIT32					; Tell nasm this is 32 bit code.

	call mark_below		; Call below the string to instructions
	db "Hello World", 0x0a, 0x0d	; with new ine and carriage return by bytes
mark_below:
	; ssize_t write(int fd, const void *buf, size_t count);
	pop ecx			; Pop the return address (string ptr) into ecx.
	mov eax, 4		; Writer syscall #
	mov ebx, 1		; STDOUT file descriptor
	mov edx, 15		; Length of the string
	int 0x80

; void _exit(int status);
	mov eax, 1		; Exit syscall #
	mov ebx, 0		; Status = 0
	int 0x80
