.data

.globl reg_tbl, reg_tbl_end

.include "reg.inc"

rax: .asciz "rax"
rcx: .asciz "rcx"
rdx: .asciz "rdx"
rbx: .asciz "rbx"

rsp: .asciz "rsp"
rbp: .asciz "rbp"
rsi: .asciz "rsi"
rdi: .asciz "rdi"



reg_tbl:
    .quad rax
    .byte 0x0
    .byte Reg64

    .quad rcx
    .byte 0x1
    .byte Reg64

    .quad rdx
    .byte 0x2
    .byte Reg64

    .quad rbx
    .byte 0x3
    .byte Reg64

    .quad rsp
    .byte 0x4
    .byte Reg64
    
    .quad rbp
    .byte 0x5
    .byte Reg64
    
    .quad rsi
    .byte 0x6
    .byte Reg64
    
    .quad rdi
    .byte 0x7
    .byte Reg64
reg_tbl_end:
