.text

.globl main

.include "reg.inc"


main:
    lea test_reg(%rip), %rcx
    call find_reg
    lea test_fmt(%rip), %rcx
    mov reg_tbl_entry_name(%rax), %rdx
    movzb reg_tbl_entry_code(%rax), %r8
    sub $40, %rsp
    call printf
    add $40, %rsp
    xor %eax, %eax
    ret

.data
    test_reg: .asciz "rsp"
    test_mnem: .asciz "add"
    test_fmt: .asciz "'%s' '%02hhX'"
