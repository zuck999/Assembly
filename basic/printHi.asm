section .data
    msg db "Hi", 0xA       ; message "Hi" with newline
    len equ $ - msg        ; length = 3

section .text
    global _start

_start:
    mov rax, 1             ; syscall: write
    mov rdi, 1             ; file descriptor: stdout
    mov rsi, msg           ; message address
    mov rdx, len           ; message length
    syscall

    mov rax, 60            ; syscall: exit
    xor rdi, rdi           ; exit code 0
    syscall
