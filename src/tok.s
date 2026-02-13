.text

.globl tok_strm_init, tok_strm_next, tok_strm_cont, tok_strm_rewind, tok_strm_close

.include "tok.inc"

# passed on rcx


# move forward a char
tok_strm_cont:
	ret


# file path on rdi
tok_strm_init:
	mov $0, %rsi
	mov $0, %rdx # O_RDONLY
	syscall
	mov %rax, tok_strm_file(%rcx)



	ret

tok_strm_next:
	ret

tok_strm_rewind:
	ret

tok_strm_close:
	ret

.data

