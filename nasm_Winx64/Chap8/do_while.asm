section .data
    data db "Hello world", 0
    n dq 0
    needle dq 'w'
section .text
    global main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    
    xor rax, rax
; Register usage
; rax: c, byte of data array
; bl: x, byte to search for
; rcx: i, loop counter, 0-63

    mov bl, [needle]

; i = 0;
    xor ecx, ecx

; c = data[i]
    mov al, [data + rcx]

; if (c != 0) {
    cmp al, 0
    jz end_if
; do {
do_while:
; if ( c == x) break;
    cmp al, bl
    je found
; i++;
    inc rcx

; c = data[i]
    mov al, [data + rcx]

;   } while (c != 0)
    cmp  al, 0
    jnz do_while

; }
end_if:
    ; n = c == 0 ? -1 : i;
    mov rcx, -1         ; c == 0 if you reach here

found:
    mov [n], rcx

; return 0;
    xor eax, eax
    leave
    ret

