; using_write_syscall
section .data
    msg:    db "Hello World!", 0x0a
    len:    equ $-msg           ; Length of the string

section .text
    global main
    extern write, exit

main:
    push rbp
    mov rsp, rsp
    frame 2, 0, 3
    sub rsp, frame_size
    mov r8d, len        ; Arg 3 is the length
    mov rdx, msg        ; Arg 2 is the array
    mov rcx, 1          ; Arg 1 is the fd
    call write
    
    xor ecx, ecx        ; 0 return  = success
    call exit
    
    leave
    ret
