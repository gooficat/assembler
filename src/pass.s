.section ".text"

.globl asm_pass, assemble

.include "token.inc"
.include "vec.inc"
.include "unit.inc"

assemble:
    sub $160, %rsp
/*
152: temp storage
118: asm unit
74: token stream
*/
	mov %rcx, 152(%rsp)
	mov %rdx, %rcx
	lea fmode_wb(%rip), %rdx
	call fopen
	
	mov 152(%rsp), %rdx
	mov %rax, 118 + asm_unit_out_file(%rsp)

	lea 74(%rsp), %rcx
	call tok_strm_init

	lea 74 + tok_strm_token(%rsp), %rcx
	call puts

    add $160, %rsp
	ret

asm_pass:
	ret	


.data

fmode_wb: .asciz "wb"
