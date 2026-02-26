#include "statement.h"
#include "directive.h"
#include "token_stream.h"

void asm_handle_statement(Asm_Unit *unit)
{
	if (unit->stream.buffer[0] == '.')
	{
		token_stream_next(&unit->stream);
		asm_handle_directive(unit);
	}
	else
	{
		puts(unit->stream.buffer);
		token_stream_next(&unit->stream);
	}
}
