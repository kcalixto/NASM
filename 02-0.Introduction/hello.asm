global _start

section .data
message: db 'hello, world', 10

section .text
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, 15
syscall