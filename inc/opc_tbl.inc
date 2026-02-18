.extern opcode_classes

.equ Mode16, 1
.equ Mode32, 1<<1
.equ Mode64, 1<<2
.equ D, 1<<3
.equ W, 1<<4
.equ NeedRex, 1<<5
.equ NeedModRM, 1<<6
.equ Jump, 1<<7
.equ OpcExt, 1<<8

.equ Reg8, 1
.equ Reg16, 1<<1
.equ Reg32, 1<<2
.equ Reg64, 1<<3
.equ SReg, 1<<4

.equ Disp8, 1<<5
.equ Disp8S, 1<<6
.equ Disp16, 1<<7
.equ Disp32, 1<<8
.equ Disp32S, 1<<9
.equ Disp64, 1<<10

.equ BaseIndex, 1<<11
.equ Imm8, 1<<12
.equ Imm8S, 1<<13
.equ Imm16, 1<<14
.equ Imm32, 1<<15
.equ Imm32S, 1<<16
.equ Imm64, 1<<17

.equ FixedParam, 1<<18

.equ RegMem, 1<<19

.equ Byte, 1<<20
.equ Word, 1<<21
.equ DWord, 1<<22
.equ QWord, 1<<23

.equ RegA, 0
.equ RegC, 1
.equ RegD, 2
.equ RegB, 3
.equ RegSP, 4
.equ RegBP, 5
.equ RegSI, 6
.equ RegDI, 7
.equ RegR8, 8
.equ RegR9, 9
.equ RegR10, 10
.equ RegR11, 11
.equ RegR12, 12
.equ RegR13, 13
.equ RegR14, 14
.equ RegR15, 15

