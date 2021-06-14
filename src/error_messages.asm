
err_asterisk_not_followed_by_digit_or_openparen_msg: \
db "ERROR: A '*' was not followed by a digit (0-9) or '('.", 0x0A
err_asterisk_not_followed_by_digit_or_openparen_msg_len: \
equ $ - err_asterisk_not_followed_by_digit_or_openparen_msg

err_invalid_number_of_cl_args_msg: \
db "ERROR: Invalid number of command-line arguments.", 0x0A
err_invalid_number_of_cl_args_msg_len: \
equ $ - err_invalid_number_of_cl_args_msg

err_slash_not_followed_by_digit_or_openparen_msg: \
db "ERROR: A '/' was not followed by a digit (0-9) or '('.", 0x0A
err_slash_not_followed_by_digit_or_openparen_msg_len: \
equ $ - err_slash_not_followed_by_digit_or_openparen_msg

err_unrecognized_character_msg: \
db "ERROR: Unrecognized character.", 0x0A
err_unrecognized_character_msg_len: \
equ $ - err_unrecognized_character_msg

