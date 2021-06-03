
%define DEBUG
%include "macros.mac"

	section .text
	global _start

_start:	pop r8			; get the number of command-line arguments
	cmp r8, 2
	jne ERR_INVALID_NUMBER_OF_CL_ARGS

	

	mov rax, SYS_EXIT
	mov rdi, 0
	syscall

ERR_INVALID_NUMBER_OF_CL_ARGS:
	mov rax, SYS_WRITE
	mov rdi, STDERR
	mov rsi, err_invalid_number_of_cl_args_msg
	mov rdx, err_invalid_number_of_cl_args_msg_len
	syscall

	mov rax, SYS_EXIT
	mov rdi, 1
	syscall


	section .data
err_invalid_number_of_cl_args_msg: \
db "Error: invalid number of command-line arguments", 0x0A
err_invalid_number_of_cl_args_msg_len: \
equ $ - err_invalid_number_of_cl_args_msg

