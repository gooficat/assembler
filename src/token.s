.text

.intel_syntax noprefix

.globl ts_init, ts_next

.include "token.inc"

ts_init:
	sub rsp, 40
	mov qword ptr 32[rsp], rcx
	mov rcx, rdx
	lea rdx, fmode_rt[rip]
	call fopen
	mov rcx, qword ptr 32[rsp]
	mov qword ptr ts_file[rcx], rax
	mov rcx, rax
	call fgetc
	mov rcx, qword ptr 32[rsp]
	mov dword ptr ts_buff[rcx], eax
	add rsp, 40
	ret

ts_next:
	sub rsp, 56
	mov qword ptr 32[rsp], rcx
	call ts_strip_whitespace
	mov eax, dword ptr ts_buff[rcx]
	lea ts_token[rcx], rdx
	cmp eax, '0'
	jl ts_next_not_alnum
	cmp eax, 'z'
	jg ts_next_not_alnum
ts_next_alnum_loop:
	mov qword ptr 32[rsp], rcx
	mov qword ptr 40[rsp], rdx
	call fgetc
	mov rcx, qword ptr 32[rsp]
	mov rdx, qword ptr 40[rsp]
ts_next_not_alnum:

	mov qword ptr 32[rsp], rcx
	mov qword ptr 40[rsp], rdx
	call fgetc
	mov rcx, qword ptr 32[rsp]
	mov rdx, qword ptr 40[rsp]
ts_next_alnum_done:
	inc rdx
	mov dword ptr [rdx], 0
	add rsp, 56
	ret

ts_strip_whitespace:
	sub rsp, 40
	mov 32[rsp], rcx
	
	add rsp, 40
	ret

.data

fmode_rt:
	.asciz "rt"
