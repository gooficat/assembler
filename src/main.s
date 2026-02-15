.text

.globl main

.include "file.inc"

main:
	mov %rsp, %rdi
	sub $fstrm_size, %rsp
	lea test_path(%rip), %rsi
	push %rdi
	call fstrm_open
	pop %rdi

	// mov $1, %rax
	// lea fstrm_buffer(%rdi), %rsi
	// push %rdi
	// mov fstrm_buffl(%rdi), %rdx
	// mov $1, %rdi
	// syscall
	// pop %rdi

	sub $1, %rsp
	call fstrm_getc
	mov %al, (%rsp)

	
	mov $1, %rax
	lea (%rsp), %rsi
	push %rdi
	mov $1, %rdx
	mov $1, %rdi
	syscall
	pop %rdi

	mov $60, %rax
	xor %rdi, %rdi
	syscall # return 0

.data
test_mnem: .asciz "add"
test_instr: .asciz "add rax, rcx"
test_path: .asciz "asm/test.asm"
