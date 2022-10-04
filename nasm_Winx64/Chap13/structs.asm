section .data
    name    db "Calvin", 0
    address db "12 Mockingbird Lane", 0
    balance dd 12500
struc Customer
    c_id        resd    1       ; 4 bytes
    c_name      resb    65      ; 69 bytes
    c_address   resb    65      ; 134 bytes
                alignb  4       ; aligns to 136
    c_balance   resd    1       ; 140 bytes
    c_rank      resb    1       ; 141 bytes
                alignb  4       ; alignb to 144
endstruc
    customers   dq      0
    format      db      0x0a, "%d %s %s %d %d", 0x0a, 0
section .text
    global main
    extern printf, exit, malloc, strcpy, free
main:
    push rbp
    mov rbp, rsp
    sub rsp, 40 + Customer_size   ; shadow space (32) + align stack (8) + length strucutre

;    mov ecx, 100        
;    mul ecx, Customer_size

    mov ecx, Customer_size
    call malloc

    mov [customers], rax
    
    mov [rax + c_id], dword 7
    lea rcx, [rax + c_name]
    lea rdx, [name]
    call strcpy
    
    mov rax, [customers]            ; restore the pointer
    lea rcx, [rax + c_address]
    lea rdx, [address]
    call strcpy
    
    mov rax, [customers]            ; restore the pointer
    mov edx, [balance]
    mov [rax + c_balance], edx
    
    mov rax, [customers]
    mov [rax + c_rank], dword 1

    mov [rbp + 8], r10
    mov [rbp + 16], r14
    mov [rbp + 24], r15
    ;mov r15, 100            ; loop counter

    mov r14, [customers]

;more:
    ; print struct content
    lea ecx, [format]
    mov edx, [r14 + c_id]
    lea r8d, [r14 + c_name]
    lea r9, [r14 + c_address]
    mov r10d, [r14 + c_balance]
    mov r15d, [r14 + c_rank]
    push r15
    push r10
    sub rsp, 32              ; shadow space
    call printf
    add r14, Customer_size + 40 ; shadow space + customer_size (length structure)
;    sub r15, 1
;    jnz more

    mov r10, [rbp + 8]
    mov r14, [rbp + 16]
    mov r15, [rbp + 24]

    mov rax, [customers]
    mov rcx, rax
    call free
    
; exit syscall
    xor rcx, rcx
    call exit

;    mov rsp, rbp
;    pop rbp
