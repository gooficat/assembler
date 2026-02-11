.data

.globl regs, end_of_regs

.include "reg_tbl.inc"

rax: .asciz "rax"
rcx: .asciz "rcx"
rdx: .asciz "rdx"
rbx: .asciz "rbx"
rsp: .asciz "rsp"
rbp: .asciz "rbp"
rsi: .asciz "rsi"
rdi: .asciz "rdi"


regs:
    .quad rax
    .byte 0x00
    .byte Reg64
    .quad rcx
    .byte 0x01
    .byte Reg64
    .quad rdx
    .byte 0x02
    .byte Reg64
    .quad rbx
    .byte 0x03
    .byte Reg64

    .quad rsp
    .byte 0x04
    .byte Reg64
    .quad rbp
    .byte 0x05
    .byte Reg64
    .quad rsi
    .byte 0x06
    .byte Reg64
    .quad rdi
    .byte 0x07
    .byte Reg64
end_of_regs: