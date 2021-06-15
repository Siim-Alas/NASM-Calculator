
%include "io_macros.mac"
%include "string_macros.mac"

HANDLE_OPENPAREN:
	%ifdef DEBUG
		write_to_stdout \
			debug_handling_openparen_msg, \
			debug_handling_openparen_msg_len
	%endif

	inc r8
	find_handler r8, ERR_UNRECOGNIZED_CHARACTER, char_handler_jmp_table
	call rax

	; note that the previous instruction must leave r8 at the next char
	find_handler r8, ERR_UNRECOGNIZED_CHARACTER, char_handler_jmp_table
	jmp rax

HANDLE_CLOSEPAREN:
	%ifdef DEBUG
		write_to_stdout \
			debug_handling_closeparen_msg, \
			debug_handling_closeparen_msg_len
	%endif

	inc r8
	ret

HANDLE_ASTERISK:
	%ifdef DEBUG
		write_to_stdout \
			debug_handling_asterisk_msg, \
			debug_handling_asterisk_msg_len
	%endif

	inc r8
	cmp byte [r8], "("
	je HANDLE_ASTERISK_FOLLOWED_BY_OPENPAREN

	mov al, [r8]
	sub al, 0x30		; ASCII to int
	cmp al, 0x09
	ja ERR_ASTERISK_NOT_FOLLOWED_BY_DIGIT_OR_OPENPAREN

	string_to_float r8	; st0 = right; st1 = left
	jmp HANDLE_ASTERISK_END

	HANDLE_ASTERISK_FOLLOWED_BY_OPENPAREN:
	inc r8
	find_handler r8, ERR_UNRECOGNIZED_CHARACTER, char_handler_jmp_table
	call rax		; st0 = right; st1 = left

	HANDLE_ASTERISK_END:
	fmulp st1		; st0 = left * right

	; note that the previous instructions must leave r8 at the next char
	find_handler r8, ERR_UNRECOGNIZED_CHARACTER, char_handler_jmp_table
	jmp rax

HANDLE_PLUS:
	%ifdef DEBUG
		write_to_stdout \
			debug_handling_plus_msg, \
			debug_handling_plus_msg_len
	%endif

	sub rsp, 10
	fstp tword [rsp]	; pops left

	inc r8
	find_handler r8, ERR_UNRECOGNIZED_CHARACTER, char_handler_jmp_table
	call rax		; st0 = right + ...

	fld tword [rsp]		; st0 = left; st1 = right + ...
	add rsp, 10

	faddp st1		; st0 = left + right + ...
	ret

HANDLE_MINUS:
	%ifdef DEBUG
		write_to_stdout \
			debug_handling_minus_msg, \
			debug_handling_minus_msg_len
	%endif

	sub rsp, 10
	fstp tword [rsp]	; pops left

	inc r8
	cmp byte [r8], "("
	je HANDLE_MINUS_FOLLOWED_BY_OPENPAREN

	mov al, [r8]
	sub al, 0x30		; ASCII to int
	cmp al, 0x09
	ja ERR_MINUS_NOT_FOLLOWED_BY_DIGIT_OR_OPENPAREN

	string_to_float r8	; st0 = right?
	jmp HANDLE_MINUS_END

	HANDLE_MINUS_FOLLOWED_BY_OPENPAREN:
	inc r8
	find_handler r8, ERR_UNRECOGNIZED_CHARACTER, char_handler_jmp_table
	call rax		; st0 = right?

	HANDLE_MINUS_END:
	fchs			; st0 = - right?

	; note that the previous instructions must leave r8 at the next char
	find_handler r8, ERR_UNRECOGNIZED_CHARACTER, char_handler_jmp_table
	call rax		; st0 = - right + ...

	fld tword [rsp]		; st0 = left; st1 = - right + ...
	add rsp, 10

	faddp st1		; st0 = left - right + ...
	ret

HANDLE_SLASH:
	%ifdef DEBUG
		write_to_stdout \
			debug_handling_slash_msg, \
			debug_handling_slash_msg_len
	%endif

	inc r8
	cmp byte [r8], "("
	je HANDLE_SLASH_FOLLOWED_BY_OPENPAREN

	mov al, [r8]
	sub al, 0x30		; ASCII to int
	cmp al, 0x09
	ja ERR_SLASH_NOT_FOLLOWED_BY_DIGIT_OR_OPENPAREN

	string_to_float r8	; st0 = divisor; st1 = dividend
	jmp HANDLE_SLASH_END

	HANDLE_SLASH_FOLLOWED_BY_OPENPAREN:
	inc r8
	find_handler r8, ERR_UNRECOGNIZED_CHARACTER, char_handler_jmp_table
	call rax		; st0 = divisor; st1 = dividend

	HANDLE_SLASH_END:
	fdivp st1		; st0 = dividend / divisor

	; note that the previous instructions must leave r8 at the next char
	find_handler r8, ERR_UNRECOGNIZED_CHARACTER, char_handler_jmp_table
	jmp rax

HANDLE_DIGIT:
	%ifdef DEBUG
		write_to_stdout \
			debug_handling_the_digit_msg_beginning, \
			debug_handling_the_digit_msg_beginning_len
		write_to_stdout r8, 1
		write_to_stdout \
			debug_handling_the_digit_msg_end, \
			debug_handling_the_digit_msg_end_len
	%endif

	string_to_float r8	; st0 = val

	; note that string_to_float left r8 at the next char
	find_handler r8, ERR_UNRECOGNIZED_CHARACTER, char_handler_jmp_table
	jmp rax

