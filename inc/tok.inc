.extern tok_strm_init, tok_strm_next, tok_strm_rewind
.equ tok_max_size, 32
.equ tok_strm_file, 0
.equ tok_strm_buff, tok_strm_file + 8
.equ tok_strm_tokn, tok_strm_buff + 4
.equ tok_strm_struc_size, tok_strm_tokn + tok_max_size
