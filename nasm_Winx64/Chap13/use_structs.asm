section .data

name    db "Calvin", 0
address db "12 Mockingbird Lane", 0
balance dd 12500

    struc Customer
c_id        resd 1
c_name      resb 64
c_address   resb 64
c_balance   resd 1
    endstruc
    
c dq    0

section .text
    global main
    extern malloc, strcpy
main:
    push rbp
    mov rbp, rsp
    frame 2, 0, 2
    sub rsp, frame_size
    
    mov rcx, Customer_size
    call malloc
    
    mov [c], rax            ; save pointer
    mov [rax + c_id], dword 7
    lea rcx, [rax + c_name]
    lea rdx, [name]
    call strcpy
    
    mov rax, [c]            ; restore the pointer
    lea rcx, [rax + c_address]
    lea rdx, [address]
    call strcpy
    
    mov rax, [c]            ; restore the pointer
    mov edx, [balance]
    mov [rax + c_balance], edx

    xor eax, eax
    leave
    ret
    
