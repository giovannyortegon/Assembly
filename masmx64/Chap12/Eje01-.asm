; Function addPi to a floating point value
;   xmm0:   32 bit single precision (first argument)
    includelib ..\\Lib\\Kernel32.Lib
ExitProcess proto

    .data
arg1 qword  2.123
    .code
main proc
    sub rsp, 40

    movups xmm0, xmmword ptr [arg1]
    call addPi

    add rsp, 40

    mov rcx, arg1
    call ExitProcess


main endp

addPi proc
    movups xmm1, pi         ; Load floating point Pi value
    addps xmm0, xmm1        ; Add Pi to argument
    ret     
addPi endp
    .data
pi real4 3.1416             ; Approximate value of Pi
    end 