    includelib ..\lib\kernel32.lib
GetStdHandle    proto
WriteConsoleA   proto
ReadConsoleA    proto
Console         equ     -11
Keyboard        equ     -10
ExitProcess     proto

    .code
main proc
    sub rsp, 40         ; Reverse "shadow space" on stack

    mov rcx, Console    ; Console standard output handle
    call GetStdHandle   ; Return handle in register rax
    mov stdout, rax

    mov rcx, Keyboard   ; Console standard input handle
    call GetStdHandle   ; Return handle in register rax
    mov stdin, rax

    ; Display the prompt message
    mov rcx, stdout     ; Handle to standard output divice
    lea rdx, pmsg
    mov r8, lengthof pmsg
    lea r9, nbwr
    call WriteConsoleA

    ; Read input line from user keyboard
    mov rcx, stdin      ; Handle to standard  intput device
    mov r8, 20          ; Maximum length to receive
    lea rdx, keymsg     ; Memory address to receive inout
    lea r9, nbrd        ; Number if bytes actually read
    call ReadConsoleA

    ; Echo message input back to the user
    mov rcx, stdout
    lea rdx, keymsg
    mov r8, nbrd
    lea r9, nbwr
    call WriteConsoleA

    add rsp, 40         ; restore shadow space

    ;exit
    mov rcx, 0
    call ExitProcess    ; return control to Windows

main endp
    .data
pmsg    byte "Please enter text message: "
keymsg  byte 20 dup (?)
stdout  qword ?
nbwr    qword ?
stdin   qword ?
nbrd    qword ?

    end