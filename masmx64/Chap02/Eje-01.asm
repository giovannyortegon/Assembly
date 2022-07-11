; Exit Program
    includelib ..\lib\kernel32.lib
ExitProcess proto
    .code
main proc
    mov rcx, 78         ; load status
    call ExitProcess    ; return cpu control to Windows
main endp
    end
