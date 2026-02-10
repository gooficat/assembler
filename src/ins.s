.text

.globl find_ins

.extern instrs, end_of_instrs

find_ins:
    lea instrs(%rip), %rdx
    lea end_of_instrs(%rip), %r10
    mov $10, %r12
    call tbl_find_str