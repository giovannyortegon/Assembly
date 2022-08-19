section .data
scanf_fmt: db  "%ld", 0
;num resq 1

; node struct
struc node
    n_value resq 1
    n_next  resq 1
    alignb  8
endstruc

; -------- maina function --------
section .text
    global main
    extern printf, scanf, malloc

main:
;section .data
.list   equ local1
.k      equ local2

;section .text
    push rbp
    mov rbp, rsp
    frame 2, 2, 2
    sub rsp, frame_size

    call new_list           ; create a list

    mov [rbp + .list], rax

.more:
    lea rcx, [scanf_fmt]
    lea rdx, [rbp + .k]
    call scanf              ; read k

    cmp rax, 1              ; if read fails return
    jne .done

    mov rcx, [rbp + .list]
    mov rdx, [rbp + .k]
    call insert             ; insert k

    mov [rbp + .list], rax  ; restore list with new node

    mov rcx, rax
    call print

    jmp .more

.done:
    leave
    ret
    
; -----------------------------
; create list - empty list
new_list:
    xor eax, eax
    ret

; -----------------------------
; insert function
; -------- insert node --------
insert:
section .data
    .list equ   local1
    .k    equ   local2

section .text
    push rbp
    mov rbp, rsp
    frame 2, 2, 1
    sub rsp, frame_size
    
    mov [rbp + .list], rcx      ; save list pointer
    mov [rbp + .k], rdx         ; and k in stack frame_size
    
; reserve memory to new node
    mov ecx, node_size
    call malloc                 ; rax = node pointer

; list pointer
;    mov r8, [rbp + .list]       ; get list pointer
;    mov [rax + n_next], r8      ; r8 is next new node_size
;    mov r9, [rbp + .k]          ; get k
;    mov [rax + n_value], r9     ; save k in node_size

    mov [rax + n_next], dword 0      ; r8 is next new node_size
    mov r9, [rbp + .k]          ; get k
    mov [rax + n_value], r9     ; save k in node_size

    mov r8, [rbp + .list]
    cmp r8, 0
    je .end
    
    mov rcx, [r8 + n_next]
    
.next:    
    cmp rcx, 0
    je ._add 
    mov rcx, [rcx + n_next]
    jne .next    

._add:
    mov [rcx + n_next], rax
    mov rax, rcx
           
.end: 
    leave
    ret
    
; -------- print node --------
print:
    
section .data
    .print_fmt: db "%ld", 0
    .newline: db 0x0a, 0

section .text
    .rbx equ local1

    push rbp
    mov rbp, rsp
    frame 1, 1, 2
    sub rsp, frame_size

    mov [rbp + .rbx], rbx       ; save old rbx
    cmp rcx, 0                  ; skip the loop if
    je .done                    ; list pointer == 0
    mov rbx, rcx                ; get first node

.more:
    lea rcx, [.print_fmt]
    mov rdx, [rbx + n_value]
    call printf                 ; print node value

    mov rbx, [rbx + n_next]     ; p = p->next
    cmp rbx, 0                  ; end the loop if
    jne .more                   ; node pointer == 0

.done:
    lea rcx, [.newline]
    call printf                 ; print new line

    mov rbx, [rbp + .rbx]       ; restore rbx
    leave
    ret

