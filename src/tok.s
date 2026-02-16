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
	sub $56, %rsp
	mov %rcx, 32(%rsp)
	mov %rsi, 40(%rsp)
	lea tok_strm_tokn(%rcx), %rsi
	cmpl $'0', tok_strm_buff(%rcx)
	jl tok_strm_next_not_alnum
	cmpl $'z', tok_strm_buff(%rcx)
	jg tok_strm_next_not_alnum
tok_strm_next_alnum_loop:
	mov %al, (%rsi)
	inc %rsi
	call tok_strm_getc
	mov %rcx, 32(%rsp)
	cmpl $'0', tok_strm_buff(%rcx)
	jl tok_strm_next_alnum_done
	cmpl $'z', tok_strm_buff(%rcx)
	jg tok_strm_next_alnum_done
	jmp tok_strm_next_alnum_loop
tok_strm_next_not_alnum:
	cmpl $-1, tok_strm_buff(%rcx)
	je tok_strm_next_alnum_done
	mov %al, (%rsi)
	inc %rsi
	call tok_strm_getc
	mov %rcx, 32(%rsp)
tok_strm_next_alnum_done:
	movb $0, (%rsi)
	mov 40(%rsp), %rsi
	add $56, %rsp
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
