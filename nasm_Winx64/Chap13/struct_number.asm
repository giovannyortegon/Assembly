section .data
scanf_fmt db "%ld", 0
print_fmt db 0x0a, "el numero ingrsado es: %ld", 0x0a, 0

section .bss
num resq 1
struc number
   snum resq 1
endstruc
Numbers resq 0

section .text
    global main
    extern printf, scanf, malloc, free, exit

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32 + number_size
;    sub rsp, 40

; sacn number
    lea rcx, [scanf_fmt]
    lea rdx, [num]
    call scanf
    
;     allocate - malloc
    mov ecx, number_size
    call malloc

    mov [Numbers], rax


    mov rbx, [num]
    mov [rax + snum], rbx

    mov r14, [Numbers]

    lea ecx, [print_fmt]
    mov edx, [r14 + snum]
    call printf
;    add rsp, 40
    sub r14, 32 + number_size

    xor rcx, rcx
    call exit