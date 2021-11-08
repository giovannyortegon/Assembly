; hellow.asm
%include "win32n.inc"
	extern ExitProcess
	extern MessageBoxA
section .data
	msg db "Welcome to Windows World!", 0
	cap db "Windosw 10 says: ", 0

section .text
	global main
main:
	push rbp
	mov rbp, rsp

	; int MessageBoxA (
	; HWND hWnd,		ownwer windows
	; LPCSTR lpText,	text to display
	; LPCSTR lpcAPTION,	window caption
	; UNIT uTyoe		window behavior
	; );
	mov rcx, 0			; no window owner
	lea rdx, [msg]		; lpText
	lea r8, [cap]		; lpCaption
	mov r9d, MB_OK		; window with open OK buttom
	sub rsp, 32			; shadowspace
	call MessageBoxA	; returns ID OK =1 if OK button slected
	add rsp, 32

	leave
	ret
