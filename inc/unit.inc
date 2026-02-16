.include "vec.inc"
.extern unit_assemble, unit_pass, handle_line
.equ unit_current_pass, 0
.equ unit_next_pass, unit_current_pass + 1
.equ unit_offset, unit_next_pass + 1
.equ unit_labels, unit_offset + 8
.equ unit_struc_size, unit_labels + vec_struc_size # (24)
.equ UNIT_PASS_LABEL, 0
.equ UNIT_PASS_ALIGN, 1
.equ UNIT_PASS_WRITE, 2
.equ UNIT_PASS_DONE, 3
