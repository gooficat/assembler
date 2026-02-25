#pragma once

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
	char *name;
	uint64_t value;
} Label;

typedef struct
{
	Token_Stream stream;
	FILE *out;
	uint64_t offset;
	struct
	{
		Label *data;
		uint64_t size;
		uint64_t capacity;
	} Labels;
	Asm_Unit_Pass pass;
	Asm_Unit_Pass pass_next;
} Asm_Unit;

void asm_unit_init(Asm_Unit *unit, const char *out_path);
void asm_unit_feed_file(Asm_Unit *unit, const char *file_path);
void asm_unit_free(Asm_Unit *unit);
