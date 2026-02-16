.section ".text"
.globl main
.include "tok.inc"
main:
    subq $88, %rsp
    lea greet_msg(%rip), %rcx
    call puts
    lea 44(%rsp), %rcx
    lea test_path(%rip), %rdx
    call tok_strm_init
    lea tok_strm_tokn+44(%rsp), %rcx
    call puts
    addq $88, %rsp
    xorl %eax, %eax
    ret
.section ".data"
greet_msg: .asciz "Hello from gooficat's assembler!"
test_path: .asciz "../tests/test1.s"
