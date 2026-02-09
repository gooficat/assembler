.text
.globl main

.extern registers
.extern find_reg

main:
	call greet

	lea test_reg(%rip), %rcx
	call find_reg
	
    mov %rax, %rdx

	sub $40, %rsp
	lea reg_fmt(%rip), %rcx
	call printf
	add $40, %rsp

	xor %eax, %eax
	ret

greet:
	sub $40, %rsp
	lea msg(%rip), %rcx
	call puts
	add $40, %rsp
	ret
msg:
	.asciz "Hello"


test_reg:
	.asciz "rcx"

reg_fmt:
	.asciz "reg %02hhx\n"