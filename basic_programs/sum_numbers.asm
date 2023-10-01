; This program reads line and writes sum of numbers in this line in asterisks.
; Numbers are 0 to 9

%include "../stud_io.inc"
global	_start

section	.text
_start:	xor	ecx, ecx	; zero to ecx
cycle:	GETCHAR			; read char and write to eax
	cmp	eax, $0ffffffff	; check end of file
	je	result		; 	if end of file go to result
	cmp	eax, 10		; check new line
	je	result		;	if new line go to result
	cmp	eax, 49		; compare char and "1"
	jl	cycle		; if less, repeat
	cmp	eax, 57		; compare char and "9"
	jg	cycle		; if greater, repeat
	sub	al, 48		; convert char to number
	add	ecx, eax	; add number to sum in ecx
	jmp	cycle		; repeat
result:	jecxz	finish		; check if ecx is zero
lp:	PUTCHAR	"*"		; print "*"
	loop	lp
finish: PUTCHAR 10		; print new line
	FINISH
