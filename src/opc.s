.text

.globl find_opc_class, find_opc

.include "src/opc.inc"

# string: rcx
find_opc_class:
    lea mnem_tbl(%rip), %rdx
    lea mnem_tbl_end(%rip), %r8
    mov $mnem_tbl_entry_len, %r9
    call search
    ret

find_opc:
    
    ret
