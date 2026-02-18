.data

.globl opcode_classes, opcode_classes_end

.include "opc_tbl.inc"

_add: .asciz "add"
_or: .asciz "or"

opcode_classes:
	.quad _add
	.quad add_class
opcode_classes_end:

add_class:
	.word Mode16|Mode32|Mode64|W|NeedRex
	.byte 2
	.long FixedParam|Reg8|Reg16|Reg32|Reg64|RegA
	.long Imm8|Imm16|Imm32|Imm32S
	.byte 1
	.byte 0x04

	.word Mode16|Mode32|Mode64|D|W|NeedRex|NeedModRM # flags
	.byte 2 # num params
	.long Reg8|Reg16|Reg32|Reg64|BaseIndex|Disp8|Disp16|Disp32|Disp32S|RegMem # param 1
	.long Reg8|Reg16|Reg32|Reg64 # param 2
	.byte 1 # num opcodes
	.byte 0x00

