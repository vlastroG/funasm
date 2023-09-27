;; This program read one char and prints 'YES', if the char is 'A'

%include "../stud_io.inc"
global	_start

section	.text
_start:	GETCHAR		; read char and write it to EAX. It will be fully in AL
	cmp	al, 65	; compare char ascii-code with 'A' ascii-code
	jne 	finish	; if not equal finish go to finish
	PRINT "YES"	; print "YES"
	PUTCHAR 10	; print new line char
finish:	FINISH
