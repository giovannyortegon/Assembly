; pythagonean.asm
; see if they can be the legs and hypotenuse of
; a right triangle: a^2 + b ^ 2 = c^2
section .data
    a dq 246        ; one leg of a triangle
    b dq 328        ; another leg
    c dq 410        ; hypotenuse ?
section .text
    global main
main:
    push rbp
    mov rbp, rsp

    mov rax, [a]    ; move a into rax
    imul rax, rax   ; a squared
    mov rbx, [b]    ; move b into rbx
    imul rbx, rbx   ; b squared
    mov rcx, [c]    ; move c into rbx
    imul rcx, rcx   ; c squared
    add rax, rbx    ; rax has a^2 + b^2
    sub rax, rcx    ; is rax 0?
    
    xor rax, rax
    ret
