
%define DEBUG
%include "io_macros.mac"
%include "string_macros.mac"

	section .text
	global _start

_start:	pop r8			; get the number of command-line arguments
	cmp r8, 2		; program path + the expression string
	jne ERR_INVALID_NUMBER_OF_CL_ARGS

	pop r8			; ignore the path to the executable
	pop r8			; get a pointer to the start of the expression
	strlen r8, r9		; get the length of the expression string

	%ifdef DEBUG
		write_to_stdout debug_input_string_was_msg, \
			debug_input_string_was_msg_len
		write_to_stdout r8, r9
		write_to_stdout nl, 1
	%endif

	add r8, r9
	parseint r8, r10

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

