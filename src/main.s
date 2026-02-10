.text

.globl main

.include "reg_tbl.inc"

.intel_syntax noprefix

main:
    sub rsp, 40

    lea rcx, test_reg[rip]
    lea rdx, regs[rip]
    lea r8, end_of_regs[rip]
    mov r9, reg_tbl_entry_sz
    call sch_tbl

    lea rcx, test_fmt[rip]
    mov rdx, reg_tbl_entry_name[rax]
    mov r8, reg_tbl_entry_code[rax]
    call printf

    add rsp, 40

    xor eax, eax

    ret

.data

test_reg: .asciz "rax"

test_fmt: .asciz "'%s' '%02hhX'"
