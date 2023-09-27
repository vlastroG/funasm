;This program read one char and prints 'YES', if the char is 'A'
%include "stud_io.inc"
global	_start

section	.text
_start:	GETCHAR
	cmp	al, 65
	jne 	finish
	PRINT "YES"
	PUTCHAR 10
finish:	FINISH
