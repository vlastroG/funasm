; This program read text until the end and write chars count in decimal numeral.

%include "../stud_io.inc"
global	_start

section	.bss
array	resb	10			; array of 10 bytes, as we will have 10 digits number
					; In array will be our number.
					; In 0 index first digit,
					; In 1 index second digit, ...
					

section	.text
_start:	xor	edx, edx		; zero to edx. We will count chars here
cycle:	GETCHAR				; read char and put to eax
	cmp	eax, $0ffffffff		; check if the end of text
	je	print_text_length	;	if the end, print text length
	inc	edx			; chars count +1
	jmp	cycle			; repeat
print_text_length:
	mov	ecx, 10			; set ecx to 10, as we will have 10 digits number
	mov	edi, array
	add	edi, 9			; set edi to last array index
	mov	eax, edx		; write text length to eax
	xor	edx, edx		; zero to edx. No we have our length in edx:eax
	mov	ebx, 10
lp:	div	ebx			; divide edx:eax by 10. Result in eax, reminder in edx (dl)
	mov	[edi], dl		; write reminder to array[edi]
	dec	edi			; index of array -1
	xor	edx, edx		; zero to edx. No we have our result in edx:eax
	loop	lp
	mov	ecx, 10
	mov	edi, array		; set edi to first array index
find_number_start:
	cmp	byte [edi], 0		; check if number started
	jne	print_digits
	inc	edi
	loop	find_number_start
	jmp	finish_with_zero
print_digits:
	add	byte [edi], 48		; convert number in [edi] to it's char code
	PUTCHAR	byte [edi]		; print digit from array[edi]
	inc	edi			; edi +1
	dec	ecx			; ecx -1
	cmp	ecx, 0
	je	finish
	jmp	print_digits		; repeat
finish_with_zero:
	PUTCHAR	"0"
finish: PUTCHAR	10			; print new line
	FINISH
