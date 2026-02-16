
.include "vec.inc"
/*
struc asm_unit
{
	U8 offset;
	struc vec labels;
	U1 pass;
	U1 next_pass;
	U8 fptr;
}
*/

.extern asm_pass, assemble

.equ ASM_PASS_LABEL, 0
.equ ASM_PASS_ALIGN, 1
.equ ASM_PASS_WRITE, 2


.equ asm_unit_offset, 0
.equ asm_unit_labels, asm_unit_offset + 8
.equ asm_unit_pass, asm_unit_labels + vec_struc_size # (24)
.equ asm_unit_next_pass, asm_unit_pass + 1
.equ asm_unit_out_file, asm_unit_next_pass + 1
.equ asm_unit_struc_size, asm_unit_out_file + 8
# 42
