.text

.intel_syntax noprefix

.globl sch_tbl

# string, table base, table end, element size
sch_tbl:
	push r12
	push r13
tbl_sch_lp:
	mov r10, rcx
	mov r11, [rdx]
str_cmp_lp:
	mov r12b, byte ptr [r10]
	mov r13b, byte ptr [r11]
	cmp r12b, r13b
	jne no_match
	cmp r13b, 0
	je match
	inc r10
	inc r11
	jmp str_cmp_lp
no_match:
	add rdx, r9
	cmp rdx, r8
	jne tbl_sch_lp
	sub rsp, 40
	mov rdx, rcx
	lea rcx, error_msg[rip]
	call printf
	add rsp, 40
	xor rdx, rdx
match:
	mov rax, rdx
	pop r13
	pop r12
	ret

.data
error_msg:
	.asciz "did not find %s in table\n"