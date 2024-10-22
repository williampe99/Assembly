%include "io.inc"
;Bubblesort: ordenação de vetor

section .data
    vetor dd 262144 dup(0) ; Vetor de números ocupa 1MB na memória, escolha pessoal
    ;Entrada 40 0 1 2 3 4 5 6 7 8 9 100 99 98 97 96 95 94 93 92 91 -20 -19 -18 -17 -16 -15 -14 -13 -12 -13 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1

section .text
global main
    
main:
    mov ebp, esp; for correct debugging
    PRINT_STRING "O primeiro valor inserido corresponde ao tamanho do vetor"
    GET_UDEC 4, ecx ; ecx recebe o tamanho
    NEWLINE

    ; Verifica se o tamanho do vetor é válido
    cmp ecx, 1
    jl erro_entrada ; Se tamanho for menor que 1, erro
    
    cmp ecx, 262144
    jg erro_entrada ; Se tamanho for maior que 262144, erro
    
    PRINT_STRING "Os valores devem estar separados por espaco ou enter" ; No SASM, se a quantidade de valores forem menor do que o tamanho
                                                                        ; ele repete a ultima entrada até preencher
    NEWLINE                                                             ; se for maior ele ignora os valores excedentes
    mov ebx, 0  ; ebx ira percorrer o vetor
    
entrada:
    GET_DEC 4, [vetor + ebx*4]  ; guarda um numero no vetor
    inc ebx ; incrementa ebx para a proxima posicao
    cmp ebx, ecx    ; compara com o tamanho do vetor
    jl entrada      ; se for menor, salta para uma nova entrada 

    cmp ecx, 1      ; se o tamanho for 1 o vetor esta ordenado
    jle salta_sort  ; pula a ordenação se o vetor tiver apenas um elemento

    mov edx, ecx    ; edx recebe o tamanho do vetor
    dec edx         ; ultima posicao válida do vetor

bubblesort:
    xor ebx, ebx
    mov eax, 0  ; eax recebe a posicao 0
    
    vizinhos_loop:
        mov esi, [vetor + eax*4]    ; esi recebe o valor do vetor[eax]
        mov edi, [vetor + eax*4 + 4]; edi recebe o valor seguinte vetor[eax+1]
        cmp esi, edi    ; se for menor ou igual
        jle salta_troca ; salta a troca
        
        mov [vetor + eax*4], edi    ; vetor[eax] recebe o valor de vetor[eax+1]
        mov [vetor + eax*4 + 4], esi; vetor[eax+1] recebe o valor vetor[eax]
        mov ebx, 1  ; Marca que houve troca
        
    salta_troca:
        inc eax         ; avança a posicao
        cmp eax, edx    ; compara com a ultima posicao válida do vetor
        jl vizinhos_loop; continua enquanto não chegar ao final

        test ebx, ebx   ; se houve troca
        jnz bubblesort  ; continua o bubblesort

salta_sort:
    NEWLINE
    PRINT_STRING "Vetor ordenado:"
    mov ebx, 0
    
print_loop:
    PRINT_CHAR ' '
    PRINT_DEC 4, [vetor + ebx*4]  ; Imprime um elemento do vetor
    inc ebx  
    cmp ebx, ecx    ; se ebx for menor que o tamanho do vetor
    jl print_loop   ; salta para imprimir o proximo elemento 
    jmp end

erro_entrada:
    PRINT_STRING "Erro: Insira um valor entre 1 e 262144"

end:
    mov eax, 0
    xor eax, eax
    ret