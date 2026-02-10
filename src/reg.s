.text

.extern registers, end_of_registers

.extern tbl_find_str

.globl find_reg

.macro printc ch
    mov $\ch, %rcx
    sub $32, %rsp
    call putchar
    add $32, %rsp
.endm

find_reg:
    lea registers(%rip), %rdx
    lea end_of_registers(%rip), %r10
    mov $10, %r12
    call tbl_find_str
    ret