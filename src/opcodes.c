#include "opcodes.h"

Asm_Opcode opcode_table[] = {
	{{0x04},
	 1,
	 MODE_16 | MODE_32 | MODE_64 | NEED_REX | NEED_MODRM | FIELD_W,
	 {
		 FIXED | REG_A | BYTE | WORD | DWORD | QWORD,
		 IMM | W8 | W16 | W32 | W32S,
	 }},
	{
		{0x00},
		1,
		MODE_16 | MODE_32 | MODE_64 | NEED_REX | NEED_MODRM | FIELD_D | FIELD_W,
		{
			REG | MEM | DISP | BYTE | WORD | DWORD | QWORD | W8 | W16 | W32 | W32S,
			REG | BYTE | WORD | DWORD | QWORD,
		},
	},
};
Asm_Opcode_Class opcode_class_table[] = {
	{"add", 0, 2},

};
uint64_t num_opcode_classes = sizeof opcode_class_table / sizeof opcode_class_table[0];
