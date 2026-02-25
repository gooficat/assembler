#include "asm_unit.h"

int main(void)
{
	Asm_Unit unit;
	asm_unit_init(&unit, "C:/Users/User/Documents/Programming/Assembler/tests/output.bin");
	asm_unit_feed_file(&unit, "C:/Users/User/Documents/Programming/Assembler/tests/test.asm");
	asm_unit_free(&unit);
	return 0;
}
