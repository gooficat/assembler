#pragma once

#include "dynamic_array.h"
#include "token_stream.h"
#include <stdint.h>
#include <stdio.h>

typedef enum
{
	ASM_UNIT_PASS_FETCH,
	ASM_UNIT_PASS_ALIGN,
	ASM_UNIT_PASS_WRITE,
	ASM_UNIT_PASS_DONE,
} Asm_Unit_Pass;

typedef struct
{
	char	*name;
	uint64_t value;
} Label;

typedef struct
{
	Token_Stream stream;
	FILE		*out;
	uint64_t	 offset;
	struct dynamic_array_struct(Label, size_t) labels;
	Asm_Unit_Pass pass;
	Asm_Unit_Pass pass_next;
} Asm_Unit;

void   asm_unit_init(Asm_Unit *unit, const char *out_path);
void   asm_unit_feed_file(Asm_Unit *unit, const char *file_path);
void   asm_unit_free(Asm_Unit *unit);
void   asm_output_bytes(Asm_Unit *unit, const void *value, int64_t num_bytes);
void   asm_unit_add_label(Asm_Unit *unit, const char *name, uint64_t value);
Label *asm_find_label(Asm_Unit *unit, const char *name);
