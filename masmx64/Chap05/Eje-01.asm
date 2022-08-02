    includelib ..\\Lib\\kernel32.Lib
GetStdHandle    proto
WriteConsoleA   proto
ReadConsoleA    proto
ExitProcess     proto
Console         equ     -11
Keyboard        equ     -10
MaxBuf          equ     20

; Macro "msgOut" display a character string
; msg: Label of ASCII message for command window
msgOut  macro   msg
    mov rcx, stdout
    lea rdx, msg
    mov r8, lengthof msg
    lea r9, nbwr
    call WriteConsoleA
    endm

    .code
main    proc
    sub rsp, 40             ; reserve "shadow space"

    ; obtain "handles" for I/O streams
    mov rcx, Console
    call GetStdHandle
    mov stdout, rax

    mov rcx, Keyboard
    call GetStdHandle
    mov stdin, rax

nxtlin:
    ; Display message
    msgOut pmsg             ; Write text string

    ; Read input line from user keyboard
    mov rcx, stdin
    lea rdx, keymsg
    mov r8, MaxBuf
    lea r9, nbrd
    call ReadConsoleA

    ; Echo line just back to the user one character at time.
    lea r12, keymsg         ; memory buffer containing input
    mov r13, nbrd           ; number of characters actually read

inloop:
    mov rcx, stdout         ; handle to standard output device
    mov rdx, r12            ; point in next character to display
    mov r8, 1               ; Only display 1 character
    lea r9, nbwr
    call WriteConsoleA

    msgOut newln

    inc r12
    dec r13
    jg inloop

    ; go get  another line, bit exit if only "Enter" key was input
    mov r8, nbrd
    cmp r8, 2
    jg nxtlin

    add rsp, 40             ; restore "shadow space"

    ; exit
    mov rcx, 0
    call ExitProcess

main endp
    .data
pmsg byte "Please enter text message: "
keymsg  byte    MaxBuf dup(?)
newln   byte    0dh,0ah
stdout  qword   ?
nbwr    qword   ?
stdin   qword   ?
nbrd    qword   ?
    end