#include "opcodes.h"

Asm_Opcode opcode_table[] = {
	{Mode16 | Mode32 | Mode64 | NeedsRex | NeedsModRM | FieldD | FieldW, {{}, {}}},
};
Asm_Opcode_Class opcode_class_table[] = {};
uint64_t		 num_opcode_classes	  = sizeof opcode_class_table / sizeof opcode_class_table[0];
