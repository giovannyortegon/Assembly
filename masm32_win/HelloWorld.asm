include \masm32\include\masm32rt.inc
	.data
msg db "Hello Word", 0
	.code
start:
	invoke StdOut, addr msg
	invoke ExitProcess, 0
end start