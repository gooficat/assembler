.text

.globl main

.intel_syntax noprefix
.include "token.inc"

main:
	sub rsp, 88
	
	lea rcx, qword ptr msg[rip]
	call puts

	lea rcx, 32[rsp]
	lea rdx, test_path[rip]
	call ts_init


	mov rcx, 32+ts_file[rsp]
	call fclose

	add rsp, 88
	xor eax, eax
	ret

.data

msg: .asciz "Hello"
test_path: .asciz "../tests/test1.s"
