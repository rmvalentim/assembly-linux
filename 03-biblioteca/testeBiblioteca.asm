%include 'biblioteca.inc'

section .text

global _start

_start:
    lea esi, [BUFFER]   ; Load Effective Address
    add esi, 0x9
    mov byte[esi], 0xA

    dec esi
    mov dl, 0x11        ; 0x11 = A
    add dl, '0'
    mov [esi], dl

    dec esi
    mov dl, 0x12        ; 0x12 = B
    add dl, '0'
    mov [esi], dl

    call saidaResultado

    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT
    int SYS_CALL