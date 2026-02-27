#include "instruction.h"
#include "literal.h"
#include "opcodes.h"
#include "register.h"
#include "token_stream.h"
#include <string.h>

Asm_Register *find_register(const char *name)
{
	for (size_t i = 0; i < num_registers; i++)
	{
		if (!strcmp(name, register_table[i].name))
		{
			return &register_table[i];
		}
	}
	return NULL;
}

Asm_Opcode_Class *find_opcode_class(const char *opcode)
{
	for (size_t i = 0; i < num_opcode_classes; i++)
	{
		if (!strcmp(opcode, opcode_class_table[i].name))
		{
			return &opcode_class_table[i];
		}
	}
	return NULL;
}

void asm_parse_argument(Asm_Unit *unit, Asm_Argument *argument)
{
	if (unit->stream.buffer[0] == '%')
	{
		argument->type = ASM_ARGUMENT_REGISTER;
		token_stream_next(&unit->stream);
		argument->reg = find_register(unit->stream.buffer);
		token_stream_next(&unit->stream);
	}
	else if (unit->stream.buffer[0] == '$')
	{
		argument->type = ASM_ARGUMENT_IMMEDIATE;
		token_stream_next(&unit->stream);
		argument->imm = asm_parse_literal(unit);
	}
	else
	{
		if (unit->stream.buffer[0] != '[')
		{
			argument->mem.offset = 0;
		}
		else
		{
			argument->mem.offset = asm_parse_literal(unit);
			token_stream_next(&unit->stream);
			if (unit->stream.buffer[0] == ']')
			{
				argument->mem.base	= NULL;
				argument->mem.index = NULL;
				// argument->mem.scale = 0;
			}
			else if (unit->stream.buffer[0] != ',')
			{
				argument->mem.base = find_register(unit->stream.buffer);
				token_stream_next(&unit->stream);
				if (unit->stream.buffer[0] == ']')
				{
					argument->mem.index = NULL;
					// argument->mem.scale = 0;
				}
				else if (unit->stream.buffer[0] == ',')
				{
					token_stream_next(&unit->stream);
					argument->mem.index = find_register(unit->stream.buffer);
					token_stream_next(&unit->stream);
					if (unit->stream.buffer[0] == ']')
					{
						argument->mem.scale = 1;
					}
					else if (unit->stream.buffer[0] == ',')
					{
						token_stream_next(&unit->stream);
						argument->mem.scale = asm_parse_literal(unit);
					}
				}
			}
		}
		token_stream_next(&unit->stream);
	}
}

void asm_parse_instruction(Asm_Unit *unit, Asm_Instruction *instruction)
{
	instruction->opcode_class = find_opcode_class(unit->stream.buffer);
	token_stream_next(&unit->stream);
	int i = 0;
repeat:
	if (unit->stream.buffer[0] != '\0' && unit->stream.buffer[0] != '.' && unit->stream.file_state.C != ':')
	{
		asm_parse_argument(unit, &instruction->arguments[i++]);
		if (unit->stream.buffer[0] == ',')
		{
			token_stream_next(&unit->stream);
			goto repeat;
		}
	}
	instruction->arguments[i].type = ASM_ARGUMENT_NONE;
}

void asm_handle_instruction(Asm_Unit *unit)
{
	Asm_Instruction instruction;
	asm_parse_instruction(unit, &instruction);
	printf("Instruction: %s\n", instruction.opcode_class->name);
	for (size_t i = 0; i < ASM_MAX_ARGUMENTS && instruction.arguments[i].type != ASM_ARGUMENT_NONE; i++)
	{
		Asm_Argument *arg = &instruction.arguments[i];
		printf("Argument %zu: ", i);
		switch (arg->type)
		{
		case ASM_ARGUMENT_REGISTER:
			printf("Register %s\n", arg->reg->name);
			break;
		case ASM_ARGUMENT_IMMEDIATE:
			printf("Immediate %lld\n", arg->imm);
			break;
		case ASM_ARGUMENT_MEMORY:
			printf("Memory %lld[", arg->mem.offset);
			if (arg->mem.base)
			{
				printf("%s", arg->mem.base->name);
			}
			printf(", ");
			if (arg->mem.index)
			{
				printf("%s, %hhu", arg->mem.index->name, arg->mem.scale);
			}
			puts("]");
			break;
		default:
			printf("None (%d)\n", arg->type);
			break;
		}
	}
	puts("End of instruction");
}
