#include "directive.h"
#include <stdint.h>

extern Asm_Directive directives[];
extern uint8_t num_directives;

void asm_handle_directive(Asm_Unit *unit)
{
}

void asm_directive_bytes(Asm_Unit *unit, int8_t modifier)
{
}

Asm_Directive directives[] = {
	{"byte", asm_directive_bytes, 1},
};
