.text

# ptr on rcx

.include "file.inc"


.globl fstrm_open, fstrm_getc, fstrm_close

# file path on rdi
fstrm_open:
	mov $2, %rsi # syscall_open
	mov $0, %rdx # O_RDONLY
	push %rcx
	syscall
	pop %rcx
	mov %eax, fstrm_fdesc(%rcx)
	call fstrm_incbuf
	ret

fstrm_incbuf:
	mov fstrm_fdesc(%rcx), %edi # fstrm.fd
	lea fstrm_buffer(%rcx), %rsi # &fstrm.buffer[0]
	mov %rsi, fstrm_seeker(%rcx) # fstrm.seeker = fstrm.buffer
	mov $0, %rax # syscall_read
	mov $fstrm_buff_len, %rdx # file
	push %rcx # save fstrm
	syscall # read
	pop %rcx
	mov %rax, fstrm_buffl(%rcx) # result
	ret
