.text

.globl sch_tbl

# string, table base, table end, element size
sch_tbl:
	push %r12
	push %r13
tbl_sch_lp:
	mov %rcx, %r10
	mov (%rdx), %r11
str_cmp_lp:
	mov (%r10), %r12b
	cmp %r12b, (%r11)
	jne no_match
	cmp $0, %r12b
	je match
	inc %r10
	inc %r11
	jmp str_cmp_lp
no_match:
	add %r9, %rdx
	cmp %r8, %rdx
	jne tbl_sch_lp
	sub $40, %rsp
	mov %rcx, %rdx
	lea error_msg(%rip), %rcx
	call printf
	add $40, %rsp
	xor %rdx, %rdx
match:
	mov %rdx, %rax
	pop %r13
	pop %r12
	ret

.data
error_msg:
	.asciz "did not find '%s' in table\n"
