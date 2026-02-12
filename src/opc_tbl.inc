# modifier fields
.equ Mode16, 1 # may be used in 16 bit mode
.equ Mode32, 1<<1 # may be used in 32 bit mode
.equ Mode64, 1<<2 # may be used in 64 bit mode 
.equ D, 1<<3 # uses d field
.equ W, 1<<4 # uses w field
.equ Rex64, 1<<5 # requires rex prefix in 64 bit mode
.equ ModRM, 1<<6 # uses the modregr/m

# arg fields
.equ Imm8, 1
.equ Imm16, 1<<1
.equ Imm32, 1<<2
.equ Imm64, 1<<3
.equ Imm8S, 1<<4
.equ Imm32S, 1<<5

.equ Reg8, 1<<6
.equ Reg16, 1<<7
.equ Reg32, 1<<8
.equ Reg64, 1<<9
.equ SReg, 1<<10
# TODO fp regs next .equ 

.equ FixedReg, 1<<11 # like accumulator forms

.equ BasedMem, 1<<12
.equ Disp8, 1<<13
.equ Disp16, 1<<14
.equ Disp32, 1<<15
.equ Disp64, 1<<16
.equ Disp8S, 1<<17
.equ Disp32S, 1<<18

.equ RegMem, 1<<19

.equ Byte, 1<<20
.equ Word, 1<<21
.equ DWord, 1<<22
.equ QWord, 1<<23

#
