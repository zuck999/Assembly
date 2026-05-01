global _start

section .text

_start:
  mov rax,1
  mov rdi,1
  mov rsi,hello
  mov rdx,hello_length
  syscall
  
  
user_input:
  mov rax,0
  mov rdi,0
  mov rsi,input
  mov rdx,100
  syscall
  
  
exitting_program:
  mov rax,60
  mov rdi,22 ;just status (random)
  syscall
  
  
section .data

  hello: db "Enter your name : "
  hello_length: equ $-hello
  
  
section .bss
  input: resb 100 
