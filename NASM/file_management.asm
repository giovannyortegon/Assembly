; creates and opens a file named myfile.txt, 
; and writes a text 'Welcome to Tutorials Point' in this file
section .data
	file_name db "myfile.txt", 0xa, 0xd
	len_f equ $ - file_name

	msg db "Welcome to Tutorials Point",0xa
	len equ $ - msg

	msg_done db "Written to file", 0xa
	len_done equ $ - msg_done

section .bss
	fd_out resb 1
	fd_in resb 1
	info resb 26

section .text
	global _start

_start:
; Create file
	mov eax, 8
	mov ebx, file_name
	mov ecx, 777
	mov edx, 1
	int 0x80

	mov [fd_out], eax

; write into the file
	mov eax, 4
	mov ebx, [fd_out]
	mov ecx, msg
	mov edx, len
	int 0x80

; close the file
	mov eax, 6
	mov ebx, [fd_out]

; write the message indicating end of fie write
	mov eax, 4
	mov ebx, 1
	mov ecx, msg_done
	mov edx, len_done
	int 0x80

; open the file for reading
	mov eax, 5
	mov ebx, file_name
	mov ecx, 0
	mov edx, 0777
	int 0x80

	mov [fd_in], eax

; read from file
	mov eax, 3
	mov ebx, [fd_in]
	mov ecx, info
	mov edx, 26
	int 0x80

; close the file 
	mov eax, 6
	mov ebx, [fd_in]
	int 0x80
	
; print the info
	mov eax, 4
	mov ebx, 1
	mov ecx, info
	mov edx, 26
	int 0x80
; exit
	mov eax, 1
	mov ebx, 0
	int 0x80
