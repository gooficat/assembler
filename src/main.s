.text

.globl main

.include "search.inc"
.include "reg.inc"
.include "file.inc"

main:
    // lea test_mnem(%rip), %rcx
    // call strlen
    // push %rax

    // lea test_mnem(%rip), %rcx
    // call find_opc_class

    // mov $1, %rdi
    // lea (%rax), %rsi
    // mov (%rsi), %rsi
    // mov $1, %rax
    // pop %rdx
    // syscall

    lea (%rsp), %rcx
    sub $fstrm_size, %rsp
    lea test_path(%rip), %rdi
    call fstrm_open

    mov $1, %rax
    mov $1, %rdi
    mov fstrm_buffl(%rcx), %rdx
    lea fstrm_buffer(%rcx), %rsi
    push %rcx
    syscall
    pop %rcx

    call fstrm_close


    mov $60, %rax
    xor %rdi, %rdi
    syscall # return 0

.data

test_mnem: .asciz "add"
test_path: .asciz "asm/test.asm"
