#pragma once

#include <stdint.h>

typedef struct
{
	const char *name;
	uint8_t		code;
	uint32_t	type;
} Asm_Register;

extern Asm_Register register_table[];
extern size_t		num_registers;
