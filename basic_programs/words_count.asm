; This program reads input and for each line prints count of words is asterisks

%include "../stud_io.inc"
global	_start

section	.text
_start:	xor	ecx, ecx		; register to count words
	mov	bl, 1			; register for statement is_word_start
cycle:	GETCHAR				; read char and write to eax
	cmp	eax, $0ffffffff		; check if end of input
	je	finish			; 	if yes, go to finish
	cmp	eax, 10			; check if the end of line
	je	print_words_count	; 	if yes, print words count
	cmp	eax, 32			; check if space
	je	is_word_start		;	if yes, set true to is_word_start
	cmp	eax, 9			; check if tab
	je	is_word_start		;	if yes, set true to is_word_start
	cmp	bl, 1			; check if is_word_start
	jne	cycle			;	if not, repeat cycle
	inc	ecx			;	if yes, ecx++ (words count)
	mov	bl, 0			; set false to is_word_start 
	jmp	cycle			; repeat cycle
is_word_start:
	mov	bl, 1			; set true to is_word_start
	jmp	cycle			; repeat cycle
print_words_count:
	jecxz	print_new_line		; if zero words was found print new line
lp:	PUTCHAR	"*"			; print asterisk ecx count
	loop	lp
print_new_line:
	PUTCHAR	10			; print new line
	jmp	_start			; go to start and repeat
finish:	FINISH
