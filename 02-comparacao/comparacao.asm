segment .data
    LF          equ 0xA     ; Line Feed
    NULL        equ 0xD     ; Final da String
    SYS_CALL    equ 0x80    ; Envia informacao ao SO
    ; EAX
    SYS_EXIT    equ 0x1     ; Codigo de finalizacao do programa
    SYS_READ    equ 0x3     ; Operacao de leitura
    SYS_WRITE   equ 0x4     ; Operacao de escrita
    ; EBX
    RET_EXIT    equ 0x0     ; Operacao realizada com sucesso
    STD_IN      equ 0x0     ; Entrada padrao
    STD_OUT     equ 0x1     ; Saida padrao

; --- Definidores de dados
;     
; db - Define byte - 1 byte (8 bits) | Caracteres, flags, arrays de bytes
; dw - Define word - 2 bytes (16 bits) | Inteiros 16 bits, tabelas curtas
; dd - Define double word - 4 bytes (32 bits) | Inteiros 32 bits, ponteiros x86
; dq - Define quad word  - 8 bytes (64 bits) | Inteiros 64 bits, ponteiros em x86-64
; dt - Define ten word - 10 bytes (80 bits) | Números em ponto flutuante estendido (FPU)
;
; ---

section .data

    x dd 60
    y dd 50
    msg1 db "X maior que Y", LF, NULL
    tam1 equ $ - msg1
    msg2 db "Y maior que X", LF, NULL
    tam2 equ $ - msg2

section .text

global _start

; --- Salto Condicional
; 
; je -> Igual (=)
; jg -> Maior (>)
; jge -> Maior ou igual (>=)
; jl -> Menor (<)
; jle -> Menor ou igual (<=)
; jne -> Diferente (!=)
;
; ---

; --- Salto Incondicional
; 
; jmp
; 
; ---

_start:
    mov EAX, DWORD[x]
    mov EBX, DWORD[y]
    ; if - comparacao
    cmp EAX, EBX 
    jge maior   ; Jump para maior se EAX >= EBX
    mov ECX, msg2 ; Senao fez o jump, exibe a msg2
    mov EDX, tam2
    jmp final

maior:
    mov ECX, msg1
    mov EDX, tam1

; --- Uso do XOR
;
;     AND        OR         XOR
; 7 - 0111      0111        0111
; 5 - 0101      0101        0101
;     0101      0111        0010
;       5         7           2   
;
; XOR comparando o mesmo registrador sempre da zero

final:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL

    mov EAX, SYS_EXIT
    xor EBX, EBX ; mov EBX, RET_EXIT
    int SYS_CALL
