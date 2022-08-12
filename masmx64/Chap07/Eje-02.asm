    includelib ..\\Lib\\Kernel32.Lib
    includelib v.lib
GetStdHandle    proto
ReadConsoleA     proto
Keyboard        equ     -10
MaxBuf         equ     20
ExitProcess     proto
v_asc           proto
v_asc1          proto
v_opn           proto
v_bn1           proto
v_hex1          proto

; Macro "msg msg" calls subroutine to display a string
;   msg: Label of ASCII message for command windows.
msgOut  macro msg           ; one argument: msg
    lea rdx, msg            ; pointer of characters to display
    mov r8, lengthof msg    ; Number of characters to display
    call v_asc
    endm

; Macro "disp sub, tail" call a subrutine then display a character
;   sub: Subroutine to be display a byte
;   tail:   Separation character string to be output
disp macro sub, tail        ; two arguments
    call sub                ; subroutine to display
    msgOut tail             ; string to sisplay
    endm

    .code
main proc
    sub rsp, 40             ; reserve "shadow space"

; obtain "Handle" for console input streams
    call v_opn              ; open text display stream
    mov rcx, Keyboard
    call GetStdHandle
    mov stdin, rax

; Display the prompt message
nxtlin:
    msgOut pmsg             ; write text  string to command box

; Read input line user keyboard
    mov rcx, stdin
    lea rdx, keymsg
    mov r8, MaxBuf
    lea r9, nbrd
    call ReadConsoleA

; Echo line just input back to the user one character
    lea r12, keymsg
    mov r13, nbrd

inloop:
    disp v_bn1, tab
    disp v_hex1, tab
    disp v_asc1, newln
    inc r12
    dec r13
    jg inloop

; Go get another line but exit if only "Enter" key was input
    mov r8, nbrd
    cmp r8, 2
    jg nxtlin

    add rsp, 40
    mov rcx, 0
    call ExitProcess

main endp
    .data
pmsg    byte    "Please enter text:",0ah
keymsg  byte    MaxBuf dup(?)
newln   byte    0dh,0ah
tab     byte    09h
stdin   qword   ?
nbrd    qword   ?
    end