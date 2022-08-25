    includelib ..\\Lib\\Kernel32.Lib
GetStdHandle    proto
WriteConsoleA   proto
ReadConsoleA    proto
Console         equ     -11
Keyboard        equ     -10
MaxBuf          equ     40
ExitProcess     proto
;       Macro "txtOut msg, nchar"   display character string
;               msg:                Address of ASCII message
;               nchar:              Address of message length
txtOut  macro   msg, nchar          ; Message location and length
    mov rcx, stdout
    lea rdx, msg
    mov r8, nchar
    mov r9, nbwr
    call WriteConsoleA
    endm

    .code
main proc
    sub rsp, 40                 ; Reserve "Shadow space" on stack

; Obtain "handle" for console I/O streams
    mov rcx, Console
    call GetStdHandle
    mov stdout, rax

    mov rcx, Keyboard
    call GetStdHandle
    mov stdin, rax

; Display the prompt message
nxtlin:
    txtOut  pmsg, plen          ; Write text string to command box

; Read input line from user keyboard
    mov rcx, stdin
    mov r8, MaxBuf
    lea rdx, keymsg
    lea r9, nbrd
    call ReadConsoleA
    txtOut keymsg, nbrd         ; Write text back to command box

; Copy message to a second buffer and display it, too.
    lea rsi, keymsg
    lea rdi, dismsg
    mov rcx, MaxBuf

cpylp:
    lodsb
    stosb
    loop cpylp
    txtOut dismsg, nbrd

; Go get another line, but exit if only "Enter" key was input.
    mov r8, nbrd
    cmp r8, 2
    jg nxtlin

    add rsp, 40
    mov rcx, 0
    call ExitProcess

main endp

    .data
pmsg    byte    "Please enter text message: ",0ah
    align 16
plen    qword lengthof pmsg     ; number of bytes in prompt message.
stdout  qword ?                 ; Handle to standard output device
nbwr    qword ?                 ; Number of bytes actually written
stdin   qword ?                 ; Handle to standard input device
nbrd    qword ?                 ; Number of bytes actually read
keymsg  qword MaxBuf dup(?)     ; Memory buffer for keyboard input
dismsg  qword MaxBuf dup(?)     ; Memory buffer for display

    end
 