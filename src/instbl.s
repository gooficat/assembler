.data

.globl instrs, end_of_instrs

.macro instr name
	\name:
		.asciz "\name"
.endm

instr add
instr ret
instr push

.equ EndOfClass, 0
.equ Mode16, 1
.equ Mode32, 2
.equ Mode64, 4

.equ D, 1
.equ W, 1<<1
.equ Rex64, 1<<2

.macro class name
	.quad \name
	.quad \name\()class
.endm

instrs:
	class add
	class ret
end_of_instrs:

addclass:
# add reg, reg#mem
# supported in all modes
.byte Mode16|Mode32|Mode64
# flags
	.long D|W|Rex64
# 1 opcode
	.byte 1
# opcode
	.byte 0x00
# 2 args
	.byte 2
# args
	.long 0
	.long 0
#
	.byte EndOfClass

retclass:
# ret
.byte Mode16|Mode32|Mode64
	.long 0
	.byte 1
	.byte 0xC3
	.byte 0
# ret imm16
.byte Mode16|Mode32|Mode64
	.long 0
	.byte 1
	.byte 0xC3

	.byte 1
	.long 0

	