
%include "macros.mac"

	section .text
	global _start

_start:	mov rax, SYS_WRITE
	mov rdi, STDOUT
	mov rsi, msg
	mov rdx, len
	syscall

	section .data
msg:	db "hello", 0x0A
len:	equ $ - msg

