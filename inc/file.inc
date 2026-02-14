/* 
struc frd_strm {
	fdesc : 4 (long)
	seeker : 8 (ptr)
	buffl : 8 (quad)
	buffer : 256 (char[256])
}
*/
.equ fstrm_buff_len, 256

.equ fstrm_fdesc, 0
.equ fstrm_seeker, fstrm_fdesc + 4
.equ fstrm_buffl, fstrm_seeker + 8
.equ fstrm_buffer, fstrm_buffl + 8
.equ fstrm_size, fstrm_buffer + fstrm_buff_len

.extern fstrm_open, fstrm_getc, fstrm_close
