
%define DEBUG
%include "macros.mac"

	section .text
	global _start

_start:	pop r8			; get the number of command-line arguments
	cmp r8, 2		; program path + the expression string
	jne ERR_INVALID_NUMBER_OF_CL_ARGS

	pop rsi			; get a pointer to the start of the expression
	strlen rdx, rsi		; get the length of the expression string

	mov rax, SYS_EXIT
	mov rdi, 0
	syscall

%include "error_handlers.asm"


	section .data
%include "error_messages.asm"

