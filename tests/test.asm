globl _start

extrn ExitProcess

_start
    mov eax, 0
    call ExitProcess
