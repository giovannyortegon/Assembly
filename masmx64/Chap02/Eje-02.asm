; Aritmetic operation
    includelib ..\\lib\\kernel32.lib
ExitProcess proto
    .code
main proc
    mov rcx, 1
    add rcx, 100
    mov rdx, 10
    sub rcx, rdx
    call ExitProcess
main endp
    end
