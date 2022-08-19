section .text
    global main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 32             ; shadow registers space

    mov rax, 0x12345678     ; Inditial value for rax
    ror rax, 8              ; preserve bits 7 - 0
    shr rax, 4              ; shift out original 11 - 8
    shl rax, 4              ; bits 3 - 0 are 0's
    or rax, 1010b           ; Set the field to 1010b
    rol rax, 8              ; bring back bits 7 - 0

    xor rax, rax
    leave
    ret
