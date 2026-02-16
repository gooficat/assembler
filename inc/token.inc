.extern tok_strm_init, tok_strm_next, tok_strm_close

.equ tok_strm_file, 0
.equ tok_strm_buffer, tok_strm_file + 8
.equ tok_strm_token, tok_strm_buffer + 4
.equ tok_strm_struc_size, tok_strm_token + 32
# 44
