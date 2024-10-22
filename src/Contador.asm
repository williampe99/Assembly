%include "io.inc"

section .data
    i dd 0  ;i=0

section .text
global main
main:
    for:
        cmp dword [i], 100
        jge end ;se i >= 100 jump para end
        
        ;equivalente ao printf("i equals %d\n", i)
        PRINT_STRING "i equals "
        PRINT_DEC 4, i
        NEWLINE
   
        inc dword[i]    ;i++ //outra forma possivel na linha abaixo
        ;add dword [i], 1
        jmp for
    end:
    xor eax, eax
    ret