.section ".text"

.globl main

.include "unit.inc"

main:
    lea test_in_path(%rip), %rcx
    lea test_out_path(%rip), %rdx
    call assemble

    xor %eax, %eax
    ret

.data

test_in_path: .asciz "../tests/test1.s"
test_out_path: .asciz "../tests/test1.bin"
