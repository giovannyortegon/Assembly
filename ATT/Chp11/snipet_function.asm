.type area, @function
area:
	fldpi
	imull %ebx, %ebx
	movl %ebx, value
	filds value
	fmulp %st(0), %st(1)
	
	re
