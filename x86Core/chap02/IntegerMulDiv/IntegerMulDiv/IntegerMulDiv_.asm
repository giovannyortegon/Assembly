.model flat, c
.code

IntegerMulDiv_ proc
; prologe function
    push ebp
    mov ebp, esp
    push ebx

; make sure the divisor Is Not zero
    Xor eax, eax
    mov ecx, [ebp + 8]              ; ecx = a
    mov edx, [ebp + 12]             ; edx = b
    Or edx, edx
    jz InvalidDivisor               ; jump If b Is zero

;Calculate product And save result
    imul edx, ecx                   ; edx = a * b
    mov ebx, [ebp + 16]             ; ebx = prod
    mov [ebx], edx                  ; save product

; Calculate quotient And ramainder, save resutls
    mov eax, ecx                    ; eax = a
    cdq                             ; edx:eax contains dividend
    idiv dword ptr [ebp + 12]       ; eax, = quo, edx = REM

    mov ebx, [ebp + 20]             ; ebx = quo
    mov [ebx], eax                  ; save quotient
    mov ebx, [ebp + 24]             ; ebx = REM
    mov [ebx], edx                  ; save remainder
    mov eax, 1                      ; set success return code

; function epilog
InvalidDivisor:
    pop ebx
    pop ebp
ret

IntegerMulDiv_ endp
End