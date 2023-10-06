;; This program reads one char, and if it is a number, prints asterisk count

%include "../stud_io.inc"
global	_start

section	.text
_start:	GETCHAR		; read char
	cmp	al, 49	; compare char and "1"
	jl	finish	; if less then finish
	cmp	al, 57	; com[are char and "9"
	jg	finish	; if greater then finish
	sub	al, 48	; convert char code to number
	mov	ecx, eax; set count for cycle
lp:	PUTCHAR "*"	; print "*"
	loop	lp
	PUTCHAR	10	; print new line char
finish:	FINISH
