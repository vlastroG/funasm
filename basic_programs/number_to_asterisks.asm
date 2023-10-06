; This program read lines from input and writes first written number in asterisks.
; Numbers must be in decimal numeral system and greater than zero.
; For example:
; 12		< the line
; ************	< output
; 7hjk	 23 3	< the line
; *******	< the line

%include "../stud_io.inc"
global	_start

section	.text
_start:	xor	edx, edx		; zero to edx. It will be result number
cycle:	GETCHAR				; read current char and write to eax
	cmp	eax, $0ffffffff		; check if the end of input
	je	finish
	cmp	eax, 10			; check if the end of line
	je	print_number
	cmp	eax, 48			; check if it is "0"
	jl	cycle			; 	if less, print_number
	cmp	eax, 57			; check if it is "9"
	jg	cycle			; 	if greater, print_number
	jmp	convert_current_number	; convert and current char to result number
convert_current_number:
	mov	ebx, edx		; copy current result to ebx
	shl	edx, 3			; multiply current result by 8
	shl	ebx, 1			; multiply current result in ebx by 2
	add	edx, ebx		; (8+2) current result write to edx
	sub	eax, 48			; convert char code to it's number
	add	edx, eax		; add current converted char to edx
	jmp	cycle
print_number:
	mov	ecx, edx		; move number to ecx
	jecxz	finish_line_work
lp:	PUTCHAR	"*"			; print asterisks ecx times
	loop	lp
finish_line_work:
	PUTCHAR	10
	jmp	_start
finish:	FINISH
