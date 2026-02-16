.section ".text"
.globl unit_assemble, unit_pass
.include "tok.inc"
.include "unit.inc"
unit_assemble:
/*
32: unit
42: tok stream
*/
	sub $88, %rsp
	mov %rcx, %rdx
	lea 42(%rsp), %rcx
	call tok_strm_init
	lea 42 + tok_strm_tokn(%rsp), %rcx
	call puts
	movb $UNIT_PASS_LABEL, 32 + unit_current_pass(%rsp)
	jmp unit_assemble_pass_loop_entry
unit_assemble_pass_loop:
	# call tok_strm_rewind
unit_assemble_pass_loop_entry:
	lea 32(%rsp), %rcx
	call unit_pass
	cmpb $UNIT_PASS_DONE, 32 + unit_current_pass(%rsp)
	jne unit_assemble_pass_loop
	add $88, %rsp
	ret
unit_pass:
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
	# jmp unit_pass_current_eoswitch
unit_pass_current_eoswitch:
	mov unit_next_pass(%rcx), %al
	mov %al, unit_current_pass(%rcx)
	ret
