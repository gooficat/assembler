#include "asm_unit.h"
#include "token_stream.h"
#include "unit_pass.h"
#include <stdlib.h>

void asm_unit_init(Asm_Unit *unit, const char *out_path)
{
	unit->Labels.data = malloc(sizeof(Label));
	unit->Labels.capacity = 1;
	unit->Labels.size = 0;

	// we do not need to set this because each pass zeroes it
	// unit->offset = 0;
	fopen_s(&unit->out, out_path, "wb");
}

void asm_unit_free(Asm_Unit *unit)
{
	free(unit->Labels.data);
}

void asm_unit_feed_file(Asm_Unit *unit, const char *file_path)
{
	token_stream_init(&unit->stream, file_path);
	unit->pass = ASM_UNIT_PASS_FETCH;

repeat:
	asm_unit_pass(unit);
	if (unit->pass != ASM_UNIT_PASS_DONE)
	{
		token_stream_rewind(&unit->stream);
		goto repeat;
	}
}
