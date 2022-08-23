include \masm32\include\masm32rt.inc
.Const

touble equ 0ABADDEEDh

.Data?

.Data

hInst		HINSTANCE	NULL
buffer db 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
bword  dw 25
bdouble dd 0DEADBEEFh

.Code

start:
	Invoke GetModuleHandle, NULL
	Mov hInst, Eax
	
    mov al, [buffer]
    mov al, [buffer + 1]
    mov ax, bword
    mov eax, bdouble
    mov eax, touble
    mov bdouble, eax

	Invoke ExitProcess, 0
End start