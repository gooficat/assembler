.text

.globl find_ins_class

.extern instrs, end_of_instrs

find_ins_class:
    lea instrs(%rip), %rdx
    lea end_of_instrs(%rip), %r10
    mov $8, %r12
    call tbl_find_str
    ret