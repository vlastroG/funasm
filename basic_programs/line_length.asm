; This program reads user's lines and prints length of each line in asterisks.

%include "../stud_io.inc"
global	_start

section	.text
_start:	GETCHAR			; read char and write to eax
	cmp	eax, $0ffffffff	; check if the end of input
	je	finish		; 	if the end of input go to finish
	cmp	eax, 10		; check if the end of line
	jne	aster		;	if not print asterisk
	PUTCHAR	10		; print new line
	jmp	_start		; repeat
aster:	PUTCHAR	"*"		; pring "*"
	jmp	_start		; go to start
finish:	PUTCHAR	10		; print new line
	FINISH
