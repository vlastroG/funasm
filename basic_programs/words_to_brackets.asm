; This program reads lines and writes these lines, but each word put in brackets

%include "../stud_io.inc"
global	_start

section	.text
_start:	mov	dh, 1			; dh register set 1, if we looking word's start
	mov	dl, 0			; dl register set 0, if we looking word's end
cycle:	GETCHAR				; read char and write to eax
	cmp	eax, $0ffffffff		; check if end of input
	je	finish
	cmp	eax, 10			; check if end of line
	je	is_word_end
	cmp	eax, 9			; check if tab
	je	is_word_end
	cmp	eax, 32			; check if space
	je	is_word_end
	jmp	is_word_start
is_word_start:
	cmp	dh, 1			; check is we looking for word start
	jne	print_current_char	; if not, print current char
	jmp	print_start_bracket	; if yes, print start bracket and current char
is_word_end:
	cmp	dl, 1			; check if we looking for word end
	jne	print_current_char	; if not, print current char
	jmp	print_close_bracket	; if yes, [rint close bracket and current char
print_start_bracket:
	PUTCHAR	"("			; print start bracket
	mov	dh, 0			; we not looking for word start
	mov	dl, 1			; we looking for word end
	jmp	print_current_char	; print current char
print_close_bracket:
	PUTCHAR	")"			; print close bracket
	mov	dh, 1			; we not looking for word start
	mov	dl, 0			; we looking for word end
	jmp	print_current_char	; pring current char
print_current_char:
	PUTCHAR	al			; print current char
	jmp	cycle			; repeat
finish: FINISH
