.section ".text"

.globl asm_pass, assemble

.include "token.inc"
.include "vec.inc"
.include "unit.inc"

assemble:
    sub $168, %rsp
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

	movb $ASM_PASS_LABEL, 118 + asm_unit_pass(%rsp)
	jmp pass_loop
	
rept_pass:
	lea 74(%rsp), %rcx
	call tok_strm_rewind

pass_loop:
	call handle_line
	cmpb $0, 74 + tok_strm_buffer(%rsp)
	jne pass_loop

	cmpb $ASM_PASS_WRITE, 118 + asm_unit_pass(%rsp)
	// jle rept_pass

	call tok_strm_close
    add $168, %rsp
	ret

handle_line:

.data

fmode_wb: .asciz "wb"
