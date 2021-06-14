
%include "io_macros.mac"

ERR_ASTERISK_NOT_FOLLOWED_BY_DIGIT_OR_OPENPAREN:
	write_to_stderr \
		err_asterisk_not_followed_by_digit_or_openparen_msg, \
		err_asterisk_not_followed_by_digit_or_openparen_msg_len

	mov rax, SYS_EXIT
	mov rdi, 1
	syscall

ERR_INVALID_NUMBER_OF_CL_ARGS:
	write_to_stderr \
		err_invalid_number_of_cl_args_msg, \
		err_invalid_number_of_cl_args_msg_len

	mov rax, SYS_EXIT
	mov rdi, 1
	syscall

ERR_SLASH_NOT_FOLLOWED_BY_DIGIT_OR_OPENPAREN:
	write_to_stderr \
		err_slash_not_followed_by_digit_or_openparen_msg, \
		err_slash_not_followed_by_digit_or_openparen_msg_len

	mov rax, SYS_EXIT
	mov rdi, 1
	syscall

ERR_UNRECOGNIZED_CHARACTER:
	cmp byte [r8], 0
	je NORMAL_EXIT

	write_to_stderr \
		err_unrecognized_character_msg, \
		err_unrecognized_character_msg_len

	mov rax, SYS_EXIT
	mov rdi, 1
	syscall

