.text

# ptr on rcx

.include "file.inc"


.globl fstrm_open, fstrm_getc, fstrm_close

# file path on rdi
fstrm_open:
	mov $2, %rax # syscall_open
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


fstrm_getc:
	incw fstrm_seeker(%rcx)
	cmpw $fstrm_buff_len, fstrm_seeker(%rcx)
	jne no_inc
	call fstrm_incbuf
no_inc:
	lea fstrm_buffer(%rcx), %rax
	add fstrm_seeker(%rcx), %rax
	movzb (%rax), %rax
	ret


fstrm_close:
	mov $3, %rax
	mov fstrm_fdesc(%rcx), %rdi
	syscall
	ret
