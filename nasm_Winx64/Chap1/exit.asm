; Program: exit

; Execute the exit  system call 

; No input

; Output:   only the exit status
;           %errorlevel%
;           $? in the Cygwin shell
segment .text
    global main
    extern exit
main:
    push rbp
    mov rbp, rsp
    sub rsp, 32     ; shadow parameters space
    mov ecx, 5      ; parameters for exit function
    call exit

