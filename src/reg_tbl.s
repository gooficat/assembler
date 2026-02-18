.data

.globl registers, registers_end

.include "opc_tbl.inc"

_rax: .asciz "rax"

registers:
	.quad _rax
