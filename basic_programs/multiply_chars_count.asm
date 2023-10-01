; This proogram reads input and counts "+" and "-".
; Then program multiply these counts and prints as many asterisks.

%include "../stud_io.inc"
global	_start

section	.text
_start:	xor	ebx, ebx	; zero to ebx
	xor	edx, edx	; zero to edx
cycle:	GETCHAR			; read char and write to eax. It will be in al
	cmp	eax, $0ffffffff	; check if end of file
	je	result		; 	if end of file go to finish
	cmp	al, 10		; check if new line
	je	result		; 	if new line go to finish
				;
	cmp	al, 43		; check if "+"
	jne	check_minus	;	if not go to minus check
	inc	bl		; increase "+" sum, as it is "+"
	jmp	cycle		; repeat
check_minus:
	cmp	al, 45		; check if "-"
	jne	cycle		;	if not go to cycle start
	inc	dl		; increase "-" sum, as it is "-"
	jmp	cycle		; repeat
result:	mov	eax, ebx	; "+" count to eax
	mul	dl		; multiply "+" count by "-" count and write to ax
	mov	ecx, eax	; write number to ecx
	jecxz 	finish		; is ecx is zero, go to finish
lp:	PUTCHAR	"*"		; write "*"
	loop	lp		;	ecx times
finish:	PUTCHAR	10		; write new line char
	FINISH
