.section ".text"

.globl tok_strm_init, tok_strm_next, tok_strm_close

.include "token.inc"


# tok_strm* this, char* path
tok_strm_init:
    push %rcx
    mov %rdx, %rcx
    lea fmode_rt(%rip), %rdx
    sub $40, %rsp
    call fopen
    add $40, %rsp
    pop %rcx
    mov %rax, tok_strm_file(%rcx)
    call tok_strm_getc
    ret

tok_strm_getc:
    push %rcx
    mov tok_strm_file(%rcx), %rcx
    call fgetc
    pop %rcx
    mov %eax, tok_strm_buffer(%rcx)
    ret

tok_strm_next:
    ret


tok_strm_close:


.data

fmode_rt:
    .asciz "rt"
