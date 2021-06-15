
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
		write_to_stdout \
			debug_input_string_was_msg_beginning, \
			debug_input_string_was_msg_beginning_len
		write_to_stdout r8, r9
		write_to_stdout \
			debug_input_string_was_msg_end, \
			debug_input_string_was_msg_end_len
	%endif

	push ERR_TOO_MANY_CLOSEPARENS	; prevent returning to random memory

	find_handler r8, ERR_UNRECOGNIZED_CHARACTER, char_handler_jmp_table
	call rax

NORMAL_EXIT:
	mov rsi, outmsg
	float_to_string rsi

	write_to_stdout outmsg, FLOAT_STRINGREP_LEN
	write_to_stdout nl, 1

	mov rax, SYS_EXIT
	mov rdi, 0
	syscall

ERROR_EXIT:
	mov rax, SYS_EXIT
	mov rdi, 1
	syscall

%include "character_handlers.asm"
%include "error_handlers.asm"


	section .data
nl:	db 0x0A
char_handler_jmp_table: dd \
	HANDLE_OPENPAREN, \
	HANDLE_CLOSEPAREN, \
	HANDLE_ASTERISK, \
	HANDLE_PLUS, \
	ERR_UNRECOGNIZED_CHARACTER, \
	HANDLE_MINUS, \
	ERR_MISPLACED_DOT, \
	HANDLE_SLASH
	times 10 dd HANDLE_DIGIT
%ifdef DEBUG
	%include "debug_messages.asm"
%endif
%include "error_messages.asm"


	section .bss
outmsg:	resb FLOAT_STRINGREP_LEN

