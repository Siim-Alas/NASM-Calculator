
%define DEBUG
%include "macros.mac"

	section .text
	global _start

_start:	pop r8			; get the number of command-line arguments
	cmp r8, 2		; program path + the expression string
	jne ERR_INVALID_NUMBER_OF_CL_ARGS

	pop rsi			; ignore the path to the executable
	pop rsi			; get a pointer to the start of the expression
	strlen rsi, rdx		; get the length of the expression string

	%ifdef DEBUG
		push rsi
		push rdx

		write_to_stdout debug_input_string_was_msg, \
			debug_input_string_was_msg_len

		pop rdx
		pop rsi

		write_to_stdout rsi, rdx
		write_to_stdout nl, 1
	%endif

	mov rax, SYS_EXIT
	mov rdi, 0
	syscall

%include "error_handlers.asm"


	section .data
%ifdef DEBUG
nl:	db 0x0A
	%include "debug_messages.asm"
%endif
%include "error_messages.asm"

