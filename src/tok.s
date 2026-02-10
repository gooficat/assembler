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

	tok_getc

	add $32, %rsp
failure:
	ret

tok_next:
	mov TOK_STRM_BUFF(%r13), %r14
	cmp '0', %r14
	jl symb
	cmp 'z', %r14
	jg symb

	lea TOK_STRM_TOKN(%r13), %rsi
	mov TOK_STRM_FILE(%r13), %rcx
lp:
	mov TOK_STRM_BUFF(%r13), %rax
	mov %rax, (%rsi)
	
	call fgetc
	
	cmp '0', %rax
	jl done
	cmp 'z', %rax
	jg done
	
	inc %rsi
	jmp lp

symb:
	mov TOK_STRM_BUFF(%r13), %rax
	mov %rax, TOK_STRM_TOKN(%r13)
	tok_getc
done:
	ret


.data

fmode_rt:
	.asciz "r"
