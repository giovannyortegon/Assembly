    includelib ..\Lib\kernel32.Lib
GetStdHandle    proto
WriteConsoleA   proto
ReadConsoleA    proto
ExitProcess     proto
Console         equ     -11
Keyboard        equ     -10
MaxBuf          equ     20
    .code
main proc
    sub rsp, 40             ; reserve 'shadow space'

; Obtain "handle" for console I/O streams
    ; console standard output handle
    mov rcx, Console
    call GetStdHandle
    mov stdout, rax
    ; console standard input handle
    mov rcx, Keyboard
    call GetStdHandle
    mov stdin, rax

; Display the prompt message.
nxtlin:
    mov rcx, stdout
    lea rdx, msg
    mov r8, lengthof msg
    lea r9, nbwr
    call WriteConsoleA

; Read input line from user keyboard
    mov rcx, stdin
    lea rdx, keymsg
    mov r8, MaxBuf
    lea r9, nbrd
    call ReadConsoleA

; Echo the message input back to the user
    mov rcx, stdout
    lea rdx, keymsg
    mov r8, nbrd            ; length number bytes of input message
    lea r9, nbwr            ; number of bytes actually written
    call WriteConsoleA

; Go get another linem but exit if only "Enter" key was input
    mov r8, nbrd
    cmp r8, 2
    jg nxtlin

    mov rcx, stdout
    lea rdx, exitmsg
    mov r8, lengthof exitmsg
    lea r9, nbwr
    call WriteConsoleA

    add rsp, 40             ; restore "shadow space"

; Exit
    mov rcx, 0
    call ExitProcess

main endp
    .data
msg byte "Please enter text message: "
exitmsg byte "Hasta la proxima ..."
keymsg byte MaxBuf dup (?)
stdout qword ?
nbwr qword ?
stdin qword ?
nbrd qword ?
    end