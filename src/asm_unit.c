#include "asm_unit.h"
#include "token_stream.h"
#include "unit_pass.h"
#include <string.h>

void asm_unit_add_label(Asm_Unit *unit, const char *name, uint64_t value)
{
	Label label;
	label.name	= _strdup(name);
	label.value = value;
	dynamic_array_push_back(unit->labels, label);
}

void asm_unit_init(Asm_Unit *unit, const char *out_path)
{
	dynamic_array_init(unit->labels);

	// we do not need to set this because each pass zeroes it
	// unit->offset = 0;
	fopen_s(&unit->out, out_path, "wb");
}

void asm_unit_free(Asm_Unit *unit)
{
	dynamic_array_destroy(unit->labels);
	fclose(unit->out);
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

void asm_output_bytes(Asm_Unit *unit, const void *value, int64_t num_bytes)
{
	if (unit->pass == ASM_UNIT_PASS_WRITE)
	{
		fwrite(value, sizeof(uint8_t), num_bytes, unit->out);
	}

	unit->offset += num_bytes;
}

Label *asm_find_label(Asm_Unit *unit, const char *name)
{
	for (size_t i = 0; i < unit->labels.size; i++)
	{
		if (!strcmp(name, unit->labels.data[i].name))
		{
			return &unit->labels.data[i];
		}
	}
	return NULL;
}
