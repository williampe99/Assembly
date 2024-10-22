%include "io.inc"
; Ano Bissexto ocorre a cada quatro anos, exceto anos múltiplos de 100 que não são múltiplos de 400

section .data
    msg db "O ano ", 0
    msg_true db " e' Bissexto", 0xA, 0
    msg_false db " na'o e' Bissexto", 0xA, 0 
    ano dd 0 ; ano=0

section .text
global main
main:
        PRINT_STRING msg
        GET_UDEC 4, eax
        mov dword[ano], eax
        
        mov edx, 0  ; zera resto
        mov eax, dword[ano]; dividendo
        mov ecx, 400; divisor
        div ecx
        
        cmp edx, 0  ; se for multiplo de 400, o resto é 0
        jz true     ; jump para true
        
          
        mov edx, 0  ; zera resto
        mov eax, dword[ano];  dividendo
        mov ecx, 4  ; divisor
        div ecx
        
        cmp edx, 0  ; se não for multiplo de 4, diferente de 0
        jnz false   ; jump para false
        
        mov edx, 0  ; zera resto
        mov eax, dword[ano]; dividendo
        mov ecx, 100; divisor
        div ecx
        
        cmp edx, 0  ; se for multiplo de 100 o resto é 0
        jz false    ; e não pode ser bissexto, jump para false
        
; se for multiplo de 4 e não de 100 o código segue, pois é bissexto       
true:
    PRINT_DEC 4, ano
    PRINT_STRING msg_true
    jmp end
    
false:
    PRINT_DEC 4, ano
    PRINT_STRING msg_false
    
end:
    xor eax, eax
    ret