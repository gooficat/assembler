.text

.globl ts_init, ts_next, ts_rewind

.equ ts_file, 0
.equ ts_buff, ts_file+8
.equ ts_tokn, ts_buff+4
.equ len_ts, ts_tokn+32

ts_init:
    push %rcx
    sub $40, %rsp
    mov %rdx, %rcx
    lea fmode_r(%rip), %rdx
    call fopen
    add $40, %rsp
    pop %rcx
    ret

ts_next:
    sub $40, %rsp
    mov %rcx, %r12
    mov ts_buff(%r12), %eax
    cmp '0', %rax
    jl non_alnum
    cmp 'z', %rax
    jg non_alnum
    
non_alnum:
    mov %rax, ts_tokn(%r12)
    add $40, %rsp
    ret
ts_rewind:
    sub $40, %rsp


.data
fmode_r: .asciz "r"