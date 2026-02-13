
.equ Reg8, 1
.equ Reg16, 1<<1
.equ Reg32, 1<<2
.equ Reg64, 1<<3
.equ SReg, 1<<4

.equ Imm8, 1<<5
.equ Imm8S, 1<<6
.equ Imm16, 1<<7
.equ Imm32, 1<<8
.equ Imm32S, 1<<9
.equ Imm64, 1<<10

.equ Byte, 1<<11
.equ Word, 1<<12
.equ DWord, 1<<13
.equ QWord, 1<<14

.equ RegMem, 1<<15
.equ Fixed, 1<<16

.equ Disp8, 1<<17
.equ Disp8S, 1<<18
.equ Disp16, 1<<19
.equ Disp32, 1<<20
.equ Disp32S, 1<<21
.equ Disp64, 1<<22
.equ BaseIndex, 1<<23

.equ AL, 0<<5
.equ CL, 1<<5
.equ DL, 2<<5
.equ BL, 3<<5

.equ AH, 4<<5
.equ CH, 5<<5
.equ DH, 6<<5
.equ BH, 7<<5

.equ R8, 8<<5
.equ R9, 9<<5
.equ R10, 10<<5
.equ R11, 11<<5

.equ R12, 12<<5
.equ R13, 13<<5
.equ R14, 14<<5
.equ R15, 15<<5
