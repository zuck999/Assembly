global _start


section .text

_start:
        ; code to print hello world
        mov rax,1 ; write sistem call
        mov rdi,1 ; fd(file discepter) -> 1 (for output)
        mov rsi,hello ; buffer -> hello(hello is a variable )
        mov rdx,11 ; 11 is size of string hello
        syscall
        
        ;exir
        
        mov rax,60 ;exit system call
        mov rdi,22 ;status code
        syscall
        
    
  section .data
    hello: db "hello world"


