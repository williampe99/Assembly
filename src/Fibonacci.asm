%include "io.inc"
; Detalhe, o exercicio pede "programa que receba um valor inteiro (N)
; e que seja capaz de exibir os N primeiros termos da sequência de Fibonacci"
; não para tratar N como entrada da formula
section .data
    i dd 0  ;i=0
    msg dw " : "
section .text
global main
main:
    GET_UDEC 4, ecx ; N primeiros termos da sequência
    ;mov ecx, 48    ; 48 é o maximo e corresponde a F(47)
    mov ebx, 0      ; F(0)
    mov edx, 1      ; F(1)
    
    cmp ecx, 0
    jle end
    
    ;F(0)
    mov eax, ebx    ; eax recebe F(0)
    
    inc dword[i]    ; primeiro termo
    PRINT_UDEC 4, i
    PRINT_STRING msg
    PRINT_UDEC 4, eax
    NEWLINE

    dec ecx
    cmp ecx, 0
    jz end      ; se ecx for 0 a sequencia se encerra
    
    ;F(1)
    mov eax, edx    ; eax recebe F(1)
    
    inc dword[i]    ; segundo termo
    PRINT_UDEC 4, i
    PRINT_STRING msg
    PRINT_UDEC 4, eax
    NEWLINE
    
    dec ecx
    cmp ecx, 0
    jz end      ; se ecx for 0 a sequencia se encerra
    
    ; Loop para calcular e imprimir os próximos números Fibonacci
seq_loop:    
    mov eax, ebx      ; eax recebe F(n-2)
    add eax, edx      ; e soma F(n-1) para eax = F(n)
   
    mov ebx, edx      ; F(n-2) recebe F(n-1)
    mov edx, eax      ; F(n-1) recebe F(n) 
 
    inc dword[i]
    PRINT_UDEC 4, i
    PRINT_STRING msg
    PRINT_UDEC 4, eax ; Imprime o número de Fibonacci atual
    NEWLINE
    
    dec ecx
    jnz seq_loop

end:
    mov eax, 0
    xor eax, eax
    ret