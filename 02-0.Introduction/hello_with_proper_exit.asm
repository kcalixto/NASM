section .data
message: db 'hello guyss', 10

section .text
global _start

_start:
    mov rax, 1          ;número da syscall write
    mov rdi, 1          ;descritor de stdout
    mov rsi, message    ;endereço da string
    mov rdx, 14         ;bytes reservados para a string
    syscall

    mov rax,60          ;num da syscall exit
    xor rdi, rdi
    syscall