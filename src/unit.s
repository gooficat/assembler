.section ".text"
.globl unit_assemble, unit_pass, handle_line
.include "tok.inc"
.include "unit.inc"
.include "direc.inc"
unit_assemble:
/*
32: unit
66: tok stream
*/
	sub $120, %rsp
	mov %rcx, %rdx
	lea 72(%rsp), %rcx
	call tok_strm_init
	movb $UNIT_PASS_LABEL, 32 + unit_current_pass(%rsp)
	jmp unit_assemble_pass_loop_entry
unit_assemble_pass_loop:
	lea 72(%rsp), %rcx
	call tok_strm_rewind
unit_assemble_pass_loop_entry:
	lea 32(%rsp), %rcx
	lea 72(%rsp), %rdx
	call unit_pass
	cmpb $UNIT_PASS_DONE, 32 + unit_current_pass(%rsp)
	jne unit_assemble_pass_loop
	add $120, %rsp
	ret
unit_pass:
	sub $40, %rsp
	cmpb $UNIT_PASS_LABEL, unit_current_pass(%rcx)
	je unit_pass_current_switch1_label
	cmpb $UNIT_PASS_ALIGN, unit_current_pass(%rcx)
	je unit_pass_current_switch1_align
	jmp unit_pass_current_switch1_done
unit_pass_current_switch1_label:
	movb $UNIT_PASS_ALIGN, unit_next_pass(%rcx)
	jmp unit_pass_current_eoswitch
unit_pass_current_switch1_align:
	movb $UNIT_PASS_WRITE, unit_next_pass(%rcx)
	jmp unit_pass_current_eoswitch
unit_pass_current_switch1_done:
	movb $UNIT_PASS_DONE, unit_next_pass(%rcx)
unit_pass_current_eoswitch:
	mov unit_next_pass(%rcx), %al
	mov %al, unit_current_pass(%rcx)
unit_pass_line_loop:
	cmpb $0, tok_strm_tokn(%rdx)
	je unit_pass_done
	call handle_line
	jmp unit_pass_line_loop
unit_pass_done:
	add $40, %rsp
	ret
handle_line:
	sub $56, %rsp
	mov %rcx, 32(%rsp)
	mov %rdx, 40(%rsp)
	lea tok_strm_tokn(%rdx), %rcx
	call puts
	mov 32(%rsp), %rcx
	mov 40(%rsp), %rdx
	cmpb $':', tok_strm_buff(%rdx)
	je handle_line_switch1_label
	cmpb $'.', tok_strm_tokn(%rdx)
	je handle_line_switch1_directive
	cmpb $'0', tok_strm_tokn(%rdx)
	jl handle_line_switch1_none
	cmpb $'z', tok_strm_tokn(%rdx)
	jg handle_line_switch1_none
	jmp handle_line_switch1_instruction
handle_line_switch1_directive:
	call handle_directive
	jmp handle_line_switch1_end
handle_line_switch1_label:
	call handle_label
	jmp handle_line_switch1_end
handle_line_switch1_instruction:
	call handle_instruction
	jmp handle_line_switch1_end
handle_line_switch1_none:
	mov %rdx, %rcx
	call tok_strm_next
	mov 32(%rsp), %rcx
	mov 40(%rsp), %rdx
handle_line_switch1_end:
	add $56, %rsp
	ret
handle_label:
	ret
handle_instruction:
	sub $56, %rsp
	mov %rcx, 32(%rsp)
	mov %rdx, 40(%rsp)
	mov %rdx, %rcx
	call tok_strm_next
	mov 32(%rsp), %rcx
	mov 40(%rsp), %rdx
	add $56, %rsp
	ret
