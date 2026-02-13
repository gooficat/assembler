
.extern parse_ins


# struc ins
#	PTR mnem
#	BYTE type
#	BYTE argc
#	x4:
#	PTR reg1
#	PTR reg2
#	BYTE scal
#	QUAD disp

.equ MAX_ARGS, 4

.equ arg_reg1, 0
.equ arg_reg2, arg_reg1 + 8
.equ arg_scal, arg_reg2 + 8
.equ arg_disp, arg_scal + 1
.equ arg_size, arg_disp + 8

.equ ins_mnem, 0
.equ ins_type, ins_mnem + 8
.equ ins_argc, ins_type + 1
.equ ins_args, ins_argc + 1
.equ ins_size, ins_args + (arg_size * MAX_ARGS)
