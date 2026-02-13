

/*
struc tok_strm {
	fstrm : 8 (ptr)
	buffc : 2 (word) holds the character or -1 for EOF
	token : 32 (char[32])
}
*/

.equ tok_strm_fstrm, 0
.equ tok_strm_buff, tok_strm_fstrm + fstrm_size
.equ tok_strm_tokn, tok_strm_buff + 2
.equ tok_strm_size, tok_strm_tokn + 32

.extern tok_strm_init, tok_strm_next, tok_strm_cont, tok_strm_rewind, tok_strm_close
