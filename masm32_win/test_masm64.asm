    .data
wcount dq 0
hello db "Hello masm 64", 0x0a

    .code
start:
    arg -11
    invoke GetStdHandle
    arg 0, addr wcount, 14
    arg addr hello, rax
    invoke WriteFile

    xor rax, rax
    ret