.section ".text"
.globl main
.include "tok.inc"
main:
    sub $40, %rsp
    lea test_path(%rip), %rcx
    call unit_assemble
    add $40, %rsp
    xor %eax, %eax
    ret
.section ".data"
greet_msg: .asciz "Hello from gooficat's assembler!"
test_path: .asciz "../tests/test1.s"
