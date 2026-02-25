#pragma once

#include "asm_unit.h"
#include <stdint.h>

typedef struct
{
	const char *name;
	void (*function)(Asm_Unit *unit, int8_t modifier);
	int8_t modifier;
} Asm_Directive;

void asm_handle_directive(Asm_Unit *unit);
