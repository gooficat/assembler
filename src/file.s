.text

.include "file.inc"


.globl fstrm_open, fstrm_getc, fstrm_close

# rdi: fstrm*, rsi: fpath*[]
fstrm_open:
	mov $2, %rax
	push %rdi
	mov %rsi, %rdi
	xor %rsi, %rsi
	syscall
	pop %rdi
	mov %eax, fstrm_fdesc(%rdi)	
	call fstrm_advance
	ret

fstrm_getc:
	cmpw $fstrm_buff_len, fstrm_seeker(%rdi)
	jne fstrm_getc_no_advance
	call fstrm_advance
fstrm_getc_no_advance:
	lea fstrm_buffer(%rdi), %rax
	add fstrm_seeker(%rdi), %ax
	movb (%rax), %al
	incw fstrm_seeker(%rdi)
	ret

fstrm_advance:
	mov $0, %rax
	push %rdi
	lea fstrm_buffer(%rdi), %rsi
	mov fstrm_fdesc(%rdi), %rdi
	mov $fstrm_buff_len, %rdx
	syscall
	pop %rdi
	mov %rax, fstrm_buffl(%rdi)
	movw $0, fstrm_seeker(%rdi)
	ret

fstrm_close:
	mov $3, %rax
	mov fstrm_fdesc(%rdi), %rdi
	syscall
	ret
