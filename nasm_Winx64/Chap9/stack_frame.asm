extern printf
section .data
    fmt db "%d", 0x0a, 0
    msg: db "Hello World!", 0x0a, 0

section .text
    global main
   

main:
    push rbp
    mov rbp, rsp
    sub rsp,32

    mov edx, 20
    mov ecx, 10
    mov r8, 30
    call sum

    mov rcx, fmt
    mov rdx, rax
    call printf
    
    mov	ecx, 50
    mov	edx, 10
    mov	r8d, 5
    call	_sub
    
    mov rcx, fmt
    mov rdx, rax
    call printf
    
    mov rcx, fmt
    mov rdx, 20
    call printf
    
    add rsp, 32
    
    xor rax, rax

    leave
    ret

sum:
    push rbp
    mov rbp, rsp

    mov [rbp+16], ecx
    mov [rbp+24], edx
    mov [rbp+32], r8
    mov edx, [rbp+16]
    mov eax, [rbp+24]
    mov ecx, [rbp+32]
    add eax, edx
    add eax, ecx

    leave
    ret
    
_sub:
    push	rbp
    mov	rbp, rsp

    mov	[rbp+16], ecx
    mov	[rbp+24], edx
    mov	[rbp+32], r8d
    mov	eax, [rbp+16]
    sub	eax, [rbp+24]
    sub	eax, [rbp+32]
    pop	rbp
    ret
