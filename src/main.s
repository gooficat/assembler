.text

.globl main

.include "src/search.inc"
.include "src/reg.inc"

main:
    lea test_mnem(%rip), %rcx
    call strlen
    push %rax

    lea test_mnem(%rip), %rcx
    call find_reg

    mov $1, %rdi
    lea (%rax), %rsi
    mov (%rsi), %rsi
    mov $1, %rax
    pop %rdx
    syscall

    mov $60, %rax
    xor %rdi, %rdi
    syscall

.data


test_mnem: .asciz "rax"
