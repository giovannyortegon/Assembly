section .data
    scan_name db "%s", 0
    scan_kw   db "%d", 0
    fmt_name  db "Insert your name: ", 10,0
    fmt_kw    db "Kilowatt hour: ", 10, 0
    fmt_bill  db "%s has command kilowatt %d hour to $%d hour", 10,0
section .bss
    name resb 20
    kw   resq 1
section .text
    global main
    extern printf
    extern scanf
main:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    
    mov rcx, fmt_name
    call printf
    
    mov rcx, scan_name
    mov rdx, name 
    call scanf
    
    mov rcx, fmt_kw
    call printf
    
    mov rcx, scan_kw
    lea rdx, [kw]
    call scanf
    
    mov rcx, [kw]
    call calculate
    
    mov rcx, fmt_bill
    mov rdx, name 
    mov r8, [kw]
    mov r9, rax
    call printf
   
        
    xor rax, rax
    leave
    ret
    
calculate:
    push rbp
    mov rbp, rsp
    sub rsp, 48
; local variables
    mov word[rbp-4], 20
    mov word[rbp-8], 40
    
    cmp rcx, 100
    jge L1
    mov ax, word[rbp-4]
    jmp end
L1:
    mov ax, word[rbp-8]
end:
    leave
    ret
