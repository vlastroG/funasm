; This program read input and write thiw input.
; This works like cat command without parameters.

%include "../stud_io.inc"
global	_start

section	.text
_start:	GETCHAR			; read char and write to eax	
	cmp	eax, $0ffffffff	; check if it end of input
	je	finish		; if end, then finish
	PUTCHAR	al		; write char that we have read
	jmp	_start		; make it all again
finish:	FINISH
