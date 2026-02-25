#include "statement.h"
#include "token_stream.h"

void asm_handle_statement(Asm_Unit *unit)
{
	puts(unit->stream.buffer);
	token_stream_next(&unit->stream);
}
