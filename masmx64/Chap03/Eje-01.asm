    includelib ..\\Lib\\kernel32.lib     ; Windows kernel interface.
GetStdHandle    proto           ; Function to retrive I/O handle
WriteConsoleA    proto           ; Funtion writes to command windows
Console         equ     -11     ; Device code for console text output.

ExitProcess     proto
    .code
main proc
    sub rsp, 40             ; Reserve shadown space on stack

    ; Obtain hadle for console display monitor I/O streams.
    mov rcx, Console        ; Console standard output handle
    call GetStdHandle       ; Returns handle in Register RAX
    mov stdout, RAX         ; Save handle for text display.

    ; Display "Hello World" message
    mov rcx, stdout         ; Handle to standard output
    lea rdx, msg            ; Pointer to message
    mov r8, lengthof msg    ; Number of characters to display
    lea r9, nbwr            ; Number of bytes actually written
    call WriteConsoleA       ; Write text to command windows.

    ; Exit program
    add rsp, 40             ; Replace  "shadow space"  on stack
    mov rcx, 0              ; set exit code to zero
    call ExitProcess        ; Return control to Windows.

main endp
    .data
msg byte "Hello World"
stdout  qword ?
nbwr    qword ?
    end