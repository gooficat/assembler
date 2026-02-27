#include "asm_unit.h"
#include "statement.h"

void asm_unit_pass(Asm_Unit *unit)
{
	switch (unit->pass)
	{
	case ASM_UNIT_PASS_FETCH:
		unit->pass_next = ASM_UNIT_PASS_ALIGN;
		break;
	case ASM_UNIT_PASS_ALIGN:
		unit->pass_next = ASM_UNIT_PASS_WRITE;
		break;
	default:
		unit->pass_next = ASM_UNIT_PASS_DONE;
		break;
	}

	unit->offset = 0;
	token_stream_next(&unit->stream);

	while (unit->stream.buffer[0] != '\0')
	{
		asm_handle_statement(unit);
	}
	puts("Unit pass done");
	unit->pass = unit->pass_next;
}
