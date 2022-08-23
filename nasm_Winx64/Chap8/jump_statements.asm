segment .data
switch:
    dq main.case0
    dq main.case1
    dq main.case2
i:  dq 2
segment .text
    global main
main:
    push rbp
    mov rbp, rsp
    mov rsp, 32

    mov rax, [i]        ; move i to rax
    jmp [switch+rax*8]    ; switch (i)

    .case0:
        mov rbx, 100    ; go here if i == 0
        jmp .end
    .case1:
        mov rbx, 101    ; go here if i == 1
        jmp .end
    .case2:
        mov rbx, 102    ; go here if i == 2
    .end:
        xor rax, rax
        ret

