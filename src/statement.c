#include "statement.h"
#include "asm_unit.h"
#include "directive.h"
#include "instruction.h"
#include "token_stream.h"
#include <stdio.h>

void asm_handle_label(Asm_Unit *unit)
{
	if (unit->pass == ASM_UNIT_PASS_FETCH)
	{
		asm_unit_add_label(unit, unit->stream.buffer, unit->offset);
	}
	else
	{
		Label *label = asm_find_label(unit, unit->stream.buffer);
		if (label->value != unit->offset)
		{
			unit->pass_next = ASM_UNIT_PASS_ALIGN;
			label->value	= unit->offset;
		}
	}
	unit->stream.file_state.C = fgetc(unit->stream.file_state.file);
	token_stream_next(&unit->stream);
}

void asm_handle_statement(Asm_Unit *unit)
{
	if (unit->stream.buffer[0] == '.')
	{
		token_stream_next(&unit->stream);
		asm_handle_directive(unit);
	}
	else if (unit->stream.file_state.C == ':')
	{
		asm_handle_label(unit);
	}
	else
	{
		asm_handle_instruction(unit);
	}
}
