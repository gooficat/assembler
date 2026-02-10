.data

.globl instrs

add: .asciz "add"

.equ EndOfClass, 0
.equ Mode16, 1
.equ Mode32, 2
.equ Mode64, 4

.equ D, 1
.equ W, 1<<1
.equ Rex64, 1<<2

instrs:
	.quad add
	.quad addclass


addclass:
/ supported in all modes
	.byte Mode16|Mode32|Mode64
/ flags
.long D|W|Rex64
/ 1 opcode
	.byte 1
/ opcode
	.byte 0x00
/ 2 args
	.byte 2
/ args
.long 0
.long 0
/
	.byte EndOfClass