.text

.intel_syntax noprefix

.globl ts_init, ts_next

.include "token.inc"

ts_init:
	sub rsp, 40
	mov 32[rsp], rcx
	mov rcx, rdx
	lea rdx, fmode_rt[rip]
	call fopen
	mov rcx, 32[rsp]
	mov qword ptr ts_file[rcx], rax
	add rsp, 40
	ret

ts_next:
	ret


.data

fmode_rt:
	.asciz "rt"
