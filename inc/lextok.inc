.equ TokTypeInstruction, 0
.equ TokTypeDirective, 1
.equ TokTypeString, 2
.equ TokTypeRegister, 3
.equ TokTypeNumber, 4
.equ TokTypeMemory, 5

.extern lexer_next

/*
struct lexer
{
	u1 type;
	union {
		struct {
			reg* reg1;
			reg* reg2;
			u1 scal;
			i16 disp_imm;
		};
		dir* dir;
		opc_class* opc_class;
	};
	char *str;
}
*/

.equ lexer_type, 0
.equ lexer_reg1, 1
.equ lexer_reg2, lexer_reg1 + 8
.equ lexer_scal, lexer_reg2 + 8
.equ lexer_disp_imm, lexer_scal + 1
.equ lexer_dir, 1
.equ lexer_opc_class_ptr, 1
.equ lexer_str, 8 + 8 + 1 + 2 # (19)
.equ lexer_ts_ptr, lexer_str + 8
.equ lexer_struc_size, lexer_ts_ptr + 8
