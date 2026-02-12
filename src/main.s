.text

.globl main

main:
    mov $1, %rax
    mov $1, %rdi
    mov $msg, %rsi
    mov $msg_len, %rdx
    syscall

    mov $60, %rax
    xor %rdi, %rdi
    syscall

.data

msg:
    .ascii "Hello\n"
    .equ msg_len, . - msg
