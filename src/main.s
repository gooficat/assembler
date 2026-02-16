.section ".text"

.globl main

.include "unit.inc"

main:
    sub $8, %rsp
    lea test_in_path(%rip), %rcx
    lea test_out_path(%rip), %rdx
    call assemble

    add $8, %rsp
    xor %eax, %eax
    ret

.data

test_in_path: .asciz "../tests/test1.s"
test_out_path: .asciz "../tests/test1.bin"
