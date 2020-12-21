section .data	; declaraing and difine data
msg	db	"Hello World" , 0xa	; string to print
len	equ	$ - msg		; length of the string

section .text
	global _start	; Determine the way to linker ld

_start:			; entry point
	nop
	mov edx, len	; message length
	mov ecx, msg	; message to write
	mov ebx, 1	; file description (stdout)
	mov eax, 4	; system call number (sys_write)
	int 0x80	; Call kernel

	mov eax, 1	; System call (exit)
	int 0x80	; Call Kernel 
	
