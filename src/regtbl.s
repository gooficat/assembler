.data

.globl registers, end_of_registers

.equ Reg8, 0
.equ Reg16, 1
.equ Reg32, 2
.equ Reg64, 3
.equ SReg, 4

rax: .asciz "rax"
rcx: .asciz "rcx"
rdx: .asciz "rdx"
rbx: .asciz "rbx"
rsp: .asciz "rsp"
rbp: .asciz "rbp"
rsi: .asciz "rsi"
rdi: .asciz "rdi"

r8: .asciz "r8"
r9: .asciz "r9"
r10: .asciz "r10"
r11: .asciz "r11"
r12: .asciz "r12"
r13: .asciz "r13"
r14: .asciz "r14"
r15: .asciz "r15"

eax: .asciz "eax"
ecx: .asciz "ecx"
edx: .asciz "edx"
ebx: .asciz "ebx"
esp: .asciz "esp"
ebp: .asciz "ebp"
esi: .asciz "esi"
edi: .asciz "rdi"

registers:

/ 64 bit

.quad rax
.byte 0x00
.byte Reg64

.quad rcx
.byte 0x01
.byte Reg64

.quad rdx
.byte 0x02
.byte Reg64

.quad rbx
.byte 0x03
.byte Reg64

.quad rsp
.byte 0x04
.byte Reg64

.quad rbp
.byte 0x05
.byte Reg64

.quad rsi
.byte 0x06
.byte Reg64

.quad rdi
.byte 0x07
.byte Reg64

.quad r8
.byte 0x08
.byte Reg64

.quad r9
.byte 0x09
.byte Reg64

.quad r10
.byte 0x0A
.byte Reg64

.quad r11
.byte 0x0B
.byte Reg64

.quad r12
.byte 0x0C
.byte Reg64

.quad r13
.byte 0x0D
.byte Reg64

.quad r14
.byte 0x0E
.byte Reg64

.quad r15
.byte 0x0F
.byte Reg64

/ 32 bit

.quad eax
.byte 0x00
.byte Reg32

.quad ecx
.byte 0x01
.byte Reg32

.quad edx
.byte 0x02
.byte Reg32

.quad ebx
.byte 0x03
.byte Reg32

.quad esp
.byte 0x04
.byte Reg32

.quad ebp
.byte 0x05
.byte Reg32

.quad esi
.byte 0x06
.byte Reg32

.quad edi
.byte 0x07
.byte Reg32

/ 16 bit (reuse names from 32 bit plus a displacement)

.quad 1+eax
.byte 0x00
.byte Reg16

.quad 1+ecx
.byte 0x01
.byte Reg16

.quad 1+edx
.byte 0x02
.byte Reg16

.quad 1+ebx
.byte 0x03
.byte Reg16

.quad 1+esp
.byte 0x04
.byte Reg16

.quad 1+ebp
.byte 0x05
.byte Reg16

.quad 1+esi
.byte 0x06
.byte Reg16

.quad 1+edi
.byte 0x07
.byte Reg16

/ 8 bit
end_of_registers:
