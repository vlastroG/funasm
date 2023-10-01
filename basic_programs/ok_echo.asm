; This program prints "OK" for each user's line

%include "../stud_io.inc"
global	_start

section	.text
_start:	GETCHAR			; read char and write to eax
	cmp	eax, $0ffffffff	; check if end of input
	je	finish		;	if end of input go to finish
	cmp	eax, 10		; check if end of line
	jne	_start		;	if not end of line go to _start
	PRINT	"OK"		; print OK
	PUTCHAR	10		; print new line
	jmp	_start		; go to start
finish:	FINISH
