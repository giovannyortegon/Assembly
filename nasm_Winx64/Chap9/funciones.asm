section .data
    fmt db "max (%d, %d) =  %ld", 0xa, 0
section .text
    global main
    extern printf
    
; void print_max (long a, long b)
    a equ local1    ; parameter a (rcx) local1
    b equ local2    ; parameter b (rdz) local2
print_max:
    frame 2, 3, 4
    push rbp        ; normal stack
    mov rbp, rsp
    sub rsp, frame_size
    ; int max
    
    max equ local13 ; max will be local13
    mov [rbp + a], rcx  ; save a 
    mov [rbp + b], rdx  ; save b 
    ; max = a 
    mov [rbp + max], rcx
    ; if (b > max) max = b
    cmp rdx, rcx
    jng skip
    mov [rbp + max], rdx
skip:
    ; printf ("max (%d, %d) =  %ld"), a, b, max);

    lea rcx, [fmt]
    mov rdx, [rbp + a]
    mov r8, [rbp + b]
    mov r9, [rbp + max]
    call printf
    
    leave
    ret    

main: 
    push rbp
    mov rbp, rsp
    
    frame 0, 0, 2
    sub rsp, frame_size
    
    ; print_max (100, 200)
    mov rcx, 100    ; first parameter 
    mov rdx, 200    ; second parameter
    call print_max
    
    xor eax, eax    ; return 0
    
    leave 
    ret
