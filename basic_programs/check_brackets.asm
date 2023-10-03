; This program reads line and prints "YES", 
; if the line has balance of round brackets,
; if not then prints "NO"

%include "../stud_io.inc"
global	_start

section	.text
_start:	xor	ecx, ecx	; register to count brackets
	xor	edx, edx	; register to count chars in line
cycle:	GETCHAR
	cmp	eax, $0ffffffff	; check if the end of input
	je	check_balance
	cmp	eax, 10		; check if the end of line
	je	check_balance
	inc	edx		; edx++
	cmp	ecx, 0		; compare ecx with zero
	js	cycle		; if ecx is less then zero, line has wrong balance
	cmp	eax, 40		; check if it is "("
	je	inc_ecx		;	if true, increase ecx
	cmp	eax, 41		; check if it is ")"
	je	dec_ecx		;	if true, decrease ecx
	jmp	cycle
inc_ecx:
	inc	ecx		; ecx++
	jmp	cycle
dec_ecx:
	dec	ecx		; ecx--
	jmp	cycle
check_balance:
	cmp	edx, 0
	je	print_new_line	; if line is empty, then print new line
	cmp	ecx, 0		; compare ecx and zero
	je	print_yes	; if it is zero, the line is correct
	PRINT	"NO"
	jmp	print_new_line
print_yes:
	PRINT	"YES"
	jmp	print_new_line
print_new_line:
	PUTCHAR	10		; print new line
	xor	ecx, ecx	; zero to brackets counter
	xor	edx, edx	; zero to chars in line counter
	cmp	eax, $0ffffffff	; check if it is the end of line
	jne	cycle		; 	if not, repeat
finish:	FINISH
