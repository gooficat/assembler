.section ".text"

.globl main

.include "token.inc"

main:
    sub $tok_strm_size + 40, %rsp


    lea 40(%rsp), %rcx
    lea test_path(%rip), %rdx
    call tok_strm_init

    add $tok_strm_size + 40, %rsp

    xor %rax, %rax
    ret


test_path: .asciz "inc/token.inc"
