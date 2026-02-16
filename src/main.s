.section ".text"

.globl main

.include "token.inc"
.include "vec.inc"

main:
    sub $160, %rsp
    
    lea 32(%rsp), %rcx
    // tok strm is from 32 to 76

    lea test_path(%rip), %rdx
    call tok_strm_init

    lea tok_strm_token(%rcx), %rcx
    call puts

    lea 76(%rsp), %rcx
    call vec_init
    addq $1, vec_size(%rcx)

    lea 76(%rsp), %rcx
    mov $4, %rdx
    call vec_resize_up

    add $160, %rsp
    xor %rax, %rax
    ret

.data

test_path: .asciz "../tests/test1.s"
