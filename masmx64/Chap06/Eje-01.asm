    includelib ..\\Lib\\Kernel32.Lib
    includelib user.lib
GetStdHandle    proto
ReadConsoleA    proto
ExitProcess     proto
Keyboard        equ     -10
MaxBuf          equ     20
v_asc           proto
v_asc1          proto
v_opn           proto

;   Macro "msgOut msg" calls subroutine to display a string
;           msg: Label of ASCII message for command windows.
msgOut  macro   msg         ; One arggument: msg
    lea rdx, msg            ; Pointer to message to diplay 
    mov r8, lengthof msg    ; Number of characters to display
    call v_asc              ; Write text to command
    endm

    .code
main    proc
    sub rsp, 40             ; reserve "shadow space"

    call v_opn              ; open text display screem

    mov rcx, Keyboard       ; console standard input handle
    call GetStdHandle       ; Return handle in register 
    mov stdin, rax

nxtlin:
; Display the prompt message
    msgOut pmsg

; Read input from user keybord
    mov rcx, stdin
    lea rdx, keymsg
    mov r8, MaxBuf
    lea r9, nbrd
    call ReadConsoleA

; echo line just back to the user one character at a time
    lea r12, keymsg         ; containg input 
    mov r13, nbrd           ; containg number of input

inloop:
    call v_asc1

    msgOut  newln

    inc r12
    dec r13
    jg inloop

; go get another line. But exit if only "Enttry" key was input
    mov r8, nbrd
    cmp r8, 2
    jg nxtlin

    add rsp, 40         ; restore "shadows space"

; exit
    mov rcx, 0
    call ExitProcess

main endp
    .data
stdin   qword   ?
nbrd    qword   ?
pmsg    byte    "Please enter text message: ",0ah
keymsg  byte    MaxBuf dup (?)      ; Memory buffer for keyboard input
newln   byte    0dh,0ah
    end
