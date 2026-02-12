.data

.globl mnems, end_of_mnems

.include "opc_tbl.inc"

add: .asciz "add"
ret: .asciz "ret"
mov: .asciz "mov"

mnems:
    .quad add
    .quad addclass
    .quad ret
    .quad retclass
    .quad mov
    .quad movclass
end_of_mnems:

addclass:
    # add accum, imm
    # flags
    .word Mode16|Mode32|Mode64|W|Rex64
    # 2 args
    .byte 2
    # args
    .long 0|Reg8|Reg64|FixedReg # i specify '0' to mean the accumulator (as a convention)
    .long Imm8|Imm64
    # 1 opcode
    .byte 1
    # opcode
    .byte 0x04
    # end of instruction
    # add reg/mem, reg
    .word Mode16|Mode32|Mode64|D|W|Rex64|ModRM
    .byte 2
    .long Reg8|Reg16|Reg32|Reg64
    .long Reg8|Reg16|Reg32|Reg64
    .byte 1
    .byte 0x00
retclass:
    .word Mode16|Mode32|Mode64
    .byte 0
    .byte 1
    .byte 0xC3

    .word Mode16|Mode32|Mode64
    .byte 1
    .long Imm16
    .byte 1
    .byte 0xC2
movclass:
    .word Mode16|Mode32|Mode64
    .byte 2
    .long Reg8
    .long Imm8
    .byte 1
    .byte 0xB0
    
    .word Mode16|Mode32|Mode64|Rex64
    .byte 2
    .long Reg16|Reg32|Reg64
    .long Imm16|Imm32|Imm64
    .byte 1
    .byte 0xB8
