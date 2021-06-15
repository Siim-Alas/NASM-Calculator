
%include "io_macros.mac"

ERR_ASTERISK_NOT_FOLLOWED_BY_DIGIT_OR_OPENPAREN:
	write_to_stderr \
		err_asterisk_not_followed_by_digit_or_openparen_msg, \
		err_asterisk_not_followed_by_digit_or_openparen_msg_len
	jmp ERROR_EXIT

ERR_INVALID_NUMBER_OF_CL_ARGS:
	write_to_stderr \
		err_invalid_number_of_cl_args_msg, \
		err_invalid_number_of_cl_args_msg_len
	jmp ERROR_EXIT

ERR_MINUS_NOT_FOLLOWED_BY_DIGIT_OR_OPENPAREN:
	write_to_stderr \
		err_minus_not_followed_by_digit_or_openparen_msg, \
		err_minus_not_followed_by_digit_or_openparen_msg_len
	jmp ERROR_EXIT

ERR_MISPLACED_DOT:
	write_to_stderr \
		err_misplaced_dot_msg, \
		err_misplaced_dot_msg_len
	jmp ERROR_EXIT

ERR_SLASH_NOT_FOLLOWED_BY_DIGIT_OR_OPENPAREN:
	write_to_stderr \
		err_slash_not_followed_by_digit_or_openparen_msg, \
		err_slash_not_followed_by_digit_or_openparen_msg_len
	jmp ERROR_EXIT

ERR_TOO_MANY_CLOSEPARENS:
	write_to_stderr \
		err_too_many_closeparens_msg, \
		err_too_many_closeparens_msg_len
	jmp ERROR_EXIT

ERR_UNRECOGNIZED_CHARACTER:
	cmp byte [r8], 0
	jne ERR_UNRECOGNIZED_CHARACTER_ACTUALLY_UNRECOGNIZED_CHARACTER

	ret

	ERR_UNRECOGNIZED_CHARACTER_ACTUALLY_UNRECOGNIZED_CHARACTER:
	write_to_stderr \
		err_unrecognized_character_msg, \
		err_unrecognized_character_msg_len
	jmp ERROR_EXIT

