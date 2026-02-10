.data


.globl regs, end_of_regs

rax: .asciz "rax"

regs:
    .quad rax
    .byte 0x00
    .byte 1
end_of_regs: