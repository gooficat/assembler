#include "directive.h"
#include "literal.h"
#include <stdint.h>
#include <string.h>

void asm_directive_bytes(Asm_Unit *unit, int8_t modifier)
{
	int64_t value;
repeat:
	value = asm_parse_literal(unit);
	asm_output_bytes(unit, &value, modifier);
	if (unit->stream.buffer[0] == ',')
	{
		token_stream_next(&unit->stream);
		goto repeat;
	}
}

Asm_Directive directives[] = {
	{"db", asm_directive_bytes, 1}, // byte
	{"dw", asm_directive_bytes, 2}, // word
	{"dd", asm_directive_bytes, 4}, // dword
	{"dq", asm_directive_bytes, 8}, // qword
	{"do", asm_directive_bytes, 16} // oword
};

#define num_directives (sizeof(directives) / sizeof(Asm_Directive))

void asm_handle_directive(Asm_Unit *unit)
{
	for (size_t i = 0; i < num_directives; i++)
	{
		if (!strcmp(unit->stream.buffer, directives[i].name))
		{
			token_stream_next(&unit->stream);
			directives[i].function(unit, directives[i].modifier);
			return;
		}
	}
}
