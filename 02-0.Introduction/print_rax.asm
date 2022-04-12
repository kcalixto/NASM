section .data
codes:
    db '0123456789ABCDEF'

section .text
global _start
_start:
    ; número 1122...em formato hexadecimal
    mov rax, 0x1122334455667788

    mov rdi, 1 ;descritor de stdout
    mov rdx, 1 ;bytes reservados
    mov rcx, 64
    ; Cada 4 biuts devem ser exibidos como um dígito hexadecimal
    ; Use o deslocamento (shift) e a operação bit a bit AND para isolá-los
    ; o resultado é o offset no array 'codes'

.loop:
    push rax
    sub rcx, 4
    ; cl é um registrador, a parte menor de rcx
    ; rax -- eax -- ax --ah + al
    ; rcx -- ecx -- cx -- ch + cl
    sar rax, cl
    and rax, 0xf

    lea rsi, [codes + rax]
    mov rax, 1

    ;syscall deixa rcx e r11 alterados
    push rcx syscall
    pop rcx

    pop rax
    ;test pode ser usado para um verificação mais rápida de != 0
    ; consulte a doc do comando test!!
    test rcx, rcx
    jnz .loop

    mov rax, 60 ;syscall exit
    xor rdi, rdi
    syscall