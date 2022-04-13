section .data
    newline_char: db 10
    codes: db '0123456789abcdef'
    demo1: db 'aloha', 10
    demo2: db 0x00, 0x00, 0x00, 0x61, 0x68, 0x6f, 0x6c, 0x61

section .text
global _start

print_newline:
    mov rax, 1 ; write
    mov rdi, 1 ;stdout
    mov rsi, newline_char ;data
    mov rdx, 1 ; bytes reservados
    syscall 
    ret

print_hex:
    mov rax, rdi

    mov rdi, 1  ; stdout
    mov rdx, 1 ; bytes
    mov rcx, 64 ; shift de rax?
    
iterate:
    push rax
    sub rcx, 4
    sar rax, cl ; desloca para 60, 56, 52... 4, 0 
    ; cl é uma menor parte de rcx
    and rax, 0xf ; limpa todos os bits, exceto os 4 menos significativos
    lea rsi, [codes + rax]

    mov rax, 1

    push rcx
    syscall

    pop rcx
    pop rax
        
    test rcx, rcx
    jnz iterate

    ret

_start: 
    mov rdi, [demo1]
    call print_hex
    call print_newline

    mov rdi, [demo2]
    call print_hex
    call print_newline

    mov rax, 60;exit call
    xor rdi, rdi
    syscall