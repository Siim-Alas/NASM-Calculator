
ERR_INVALID_NUMBER_OF_CL_ARGS:
	mov rax, SYS_WRITE
	mov rdi, STDERR
	mov rsi, err_invalid_number_of_cl_args_msg
	mov rdx, err_invalid_number_of_cl_args_msg_len
	syscall

	mov rax, SYS_EXIT
	mov rdi, 1
	syscall

