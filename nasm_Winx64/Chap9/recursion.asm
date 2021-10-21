segment .data
    x				dq	0
    scanf_format:	db	"%d", 0
    printf_format:	db	"Fact(%ld) = %ld", 0x0a, 0

segment .text
    global main
    global fact
    extern scanf
    extern printf

main:
    push rbp
    mov rbp, rsp
    frame 0, 0, 3
    sub rsp, frame_size

    lea rcx, [scanf_format] ; set arg 1
    lea rdx, [x]            ; set arg 2
    call scanf

    mov rcx, [x]            ; move x for fact call
    call fact

    lea rcx, [printf_format]	; set arg 1
    mov rdx, [x]                ; set arg 2 for printf
    mov r8, rax			; set arg 3 to be x!
    call printf
	
    xor eax, eax
    leave
    ret

; recursion function
fact:
    n equ local1		; [rbp + 16]
    push rbp
    mov rbp, rsp
    frame 1, 1, 1
    sub rsp, frame_size

    cmp rcx, 1			; compare n with 1
    jg	greater			; if n <= 1, return 1
    mov eax, 1
    leave
    ret
	
greater:
    mov [rbp+n], rcx	; save n
    dec rcx		; call fact with n - 1
    call fact
    mov rcx, [rbp + n]	; restore original n
    imul rax, rcx	; multiply fact(n - 1) * n
    leave
    ret

