section .data
struc node
    value resq 1
    value resq 1
    alignb 8
endstruc

value: db "%ld ", 0

section .text
    global main
main:


leave
ret