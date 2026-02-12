.text

.globl find_reg

.include "src/reg.inc"

# address of string on rcx
find_reg:
    lea reg_tbl(%rip), %rdx
    lea reg_tbl_end(%rip), %r8
    mov $reg_tbl_entry_len, %r9
    call search
    ret
