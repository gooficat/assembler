.text

.globl main

.include "reg.inc"

.intel_syntax noprefix

main:
    lea rcx, test_reg[rip]
    call find_reg
    lea rcx, test_fmt[rip]
    mov rdx, reg_tbl_entry_name[rax]
    movzx r8, byte ptr reg_tbl_entry_code[rax]
    sub rsp, 40
    call printf
    add rsp, 40
    xor eax, eax
    ret

.data

test_reg: .asciz "rsp"

test_fmt: .asciz "'%s' '%02hhX'"
