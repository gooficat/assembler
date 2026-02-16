.section ".text"

.globl tok_strm_init, tok_strm_next, tok_strm_close, tok_strm_rewind

.include "token.inc"


# tok_strm* this, char* path
tok_strm_init:
    push %rcx
    mov %rdx, %rcx
    lea fmode_rt(%rip), %rdx
    sub $32, %rsp
    call fopen
    add $32, %rsp
    pop %rcx
    mov %rax, tok_strm_file(%rcx)
    call tok_strm_getc
    call tok_strm_next
    ret

tok_strm_getc:
    push %rcx
    mov tok_strm_file(%rcx), %rcx
    sub $32, %rsp
    call fgetc
    add $32, %rsp
    pop %rcx
    mov %eax, tok_strm_buffer(%rcx)
    ret

tok_strm_next:
    call tok_strm_strip_whitespace
    lea tok_strm_token(%rcx), %rsi
    cmpl $'0', tok_strm_buffer(%rcx)
    jl tok_strm_not_alnum
    cmpl $'z', tok_strm_buffer(%rcx)
    jg tok_strm_not_alnum
tok_strm_alnum_loop:
    mov %al, (%rsi)
    inc %rsi
    call tok_strm_getc
    cmpl $'0', tok_strm_buffer(%rcx)
    jl tok_strm_done
    cmpl $'z', tok_strm_buffer(%rcx)
    jg tok_strm_done
    jmp tok_strm_alnum_loop
tok_strm_not_alnum:
    cmpl $-1, tok_strm_buffer(%rcx)
    je tok_strm_done
    mov %al, (%rsi)
    inc %rsi
tok_strm_done:
    movb $0, (%rsi)
    ret

tok_strm_strip_whitespace:
tok_strm_strip_whitespace_loop:
    cmpl $' ', tok_strm_buffer(%rcx)
    je tok_strm_strip_whitespace_strip
    cmpl $'\n', tok_strm_buffer(%rcx)
    je tok_strm_strip_whitespace_strip
    cmpl $'\t', tok_strm_buffer(%rcx)
    je tok_strm_strip_whitespace_strip
    ret
tok_strm_strip_whitespace_strip:
    call tok_strm_getc
    jmp tok_strm_strip_whitespace_loop

tok_strm_close:
    mov tok_strm_file(%rcx), %rcx
    sub $40, %rsp
    call fclose
    add $40, %rsp
    ret

tok_strm_rewind:
    push %rcx
    sub $32, %rsp
    mov tok_strm_file(%rcx), %rcx
    call rewind
    add $32, %rsp
    pop %rcx
    call tok_strm_getc
    call tok_strm_next
    ret

.data

fmode_rt:
    .asciz "r"
