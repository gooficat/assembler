
.extern mnem_tbl, mnem_tbl_end

.equ mnem_tbl_entry_len, 8

.include "reg.inc"

.include "prm.inc"


.equ Mode16, 1<<0
.equ Mode32, 1<<1
.equ Mode64, 1<<2

.equ Rex64, 1<<3
.equ D, 1<<4
.equ W, 1<<5
