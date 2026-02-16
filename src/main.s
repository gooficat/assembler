.section ".text"

.globl main

.include "token.inc"

main:
    sub $80, %rsp
    lea 32(%rsp), %rcx
    lea test_path(%rip), %rdx
    call tok_strm_init


    mov %rcx, 72(%rsp)
    lea tok_strm_token(%rcx), %rcx
    call puts
    mov 72(%rsp), %rcx

    add $80, %rsp
    xor %rax, %rax
    ret

.data

test_path: .asciz "C:/Users/User/Documents/assembler/inc/token.inc"
