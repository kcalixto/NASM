global _start

section .data
message: db 'hello, world', 10
exampleTimes: times 5 db 'hi!'
section .text
_start:
    mov rdx, 15
    mov rax, 1
    mov rdi, 1
    mov rsi, exampleTimes
syscall