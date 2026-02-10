.text
.globl main

.extern registers
.extern find_reg

main:
	call greet

	lea test_reg(%rip), %rcx
	call find_reg
	

	sub $32, %rsp
	lea reg_fmt(%rip), %rcx
	
    movzb 9(%rax), %rdx
	
	call printf
	add $32, %rsp

	xor %eax, %eax
	ret

greet:
	sub $32, %rsp
	lea msg(%rip), %rcx
	call puts
	add $32, %rsp
	ret
msg:
	.asciz "Hello"


test_reg:
	.asciz "es"

reg_fmt:
	.asciz "reg '%02hhx'\n"
