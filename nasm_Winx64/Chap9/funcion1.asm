section .data
    fmt db "max (%d, %d) =  %ld", 0xa, 0
section .text
    global main
    extern printf
    
; void print_max (long a, long b)
;    a equ local1    ; parameter a (rcx) local1
;    b equ local2    ; parameter b (rdz) local2
print_max:
    push rbp        ; normal stack
    mov rbp, rsp
    sub rsp, 48
    ; int max
    
;    max equ local13 ; max will be local13
    mov [rbp + 16], rcx  ; save a 
    mov [rbp + 24], rdx  ; save b 
    ; max = a 
    mov [rbp + 32], rcx
    ; if (b > max) max = b
    cmp rdx, rcx
    jng skip
    mov [rbp + 32], rdx
skip:
    ; printf ("max (%d, %d) =  %ld"), a, b, max);

    lea rcx, [fmt]
    mov rdx, [rbp + 16]
    mov r8, [rbp + 24]
    mov r9, [rbp + 32]
    call printf
    
    leave
    ret    

main: 
    push rbp
    mov rbp, rsp
    
    sub rsp, 48
    
    ; print_max (100, 200)
    mov rcx, 100    ; first parameter 
    mov rdx, 200    ; second parameter
    call print_max
    
    xor eax, eax    ; return 0
    
    leave 
    ret