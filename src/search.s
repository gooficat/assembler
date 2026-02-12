.text

.globl search, strlen

# rcx  , rdx , r8 , r9
# match, base, end, width
search:
    mov (%rdx), %rax
    mov %rcx, %r11
str_cmp_lp:
    mov (%rax), %r10b
    cmp %r10b, (%r11)
    jne no_match
    cmp $0, %r10b
    je found
    inc %rax
    inc %r11
    jmp str_cmp_lp
no_match:
    add %r9, %rdx
    cmp %rdx, %r8
    jne search
    xor %rdx, %rdx
found:
    mov %rdx, %rax
    ret

strlen:
    mov %rcx, %rax
strlen_lp:
    mov (%rcx), %r8b
    cmp $0, %r8b
    je done
    inc %rcx
    jmp strlen_lp
done:
    sub %rax, %rcx
    mov %rcx, %rax
    ret
