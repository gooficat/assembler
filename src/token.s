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
	// call ts_next
	add rsp, 40
	ret

ts_next:
	sub rsp, 56
	mov qword ptr 32[rsp], rcx
	call ts_strip_whitespace
	mov eax, dword ptr ts_buff[rcx]
	lea rdx, qword ptr ts_token[rcx]
	cmp eax, '0'
	jl ts_next_not_alnum
	cmp eax, 'z'
	jg ts_next_not_alnum
ts_next_alnum_loop:
	mov dword ptr [rdx], eax
	mov qword ptr 32[rsp], rcx
	mov qword ptr 40[rsp], rdx
	mov rcx, ts_file[rcx]
	call fgetc
	mov rcx, qword ptr 32[rsp]
	mov rdx, qword ptr 40[rsp]
	cmp eax, '0'
	jl ts_next_alnum_done
	cmp eax, 'z'
	jg ts_next_alnum_done
	inc rdx
	jmp ts_next_alnum_loop

ts_next_not_alnum:
	mov dword ptr [rdx], eax
	mov qword ptr 32[rsp], rcx
	mov qword ptr 40[rsp], rdx
	mov rcx, ts_file[rcx]
	call fgetc
	mov rcx, qword ptr 32[rsp]
	mov rdx, qword ptr 40[rsp]
ts_next_alnum_done:
	inc rdx
	mov dword ptr [rdx], 0
	mov dword ptr ts_buff[rcx], eax
	add rsp, 56
	ret

ts_strip_whitespace:
	sub rsp, 40
ts_strip_whitespace_check:
	mov 32[rsp], rcx
	cmp byte ptr ts_buff[rcx], ' '
	je ts_strip_whitespace_strip
	cmp byte ptr ts_buff[rcx], '\n'
	je ts_strip_whitespace_strip
	cmp byte ptr ts_buff[rcx], '\t'
	je ts_strip_whitespace_strip
	cmp byte ptr ts_buff[rcx], '\b'
	je ts_strip_whitespace_strip
	cmp byte ptr ts_buff[rcx], '\r'
	je ts_strip_whitespace_strip
	add rsp, 40
	ret
ts_strip_whitespace_strip:
	call fgetc
	mov rcx, 32[rsp]
	jmp ts_strip_whitespace_check
.data

fmode_rt:
	.asciz "rt"
