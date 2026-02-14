.text

.globl tok_strm_init, tok_strm_next, tok_strm_cont, tok_strm_rewind, tok_strm_close

.include "tok.inc"
.include "file.inc"

# passed on rcx


# move forward a char
tok_strm_cont:
	push %rcx
	mov tok_strm_fstrm(%rcx), %rcx
	pop %rcx
	ret


# pointer to file stream on rdi
tok_strm_init:
	mov %rdi, tok_strm_fstrm(%rcx)
	call tok_strm_cont

	ret

tok_strm_next:
	ret

tok_strm_rewind:
	ret

tok_strm_close:
	ret

.data

