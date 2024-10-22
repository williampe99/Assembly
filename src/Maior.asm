%include "io.inc"
;Encontrar o maior elemento em um vetor V de 20 posições.

section .data
    
    ;lista desordenada de valores positivos
    vetor dd 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 100, 99, 98, 97, 96, 95, 94, 93, 92, 91
    
    ;lista alternando entre -1 0 1
    ;vetor dd -1, 0, 1, -1, 0, 1, -1, 0, 1, -1, 0, 1, -1, 0, 1, -1, 0, 1, -1, 0
    
    ;lista de numeros positivos crescentes
    ;vetor dd 7, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91, 98, 105, 112, 119, 126, 133, 140
    
    ;lista de números negativos em ordem crescente e decrescente
    ;vetor dd -20, -19, -18, -17, -16, -15, -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1
    ;vetor dd -1, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -12, -13, -14, -15, -16, -17, -18, -19, -20
    
    ;variável para armazenar o maior elemento
    maior_elemento dd 0

section .text
global main
main:
    mov ecx, 20         ; inicia o contador em 20
    mov ebx, vetor      ; ebx recebe o início do vetor
    mov eax, [ebx]      ; eax recebe o primeiro elemento do vetor
    mov [maior_elemento], eax  ; inicia o maior elemento com o primeiro valor
    
encontrar_loop:
    add ebx, 4      ; avança para o próximo elemento do vetor
    cmp ecx, 1      ; se ecx for igual a 1, é o ultimo elemento
    jle end         ; se for, sai do loop
    
    mov eax, [ebx]  ; eax recebe o próximo numero 
    cmp eax, [maior_elemento]  ; se não for maior
    jle salta_maior ; continua no loop
    
                    ; se for maior 
    mov [maior_elemento], eax ; maior_elemento recebe eax

salta_maior:
    dec ecx
    jmp encontrar_loop
    
end:
    PRINT_DEC 4, [maior_elemento]
    NEWLINE
    
    mov eax, 0
    xor eax, eax
    ret