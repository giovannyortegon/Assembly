%include "win32n.inc"

section .data

handle      dq 0
written     dq 0
filename    db "sample.txt", 0
hello       db "Hello world!",  0x0d, 0x0a, 0
length      equ $-hello-1

section .text
    global main
    extern CreateFileA, WriteFile, CloseHandle
main:
    push rbp
    mov rbp, rsp
    frame 2, 0, 7
    
    sub rsp, frame_size
    
    xor eax, eax
    mov [rsp + newPar7], rax                        ; hTemplateFile
    mov qword [rsp + newPar6], FILE_ATTRIBUTE_NORMAL
    mov qword [rsp + newPar5], CREATE_ALWAYS
    xor r9d, r9d                                    ; lpSecurityAttributes
    xor r8d, r8d                                    ; dwShareMode
    mov rdx, GENERIC_WRITE                          ; dwDesiredAccess
    lea rcx, [filename]                             ; lpFileName
    call CreateFileA
    mov [handle], rax
    
    xor eax, eax
    mov [rsp + newPar5], eax    ; not asynchronous I/O
    lea r9, [written]           ; pointer to dword
    mov r8d, length             ; # bytes to write
    lea rdx, [hello]            ; pointer to text
    mov rcx, [handle]           ; file handle 
    call WriteFile
    
    mov rcx, [handle]
    call CloseHandle
    xor eax, eax
    leave
    ret
    
