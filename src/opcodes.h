#pragma once

#include <stdint.h>

#define ASM_MAX_ARGUMENTS 4

typedef struct
{
	const char *name;
	uint16_t	index;
	uint8_t		count;
} Asm_Opcode_Class;

typedef enum
{
	Reg8  = 1,
	Reg16 = 1 << 1,
	Reg32 = 1 << 2,
	Reg64 = 1 << 3,

	Disp8	= 1 << 4,
	Disp8S	= 1 << 5,
	Disp16	= 1 << 6,
	Disp32	= 1 << 7,
	Disp32S = 1 << 8,
	Disp64	= 1 << 9,

	Imm8   = 1 << 10,
	Imm8S  = 1 << 11,
	Imm16  = 1 << 12,
	Imm32  = 1 << 13,
	Imm32S = 1 << 14,
	Imm64  = 1 << 15,

	RegMem	  = 1 << 16,
	BaseIndex = 1 << 17,
	FixedForm = 1 << 18,

	RegA   = 0 << 5,
	RegB   = 1 << 5,
	RegC   = 2 << 5,
	RegD   = 3 << 5,
	RegSP  = 4 << 5,
	RegBP  = 5 << 5,
	RegSI  = 6 << 5,
	RegDI  = 7 << 5,
	RegR8  = 8 << 5,
	RegR9  = 9 << 5,
	RegR10 = 10 << 5,
	RegR11 = 11 << 5,
	RegR12 = 12 << 5,
	RegR13 = 13 << 5,
	RegR14 = 14 << 5,
	RegR15 = 15 << 5,
} Asm_Param;

typedef enum
{
	NeedsRex		   = 1 << 0,
	NeedsModRM		   = 1 << 1,
	FieldD			   = 1 << 2,
	FieldW			   = 1 << 3,
	RelativeAddressing = 1 << 4,
	Mode16			   = 1 << 5,
	Mode32			   = 1 << 6,
	Mode64			   = 1 << 7,
} Asm_Opcode_Flags;

#define ASM_MAX_OPCODES 4

typedef struct
{
	uint8_t			 opcodes[ASM_MAX_OPCODES];
	uint8_t num_opcodes;
	Asm_Opcode_Flags flags;
	Asm_Param		 params[ASM_MAX_ARGUMENTS];
} Asm_Opcode;

extern Asm_Opcode		opcode_table[];
extern Asm_Opcode_Class opcode_class_table[];
extern uint64_t			num_opcode_classes;
