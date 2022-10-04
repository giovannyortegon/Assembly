SYS_WR equ 1
SYS_EXIT equ 60
STDOUT equ 1

section .data
	; int a = 0;
	texto db "Carlos",0xa, 0
	Len_text equ $ - texto
	arr db 1, 2, 3, 4, 5
		db 6, 7, 8, 9, 10
	a db 34		; 8 bit
	b dw 23		; 16 bit
	c dd 10		; 32 bit
;	d qd 20		; 64 bits
;	e time 10 db '*'		; e[10] = {'*','*', ...  }
section .bss
	a1 resq 1
section .text
	global _start		; GNU C main printf scanf todas las funciones en C
_start:
	mov rax, SYS_WR		; write
	mov rdi, STDOUT		; std output
	mov rsi, texto		; cadena de  texto
	mov rdx, Len_text	; la longoitude del texto
	syscall				; llamamos write

	; mov <dest>, <source>
	mov rax, SYS_EXIT
	mov rdi, 16
	syscall
