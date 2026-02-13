.data

.globl mnem_tbl, mnem_tbl_end

.include "prm.inc"
.include "opc.inc"


add: .asciz "add"

mnem_tbl:
    .quad add
    .quad addclass
mnem_tbl_end:



addclass:
    .word W|Mode16|Mode32|Mode64|Rex64
    .byte 2
    .long Imm8|Imm16|Imm32|Imm64
    .long AL|Fixed|Reg8|Reg16|Reg32|Reg64
    .byte 1
    .byte 0x04

    .word D|W|Mode16|Mode32|Mode64|Rex64
    .byte 2
    .long Reg8|Reg16|Reg32|Reg64|Byte|Word|DWord|QWord|RegMem|Disp8|Disp16|Disp32|Disp32S
    .long Reg8|Reg16|Reg32|Reg64
    .byte 1
    .byte 0x00
