
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
			debug_handling_star_msg, \
			debug_handling_star_msg_len
	%endif
HANDLE_PLUS:
	%ifdef DEBUG
		write_to_stdout \
			debug_handling_plus_msg, \
			debug_handling_plus_msg_len
	%endif
HANDLE_COMMA:
	%ifdef DEBUG
		write_to_stdout \
			debug_handling_comma_msg, \
			debug_handling_comma_msg_len
	%endif

	jmp ERR_UNRECOGNIZED_CHARACTER

HANDLE_MINUS:
	%ifdef DEBUG
		write_to_stdout \
			debug_handling_minus_msg, \
			debug_handling_minus_msg_len
	%endif
HANDLE_DOT:
	%ifdef DEBUG
		write_to_stdout \
			debug_handling_dot_msg, \
			debug_handling_dot_msg_len
	%endif
HANDLE_SLASH:
	%ifdef DEBUG
		write_to_stdout \
			debug_handling_slash_msg, \
			debug_handling_slash_msg_len
	%endif

	inc r8
	find_handler r8, ERR_UNRECOGNIZED_CHARACTER, char_handler_jmp_table
	call rax		; st0 = divisor; st1 = dividend

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

