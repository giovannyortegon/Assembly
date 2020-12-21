section .text
		global _start		;must be declared for linker (gcc)

_start:					;tell linker entry point
		mov eax,4			;system call number (sys_write)
		mov ebx,1			;file descriptor (stdout)
		mov ecx,msg			;message to wirte
		mov edx,len			;message lenght
		int 0x80		;call kernel

		mov eax,4			;call kernel
		mov ebx,1			;file descriptor (stdout)
		mov ecx,s2			;message to wirte
		mov edx,9			;message length 9
		int 0x80

		mov eax,1			;system call number (sys_exit)
		int 0x80				;call kernel

section .data
msg db 'Displaying 9 Starts',0xa	;a message
len equ $ - msg					;length of message
s2 times 9 db '*',0xa
