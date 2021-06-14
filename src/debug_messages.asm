
debug_handling_openparen_msg: \
db "DEBUG: Handling the character: '('", 0x0A
debug_handling_openparen_msg_len: \
equ $ - debug_handling_openparen_msg

debug_handling_closeparen_msg: \
db "DEBUG: Handling the character: ')'", 0x0A
debug_handling_closeparen_msg_len: \
equ $ - debug_handling_closeparen_msg

debug_handling_asterisk_msg: \
db "DEBUG: Handling the character: '*'", 0x0A
debug_handling_asterisk_msg_len: \
equ $ - debug_handling_asterisk_msg

debug_handling_plus_msg: \
db "DEBUG: Handling the character: '+'", 0x0A
debug_handling_plus_msg_len: \
equ $ - debug_handling_plus_msg

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

debug_handling_the_digit_msg_beginning: \
db "DEBUG: Handling the digit: '"
debug_handling_the_digit_msg_beginning_len: \
equ $ - debug_handling_the_digit_msg_beginning

debug_handling_the_digit_msg_end: \
db "'", 0x0A
debug_handling_the_digit_msg_end_len: \
equ $ - debug_handling_the_digit_msg_end

debug_input_string_was_msg_beginning: \
db "DEBUG: The input string was: '"
debug_input_string_was_msg_beginning_len: \
equ $ - debug_input_string_was_msg_beginning

debug_input_string_was_msg_end: \
db "'", 0x0A
debug_input_string_was_msg_end_len: \
equ $ - debug_input_string_was_msg_end

