#include "opcodes.h"

Asm_Opcode opcode_table[] = {
	{{0x00}, 1, Mode16 | Mode32 | Mode64 | NeedsRex | NeedsModRM | FieldD | FieldW, {{Reg8|Reg16|Reg32|Reg64|RegMem|Disp8|Disp16|Disp32|Disp32S|BaseIndex}, {Reg8|Reg16|Reg32|Reg64}}},
};
Asm_Opcode_Class opcode_class_table[] = {
    {"add", 0, 1},
};
uint64_t		 num_opcode_classes	  = sizeof opcode_class_table / sizeof opcode_class_table[0];
