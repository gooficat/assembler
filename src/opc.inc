
.extern mnem_tbl, mnem_tbl_end

.include "src/reg.inc"

.include "src/prm.inc"


.equ Mode16, 1<<0
.equ Mode32, 1<<1
.equ Mode64, 1<<2

.equ Rex64, 1<<3
.equ D, 1<<4
.equ W, 1<<5
