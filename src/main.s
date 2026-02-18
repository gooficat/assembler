.text

.globl main

.intel_syntax noprefix
.include "token.inc"

main:
	sub rsp, 88
	
	lea rcx, qword ptr msg[rip]
	call puts

	lea rcx, qword ptr 32[rsp]
	lea rdx, qword ptr test_path[rip]
	call ts_init

print_strm_loop:
	lea rcx, qword ptr 32[rsp]
	call ts_next

	lea rcx, qword ptr 32 + ts_token[rsp]
	call puts
	
	cmp byte ptr 32 + ts_token[rsp], 0
	jne print_strm_loop

	mov rcx, qword ptr 32+ts_file[rsp]
	call fclose

	add rsp, 88
	xor eax, eax
	ret

.data

msg: .asciz "Hello"
test_path: .asciz "../tests/test1.s"
