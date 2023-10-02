; This program reads line and prints:
; a) length of the longest word in asterisks
; b) length of the last word in asterisks

%include "../stud_io.inc"
global	_start

section	.text
_start:	xor	ecx, ecx	; register for length of the longest word
	xor	edx, edx	; register for length of current word
	xor	ebx, ebx	; register for length of the last word
cycle:	GETCHAR			; read char and write to eax
	cmp	eax, $0ffffffff	; check if end of input
	je	result
	cmp	eax, 10		; check if the end of line
	je	result
	cmp	eax, 32		; check if it is space
	je	save_lengths	;	if space, save current word length
	inc	ebx
	jmp	cycle
save_lengths:
	cmp	ebx, 0		; check if it was only spaces before
	je	cycle		;	if yes, go to next char
	mov	edx, ebx	; current word is the last, so write length to edx
	cmp	ecx, ebx	; compare length in ecx and current word length
	jl	longest_to_ecx	; 	if ecx is less, write it to ecx
	xor	ebx, ebx	; zero to ebx, if ecx is equal or greater
	jmp	cycle
longest_to_ecx:
	mov	ecx, ebx	; longest length to ecx
	xor	ebx, ebx	; zero to ebx
	jmp	cycle
result:	cmp	ebx, 0		; check if it was only spaces before
	je	print_a		; 	if yes, print output
	mov	edx, ebx	; last word length to edx
	cmp	ecx, ebx	; check if current word is the longest
	jge	print_a		; 	if not, print a)
	mov	ecx, ebx	;	if yes, longest to ecx and print a)
print_a:
	PRINT	"a) "
	jecxz	print_b		; if ecx is zero, pring b)
lp_a:	PUTCHAR	"*"
	loop	lp_a
print_b:
	PRINT	" b) "
	mov	ecx, edx	; last word length to ecx
	jecxz	finish_line_work; if ecx is zero, finish line work
lp_b:	PUTCHAR	"*"
	loop	lp_b
finish_line_work:
	PUTCHAR	10		; print new line char
	cmp	eax, $0ffffffff	; if last char was end of file, finish program
	jne	_start
finish:	FINISH
