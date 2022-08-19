; use_open
section .data
    fd: dd  0
    name: db "sample", 0
    errmsg: db "Error", 0xa, 0
    errlen: equ $-errmsg
    
section .text
    global main
    extern open, write, exit, close

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32

    lea rcx, [name]     ; pathname
    mov edx, 0x42       ; read-write | create
    mov r8d, 600o       ; read-write for me
    call open
    
    cmp eax, 0
    jl error            ; failed to open
    mov [fd], eax

error:
    mov rcx, 1
    mov rdx, errmsg
    mov r8d, errlen
    call write
    
    mov ecx, [fd]
    call close
    
    xor ecx, ecx
    call exit
    
    leave
    ret
    
    
