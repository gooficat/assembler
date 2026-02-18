.text

.intel_syntax noprefix

.globl lexer_next

lexer_next:
	sub rsp, 56
	mov qword ptr 32[rsp], rcx
	mov rdx, qword ptr lexer_ts_ptr[rcx]
	mov qword ptr 40[rsp], rdx

	cmp qword ptr ts_token[rdx], '.'
	je lexer_next_switch_direc
	
	lea rcx, qword ptr ts_token[rdx]
	call find_opcode
	cmp rax, 0
	jne lexer_next_switch_inst
	
lexer_next_switch_direc:
	jmp lexer_next_switch_exit
lexer_next_switch_inst:
	mov 32 + lexer_type[rsp], TokTypeInstruction
	jmp lexer_next_switch_exit
lexer_next_switch_exit:
	add rsp, 56
	ret
