.extern regs, end_of_regs

.equ reg_tbl_entry_name, 0
.equ reg_tbl_entry_code, reg_tbl_entry_name+8
.equ reg_tbl_entry_type, reg_tbl_entry_code+1
.equ reg_tbl_entry_sz, reg_tbl_entry_type+1

.equ Reg8, 0
.equ Reg16, 1
.equ Reg32, 2
.equ Reg64, 3
.equ SReg, 4
