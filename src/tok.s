.text

.globl tok_next, tok_open

.include "tok.inc"

# offset on r13

.macro tok_getc
	mov TOK_STRM_FILE(%r13), %rcx
	call fgetc
	mov %eax, TOK_STRM_BUFF(%r13)
.endm

# filename should be on rcx

tok_open:
	lea fmode_rt(%rip), %rdx
	sub $32, %rsp
	call fopen

	cmp $0, %rax
	je failure

	mov %rax, TOK_STRM_FILE(%r13)

	mov TOK_STRM_FILE(%r13), %rcx
	call fgetc
	mov %eax, TOK_STRM_BUFF(%r13)

	add $32, %rsp
failure:
	ret

tok_next:

	ret


.data

fmode_rt:
	.asciz "r"