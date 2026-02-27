#pragma once

#include "asm_unit.h"
#include "opcodes.h"
#include "register.h"

typedef enum
{
	ASM_ARGUMENT_NONE,
	ASM_ARGUMENT_REGISTER,
	ASM_ARGUMENT_IMMEDIATE,
	ASM_ARGUMENT_MEMORY,
} Asm_Argument_Type;

typedef struct
{
	const Asm_Register *base;
	const Asm_Register *index;
	uint8_t				scale;
	int64_t				offset;
} Asm_Memory_Argument;

typedef struct
{
	Asm_Argument_Type type;
	union
	{
		const Asm_Register *reg;
		int64_t				imm;
		Asm_Memory_Argument mem;
	};
} Asm_Argument;

#define ASM_MAX_ARGUMENTS 4

typedef struct
{
	Asm_Opcode_Class *opcode_class;
	Asm_Argument	  arguments[ASM_MAX_ARGUMENTS];
} Asm_Instruction;

void asm_handle_instruction(Asm_Unit *unit);
