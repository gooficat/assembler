.section ".text"
.include "tok.inc"
.globl tok_strm_init, tok_strm_next
tok_strm_init:
	sub $40, %rsp
	mov %rcx, 32(%rsp)
	mov %rdx, %rcx
	lea fmode_rt(%rip), %rdx
	call fopen
	mov 32(%rsp), %rcx
	mov %rax, tok_strm_file(%rcx)
	call tok_strm_getc
	call tok_strm_next
	add $40, %rsp
	ret
tok_strm_next:
	sub $40, %rsp
	mov %rcx, 32(%rsp)
	mov %rax, tok_strm_buff(%rcx)
	lea tok_strm_tokn(%rcx), %r8
	movb $'T', (%r8)
	movb $0, 1(%r8)
	add $40, %rsp
	ret
tok_strm_getc:
	sub $40, %rsp
	mov %rcx, 32(%rsp)
	mov tok_strm_file(%rcx), %rcx
	call fgetc
	mov 32(%rsp), %rcx
	mov %ax, tok_strm_buff(%rcx)
	add $40, %rsp
	ret
.data
fmode_rt:
	.asciz "rt"
