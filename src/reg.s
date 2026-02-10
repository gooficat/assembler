.text

.extern registers
.extern end_of_registers

.globl find_reg

.macro printc ch
    mov $\ch, %rcx
    sub $32, %rsp
    call putchar
    add $32, %rsp
.endm

find_reg:
    lea registers(%rip), %rdx
    lea end_of_registers(%rip), %r10

    reg_cmp_lp:
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
        add $10, %rdx
        cmp %rdx, %r10
        jne reg_cmp_lp

    xor %rdx, %rdx
match:
    mov %rdx, %rax
    ret
