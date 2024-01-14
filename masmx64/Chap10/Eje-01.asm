    includelib ..\\Lib\\Kernel32.Lib
GetStdHandle    proto
WriteConsoleA   proto
ReadConsoleA    proto
ExitProcess     proto
Console         equ     -11
Keyboard        equ     -10
MaxBuf          equ     40

;  Macro    "txtOut msg nchar"  display a character string
;               msg:            Address of ASCII message
;               nchar:          Address of message length
    .code
txtOut  macro   msg, nchar
    mov rcx, stdout
    lea rdx, msg
    mov r8, nchar
    lea r9, nbwr
    call WriteConsoleA
    endm

; Main program that reads text message from user through command
; with keyin and display it in same command windows.
;   1. Multiple lines are input until only "Enter" key pushed.
;   2. Each line will be output "as is" and two case changes.
main    proc
    sub rsp, 40

; Obtain "handles" for console IO streams
    mov rcx, Console
    call GetStdHandle
    mov stdout, rax
    mov rcx, keyboard
    call GetStdHandle
    mov stdin, rax

; Display the prompt message
nxtlin:
    txtOut pmsg, plen   ; write text string to command box.
; Read input line from user keyboard
    mov rcx, stdin
    lea rdx, keymsg
    mov r8, MaxBuf
    lea r9, nbrd
    call ReadConsoleA
; Display input
    txtOut keymsg, nbrd

; Change case of first 8 letters and echo again
    mov r13, keymsg
    xor r13, qword ptr[cvt]
    mov keymsg, r13
    txtOut keymsg, nbrd
	txtOut nl, lengthof nl
	
; Convert to lower case and echo again
    or r13, qword ptr [cvt]     ; convert to lower case
    mov keymsg, r13             ; Overlay start of mesage
    txtOut keymsg, nbrd        ; Display whole message
	txtOut nl, lengthof nl
; Go get another line, but exit if only "Enter" key was input.
    mov r8, nbrd                ; Length (byte) of input message
    cmp r8, 2                   ; Test if only CR and LF characters
    jg nxtlin                   ; loop back to get another input

    add rsp, 40                 ; restore "shadow space" on stack
    mov rcx, 0
    call ExitProcess

main endp
    .data
pmsg    byte "Please enter text message: ",0ah
    align 16
plen qword lengthof pmsg
stdout  qword ?
nbwr    qword ?
stdin   qword ?
nbrd    qword ?
keymsg  qword MaxBuf dup (?)
cvt     byte  8 dup(20h)
nl		byte 0dh,0ah
    end