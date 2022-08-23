section .data
    x dd 2.34
    round dd 0x1f89

section .text
    global main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 32

    ldmxcsr [round]             ; default to rounding
    movsd xmm0,[x]
    cvtss2si eax, xmm0          ; convert to int (round)
    cvtsi2ss xmm0, rax          ; long to double
    cvtsd2ss xmm0, dword[x]     ; dword to double
    movss [x], xmm0
    
    leave
    ret
