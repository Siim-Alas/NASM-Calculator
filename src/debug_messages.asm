
debug_handling_openparen_msg: \
db "DEBUG: Handling the character: '('", 0x0A
debug_handling_openparen_msg_len: \
equ $ - debug_handling_openparen_msg

debug_handling_closeparen_msg: \
db "DEBUG: Handling the character: ')'", 0x0A
debug_handling_closeparen_msg_len: \
equ $ - debug_handling_closeparen_msg

debug_handling_star_msg: \
db "DEBUG: Handling the character: '*'", 0x0A
debug_handling_star_msg_len: \
equ $ - debug_handling_star_msg

debug_handling_plus_msg: \
db "DEBUG: Handling the character: '+'", 0x0A
debug_handling_plus_msg_len: \
equ $ - debug_handling_plus_msg

debug_handling_comma_msg: \
db "DEBUG: Handling the character: ','", 0x0A
debug_handling_comma_msg_len: \
equ $ - debug_handling_comma_msg

debug_handling_minus_msg: \
db "DEBUG: Handling the character: '-'", 0x0A
debug_handling_minus_msg_len: \
equ $ - debug_handling_minus_msg

debug_handling_dot_msg: \
db "DEBUG: Handling the character: '.'", 0x0A
debug_handling_dot_msg_len: \
equ $ - debug_handling_dot_msg

debug_handling_slash_msg: \
db "DEBUG: Handling the character: '/'", 0x0A
debug_handling_slash_msg_len: \
equ $ - debug_handling_slash_msg

debug_handling_digit_msg: \
db "DEBUG: Handling a digit", 0x0A
debug_handling_digit_msg_len: \
equ $ - debug_handling_digit_msg

debug_input_string_was_msg: \
db "DEBUG: The input string was: "
debug_input_string_was_msg_len: \
equ $ - debug_input_string_was_msg

