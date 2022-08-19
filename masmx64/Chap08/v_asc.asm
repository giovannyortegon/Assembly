;   Subroutines to display one or more characters on the console
;       v_opn:  Opens the standard display monitor
;       v_asc:  Display string of characters in memory buffer
;       v_asc1: Display one characters in memory buffer
    includelib ..\\Lib\\Kernel32.Lib
GetStdHandle    proto
WriteConsoleA   proto
Console         equ     -11
    .code

; Subroutine v_opn will the standard display monitor
; Preserve registers: rbx, rsi, rdi, rbp, rsp, r12 - r15
v_opn   proc
    mov rcx, Console
    sub rsp, 40
    call GetStdHandle
    add rsp, 40
    mov stdout, rax
    ret
v_opn endp

;   Subroutine v_asc display ASCII string in command windows
;   rdx: Points to first characters in memory
;   r8: Numbers of bytes to display
;   rsp: 16 byte aligned before CALL
;   Preserve registers: rbx, rsi, rdi, rbp, rsp, r12 - r15
v_asc   proc
    lea r9, nbwr
    mov rcx, stdout
    sub rsp, 40
    call WriteConsoleA
    add rsp, 40
    ret 
v_asc   endp
;   Subroutine v_asc display ASCII string in command windows
;   rdx: Points to first characters in memory
;   r8: Number of bytes to display
;   rsp: 16 byte aligned before call
;   Preserve registers: rbx, rsi, rdi, rbp, rsp, r12 - r15
v_asc1  proc
    mov r8, 1
    lea r9, nbwr
    mov rdx, r12
    mov rcx, stdout
    sub rsp, 40
    call WriteConsoleA
    add rsp, 40
    ret 
v_asc1 endp
    .data
stdout  qword   ?       ; Handle to standard device
nbwr    qword   ?       ; Number of bytes actually written
    end          