.text

.globl find_reg


.include "search.inc"
.include "reg_tbl.inc"


find_reg:
    lea regs(%rip), %rdx
    lea end_of_regs(%rip), %r8
    mov $reg_tbl_entry_sz, %r9
    call sch_tbl
    ret