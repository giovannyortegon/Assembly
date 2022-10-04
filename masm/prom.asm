section .text		;code segment
	global _start	;must be declarred for linker

_start:				;tell linker entry point
	mov edx, len	;message length
	mov ecx, msg	;mesage to write
	mov ebx, 1		;file descriptor (stdout)
	mov eax, 4		;system call number (sys_wirte)
	int 0x80		;call kernel

	mov eax, 1		;system call number (sys_exit)
	int 0x80		;call kernel

section .data		;data segment
	msg	db	'Hello, World', 0xa	;our dear string
	len	equ	$ - msg				;length of our dear string
