.text

# ptr on rcx

.include "file.inc"


.globl fstrm_open, fstrm_getc, fstrm_close

# file path on rdi
fstrm_open:
	mov $0, %rsi
	mov $0, %rdx # O_RDONLY
	syscall
	mov %rax, fstrm_(%rcx)
	ret
