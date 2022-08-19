    includelib ..\\Lib\\Kernel32.Lib
GetStdHandle    proto
WriteConsoleA   proto
ReadConsoleA    proto
ExitProcess     proto
Console         equ        -11
Keyboard        equ        -10
MaxBuf          equ        20

; Macro "msgOut msg" display character string
; msg: Label of ASCII message for command windows
msgOut  macro msg       ; one argument
    lea rdx, msg
    mov r8, lengthof msg
    call v_asc
    endm

    .code
main    proc
    ; save "shadow space"
    sub rsp, 40

; obtain "handles"
    mov rcx, Console
    call GetStdHandle
    mov stdout, rax

    mov rcx, Keyboard
    call GetStdHandle
    mov stdin, rax

nxtlin:
    ; Display the prompt
    msgOut pmsg         ; write text string to command box

    ; read input line from user
    mov rcx, stdin
    lea rdx, keymsg
    mov r8, MaxBuf
    lea r9, nbrd
    call ReadConsoleA

    ; echo line input
    lea r12, keymsg
    mov r13, nbrd

inloop:
    mov rdx, r12
    mov r8, 1
    call v_asc

    msgOut newln

    inc r12
    dec r13
    jg inloop

    ; go get  another line, but if only "Enter" key was input.
    mov r8, nbrd
    cmp r8, 2
    jg nxtlin

    add rsp, 40         ; restore "shadows space"

    ; exit
    mov rcx, 0
    call ExitProcess

main endp
; Subroutine v_asc display ASCII string in command window
;   rdx:    points to first character in memory
;   r8:     Number of bytes to display
;   rsp:    16 bytes aligned before CALL
;   rbx, rsi, rdi, rbp, rsp, r12 - r15 preserved
v_asc   proc
    lea r9, nbwr            ; Number byte actually written
    mov rcx, stdout         ; Handle to standard output device
    sub rsp, 40             ; reserve "Shadow space"
    call WriteConsoleA      ; Write text string to command box
    add rsp, 40             ; restore "shadow space"
    ret                     ; return to the calling program
v_asc endp

    .data
pmsg    byte "Please enter text message: ",0ah
keymsg  byte MaxBuf dup(?)
newln   byte 0dh,0ah
stdout  qword   ?
nbwr    qword   ?
stdin   qword   ?
nbrd    qword   ?
    end