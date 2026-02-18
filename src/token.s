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
	mov rcx, qword ptr 32[rsp]
	mov eax, dword ptr ts_buff[rcx]
	lea rdx, qword ptr ts_token[rcx]
	cmp eax, '_'
	je ts_next_alnum_loop
	cmp eax, '0'
	jl ts_next_not_alnum
	cmp eax, 'z'
	jg ts_next_not_alnum
ts_next_alnum_loop:
	mov byte ptr [rdx], al
	mov qword ptr 40[rsp], rdx
	mov rcx, ts_file[rcx]
	call fgetc
	mov rcx, qword ptr 32[rsp]
	mov rdx, qword ptr 40[rsp]
	inc rdx
	cmp eax, '_'
	je ts_next_is_uscore2
	cmp eax, '0'
	jl ts_next_alnum_done
	cmp eax, 'z'
	jg ts_next_alnum_done
ts_next_is_uscore2:
	jmp ts_next_alnum_loop
ts_next_not_alnum:
	cmp eax, -1
	je ts_next_alnum_done
	mov byte ptr [rdx], al
	mov qword ptr 40[rsp], rdx
	mov rcx, ts_file[rcx]
	call fgetc
	mov rcx, qword ptr 32[rsp]
	mov rdx, qword ptr 40[rsp]
	inc rdx
ts_next_alnum_done:
	mov byte ptr [rdx], 0
	mov dword ptr ts_buff[rcx], eax
	add rsp, 56
	ret

ts_strip_whitespace:
	sub rsp, 40
	mov qword ptr 32[rsp], rcx
	mov eax, dword ptr ts_buff[rcx]
ts_strip_whitespace_check:
	cmp eax, ' '
	je ts_strip_whitespace_strip
	cmp eax, '\n'
	je ts_strip_whitespace_strip
	cmp eax, '\t'
	je ts_strip_whitespace_strip
	cmp eax, '\b'
	je ts_strip_whitespace_strip
	cmp eax, '\r'
	je ts_strip_whitespace_strip
	mov rcx, qword ptr 32[rsp]
	mov dword ptr ts_buff[rcx], eax
	add rsp, 40
	ret
ts_strip_whitespace_strip:
	mov rcx, ts_file[rcx]
	call fgetc
	mov rcx, qword ptr 32[rsp]
	jmp ts_strip_whitespace_check

.data

fmode_rt:
	.asciz "rt"
