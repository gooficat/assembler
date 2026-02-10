.text
.globl main

.include "reg.inc"
.include "tok.inc"


main:
	sub $TOK_STRM_LEN+4, %rsp
	mov %rsp, %r13

	call greet

	lea test_path(%rip), %rcx
	call tok_open
	
	add $TOK_STRM_LEN+4, %rsp

	xor %eax, %eax
	ret

greet:
	sub $32, %rsp
	lea msg(%rip), %rcx
	call puts
	add $32, %rsp
	ret

.data
msg:
	.asciz "Hello"

test_reg:
	.asciz "rsp"

test_ins_mnem:
	.asciz "ret"

test_ins:
	.asciz "add rax, rcx"

reg_fmt:
	.asciz "reg '%02hhx'\n"

ins_fmt:
	.asciz "ins '%s'\n"

test_path:
	.asciz "../src/tok.s"
