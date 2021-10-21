section .data
    format: db "min: %ld", 0xa, 0
section .bss
section .text
    global main
    extern atoi
    extern rand
    extern malloc
    extern printf
    
main:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    
    mov r8, 10          ; set default size
    mov [rbp + 24], r8
    
; check for argv[1] providing a size
    cmp ecx, 2          ; rcx = argc
    jl  .nosize
    mov rcx, [rdx + 8]  ; get argv[1]
    call atoi
    mov [rbp + 16], rax
    
.nosize:
    ; create the array
    mov rcx, [rbp + 24]
    call create

    mov [rbp + 16], rax ; fill the array with random numbers
    mov rcx, rax
    mov rdx, [rbp + 24]
    call fill
    
    ; if size <= 20 print the array
    mov rdx, [rbp + 24]
    cmp rcx, 20
    jg .toobig
    mov rcx, [rbp + 16]
    call print

.toobig:
    ; print the minimum
    mov rcx, [rbp + 16]
    mov rdx, [rbp + 24]
    call min

    lea rcx, [format]
    mov rdx, rax
    call printf
    
    leave
    ret

; x = min(array, size);
section .text
    global min    
min:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    
    mov eax, [rcx]      ; get array[0]
    mov r8, 1           ; set index register = 1

.more:
    mov r9d, [rcx + r8 * 4]  ; get array[r8]
    cmp r9d, eax             ; is array[r8]
    cmovl eax, r9d
    inc r8
    cmp r8, rdx
    jl .more
    
    leave
    ret

; print(array, size);
section .data
    fmt: db "%10d", 0xa, 0
section .text
    global print
print:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    
    mov [rbp - 8], rcx      ; save array
    mov [rbp - 16], rdx     ; save size     
    xor r8, r8              ; zero index register
    mov [rbp - 24], r8
    
.more:
    lea rcx, [fmt]      ; first parameter
    mov rdx, [rbp - 8]      ; get array address
    mov r8, [rbp - 24]      ; get index register
    mov edx, [rdx + r8 * 4] ; get array[i]
    call printf
    
    mov rcx, [rbp - 24]     ; get index register
    inc rcx                 ; increment index
    mov [rbp - 24], rcx     ; save index register
    cmp rcx, [rbp + 16]     ; compare index & size
    jl  .more               ; more if index is <
    
    leave
    ret
    
section .text
    global fill
fill:
; fill(array, size);
    push rbp
    mov rbp, rsp
    sub rsp, 48
    
    mov [rbp + 16], rcx     ; save array on stack
    mov [rbp + 24], rdx     ; save size on  stack
    xor ecx, ecx            ; zero index register
    
more:
    mov [rbp + 32], rcx     ; save index resgiter
    call rand
    
    mov rcx, [rbp + 32]     ; load index register
    mov rdx, [rbp + 16]     ; load array address
    mov [rdx + rcx * 4], eax; store random value
    inc rcx
    cmp rcx, [rbp + 24]     ; compare rcx & size
    jl  more               ; more if rcx is less
    
    leave
    ret    
    
; array = create(size);
create:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    
    sal rcx, 2          ; multiply size by 4
    call malloc
    
    leave
    ret
