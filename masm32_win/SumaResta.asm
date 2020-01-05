TITLE Suma y Resta, Version 2		(SumaResta2.asm)
; Este proggrama suma y resta entreros de 32 bits sin digno
; y almacena la suma en una variable

; INCLUDE Irvine32.inc
.data
val1 dword 10000h
val2 dword 40000h
val3 dword 20000h
valFinal dword ?

.code
main PROC
	mov eax, val1		; empieza con 10000h
	add eax, val2		; suma 40000h
	sub eax, val3		; resta 20000h
	mov valFinal, eax	; almacena el resultado (30000h)
	call DumpRegs		; muestra los registros
	exit
main ENDP
END main
