
/* 
struc frd_strm {
	seeker : 8 (ptr)
	buffer : 256 (char[256])
	buffl : 2 (short)
}
*/


/*
struc tok_strm {
	token : 32 (char[32])
	toksz : 1 (byte)

	strm : 266 (frd_strm)
}
*/

.equ tok_strm_file, 0
.equ tok_strm_buff, tok_strm_file + 8
.equ tok_strm_tokn, tok_strm_buff + 4
.equ tok_strm_size, tok_strm_tokn + 32

.extern tok_strm_init, tok_strm_next, tok_strm_cont, tok_strm_rewind, tok_strm_close
