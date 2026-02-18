.equ TokTypeInstruction, 0
.equ TokTypeDirective, 1
.equ TokTypeString, 2
.equ TokTypeRegister, 3
.equ TokTypeNumber, 4
.equ TokTypeMemory, 5


/*
struct lex_tok
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
		struct {
			u16 opc_idx;
			u16 opc_num;
		};
	};
	char *str;
}
*/

.equ lex_tok_type, 0
.equ lex_tok_reg1, 1
.equ lex_tok_reg2, 9
.equ lex_tok_scal, 10
.equ lex_tok_disp_imm, 11
.equ lex_tok_dir, 1
.equ lex_tok_opc_class_ptr, 1
.equ lex_tok_str, 19
.equ lex_tok_struc_size, 27
