
%include "io_macros.mac"

HANDLE_OPENPAREN:
	%ifdef DEBUG
		write_to_stdout \
			debug_handling_openparen_msg, \
			debug_handling_openparen_msg_len
	%endif
HANDLE_CLOSEPAREN:
	%ifdef DEBUG
		write_to_stdout \
			debug_handling_closeparen_msg, \
			debug_handling_closeparen_msg_len
	%endif
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
HANDLE_DIGIT:
	%ifdef DEBUG
		write_to_stdout \
			debug_handling_digit_msg, \
			debug_handling_digit_msg_len
	%endif

