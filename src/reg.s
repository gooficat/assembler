.text

.globl find_reg

.intel_syntax noprefix

.include "search.inc"
.include "reg_tbl.inc"


find_reg:
    lea rdx, regs[rip]
    lea r8, end_of_regs[rip]
    mov r9, reg_tbl_entry_sz
    call sch_tbl
    ret