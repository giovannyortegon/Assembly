    includelib ..\\Lib\\Kernel32.Lib
    includelib ..\\Lib\\v.lib

ExitProcess proto
v_asc       proto
v_opn      proto
v_dig1      proto

; Macro "disps base, tail" call v_dig1,then display a string.
;   base:   Base (2 - 10) for display of number
;   tail:   Separation string to be output.
dispbs    macro base, tail
    mov r11, base
    call v_dig1
    lea rdx, tail
    mov r8, lengthof tail
    call v_asc
    endm

    .code               ; code segment

main proc
    sub rsp, 40         ; reserve 'shadow space' on stack

    call v_opn         ; open text diplay stream

; Make four passes through to double the value of each integer.
    mov r14, 4          ; use r14 for loop counter

; Display first eight 8 bits integers in array ints.
double:
    lea r12, intlst     ; point to array of 8 bits integer
    mov r13, 7          ; loop through first 7 integer

inloop:
    dispbs 10, tab        ; display byte in decimal
    inc r12             ; set pointer next integer
    dec r13             ; decrement byte count remaining
    jg inloop           ; loop all 7 done
    dispbs 10, newln

    movdqu xmm3, xmmword ptr [intlst]   ; 16 - 8 bit integers
    paddb xmm3, xmm3                    ; double the value in xmm3
    paddusb xmm3, xmm3                  ; unsigned saturated values xmm3
    paddsb xmm3, xmm3                   ; signed saturated values xmm3
    movdqu xmmword ptr [intlst], xmm3   ; store 16 bits

    dec r14             ; decrement passes reamining
    jg double           ; loop back to double again

    add rsp, 40         ; restore "shadow space"

    mov rcx, 0
    call ExitProcess

main endp
    .data
intlst  byte 1, 2, 10, 50, 100, 150, 200, 250       ; Array of 8 test integers
        byte 8 dup(0)                               ; fill remainder of double quad word.
newln   byte 0dh, 0ah                               ; carriage return and line feed
tab     byte 09h                                    ; Horizontal tab character        
    end