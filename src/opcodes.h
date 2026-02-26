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
	BYTE  = 1,
	WORD  = 1 << 1,
	DWORD = 1 << 2,
	QWORD = 1 << 3,
	W8	  = 1 << 4,
	W8S	  = 1 << 5,
	W16	  = 1 << 6,
	W32	  = 1 << 7,
	W32S  = 1 << 8,
	W64	  = 1 << 9,

	REG	  = 1 << 10,
	MEM	  = 1 << 11,
	IMM	  = 1 << 12,
	DISP  = 1 << 13,
	FIXED = 1 << 14,

	REG_A	= 0,
	REG_C	= 1,
	REG_D	= 2,
	REG_B	= 3,
	REG_SP	= 4,
	REG_BP	= 5,
	REG_SI	= 6,
	REG_DI	= 7,
	REG_R8	= 8,
	REG_R9	= 9,
	REG_R10 = 10,
	REG_R11 = 11,
	REG_R12 = 12,
	REG_R13 = 13,
	REG_R14 = 14,
	REG_R15 = 15,
} Asm_Param;

typedef enum
{
	NEED_REX   = 1 << 0,
	NEED_MODRM = 1 << 1,
	FIELD_D	   = 1 << 2,
	FIELD_W	   = 1 << 3,
	REL_ADDR   = 1 << 4,
	MODE_16	   = 1 << 5,
	MODE_32	   = 1 << 6,
	MODE_64	   = 1 << 7,
} Asm_Opcode_Flags;

#define ASM_MAX_OPCODES 4

typedef struct
{
	uint8_t			 opcodes[ASM_MAX_OPCODES];
	uint8_t			 num_opcodes;
	Asm_Opcode_Flags flags;
	Asm_Param		 params[ASM_MAX_ARGUMENTS];
} Asm_Opcode;

extern Asm_Opcode		opcode_table[];
extern Asm_Opcode_Class opcode_class_table[];
extern uint64_t			num_opcode_classes;
