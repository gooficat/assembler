.text

.globl tbl_find_str


# lea the beginning of the table onto rdx
# lea the end onto r10
# mov the offset onto r12
# for example
#   lea instrs(%rip), %rdx
#   lea end_of_instrs(%rip), %r10
#   mov $8, %r12
#   call tbl_find_str

tbl_find_str:
    cmp_lp:
        mov %rcx, %rsi
        mov (%rdx), %rdi
        str_cmp_lp:
            mov (%rdi), %r9b
            cmp (%rsi), %r9b
            jne no_match

            cmp $0, %r9b
            je match

            inc %rsi
            inc %rdi
            jmp str_cmp_lp
    no_match:
        add %r12, %rdx
        cmp %rdx, %r10
        jne cmp_lp

    xor %rdx, %rdx
match:
    mov %rdx, %rax
    ret