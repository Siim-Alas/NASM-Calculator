
%define DEBUG
%include "config.mac"
%include "io_macros.mac"
%include "string_macros.mac"

	section .text
	global _start

_start:	pop r8			; get the number of command-line arguments
	cmp r8, 2		; program path + the expression string
	jne ERR_INVALID_NUMBER_OF_CL_ARGS

	pop r8			; ignore the path to the executable
	pop r8			; get a pointer to the start of the expression

	%ifdef DEBUG
		strlen r8, r9	; get the length of the expression string
		write_to_stdout debug_input_string_was_msg, \
			debug_input_string_was_msg_len
		write_to_stdout r8, r9
		write_to_stdout nl, 1
	%endif

	find_handler r8, \
		ERR_UNRECOGNIZED_CHARACTER, \
		HANDLE_OPENPAREN, \
		HANDLE_CLOSEPAREN, \
		HANDLE_STAR, \
		HANDLE_PLUS, \
		HANDLE_COMMA, \
		HANDLE_MINUS, \
		HANDLE_DOT, \
		HANDLE_SLASH, \
		HANDLE_DIGIT

	string_to_float r8

	mov rsi, outmsg
	float_to_string rsi

	write_to_stdout outmsg, FLOAT_STRINGREP_LEN
	write_to_stdout nl, 1

	mov rax, SYS_EXIT
	mov rdi, 0
	syscall

%include "character_handlers.asm"
%include "error_handlers.asm"


	section .data
nl:	db 0x0A
%ifdef DEBUG
	%include "debug_messages.asm"
%endif
%include "error_messages.asm"


	section .bss
outmsg:	resb FLOAT_STRINGREP_LEN

