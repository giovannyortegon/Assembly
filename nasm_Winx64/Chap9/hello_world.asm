section .data
    msg: db "Hello World!", 0x0a, 0

section .text
    global main
    extern printf

main: 
    frame 6,2,3
    push rbp
    mov rbp, rsp
    sub rsp, frame_size     ; will be 32 

    ;mov rcx, msg           
    lea rcx, [msg]         ; parameter 1 for printf
    call printf

    xor eax, eax            ; return 0
    leave
    ret
