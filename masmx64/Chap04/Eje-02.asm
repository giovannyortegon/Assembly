    includelib ..\Lib\kernel32.Lib
GetStdHandle    proto
WriteConsoleA   proto
ReadConsoleA    proto
ExitProcess     proto
Console         equ         -11
Keyboard        equ         -10
MaxBuf          equ         20

    .code
main proc
    sub rsp, 40

    mov rcx, Console
    call GetStdHandle
    mov stdout, rax

    mov rcx, Keyboard
    call GetStdHandle
    mov stdin, rax

nxtlin:
; Display message to input message
    mov rcx, stdout
    lea rdx, msg
    mov r8, lengthof msg
    lea r9, nbwr
    call WriteConsoleA

; Read input from user keyborad
    mov rcx, stdin
    lea rdx, keymsg
    mov r8, MaxBuf
    lea r9, nbrd
    call ReadConsoleA

; Echo line just input back to the user onw character at a time
    lea r12, keymsg
    mov r13, nbrd

    mov r14, MaxBuf
    cmp r14, nbrd
    jge Exit
; Print each character of input console
inloop:
    mov rcx, stdout
    mov rdx, r12
    mov r8, 1
    lea r9, nbwr
    call WriteConsoleA

    mov rcx, stdout
    lea rdx, newln
    mov r8, 2
    lea r9, nbwr
    call WriteConsoleA

    inc r12
    dec r13
    jg inloop

; Go get another line
    mov r8, nbrd
    cmp r8, 2
    jg nxtlin
Exit:
    add rsp, 40             ; restore "shadow space"

; exit
    mov rcx, 0
    call ExitProcess

main endp
    .data
msg byte "Please enter text message: ",0ah
keymsg byte MaxBuf dup (?)
newln byte 0dh,0ah
stdout qword ?
nbwr qword ?
stdin qword ?
nbrd qword ?
    end