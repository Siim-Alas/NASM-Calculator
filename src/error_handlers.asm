
%include "io_macros.mac"

ERR_INVALID_NUMBER_OF_CL_ARGS:
	write_to_stderr \
		err_invalid_number_of_cl_args_msg, \
		err_invalid_number_of_cl_args_msg_len

	mov rax, SYS_EXIT
	mov rdi, 1
	syscall

ERR_UNRECOGNIZED_CHARACTER:
	write_to_stderr \
		err_unrecognized_character_msg, \
		err_unrecognized_character_msg_len

	mov rax, SYS_EXIT
	mov rdi, 1
	syscall

