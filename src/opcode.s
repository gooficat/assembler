.text

.globl find_opcode

.include "opc_tbl.inc"

.intel_syntax noprefix

# string on rcx
find_opcode:
	sub rsp, 56
	mov qword ptr 40[rsp], rsi
	mov qword ptr 32[rsp], rcx
	lea rsi, qword ptr opcode_classes[rip]
find_opcode_loop:
	mov rdx, qword ptr [rsi]
	call strcmp
	cmp rax, 0
	je find_opcode_found
	add rsi, 8
	lea rax, qword ptr opcode_classes_end[rip]
	mov rcx, qword ptr 32[rsp]
	cmp rsi, rax
	jne find_opcode_loop
	xor rax, rax
	jmp find_opcode_none_found
find_opcode_found:
	mov rax, rsi
find_opcode_none_found:
	mov rsi, qword ptr 40[rsp]
	add rsp, 56
	ret
