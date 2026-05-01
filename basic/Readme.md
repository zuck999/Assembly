# Hello World Assembly (x86_64)
That specific code is 64-bit architecture (also known as x86_64 or AMD64).
This project explains how to interface directly with the Linux Kernel using Assembly language.

---

## The Code
```nasm
global _start ; this is start point

section .text ; text section where code is written

_start:  ;code start here
    ; --- PRINT HELLO WORLD ---
    mov rax, 1        ; System call number for 'write'
    mov rdi, 1        ; File descriptor 1 (stdout/terminal)
    mov rsi, hello    ; Memory address of our string
    mov rdx, 11       ; Number of bytes to write
    syscall           ; Transfer control to the kernel

    ; --- EXIT PROGRAM ---
    mov rax, 60       ; System call number for 'exit'
    mov rdi, 0        ; Return status 0 (no errors)
    syscall           ; Transfer control to the kernel

section .data ; this is where variable are made 
    hello: db "hello world"  ;name: (type(default byte)) " string here"




#########################################################




# Register Argument Mapping for x86_64 Linux

In 64-bit Linux, the kernel expects arguments to be placed in specific registers before a `syscall` is executed. If the arguments are in the wrong registers, the system call will fail or behave unexpectedly.

---

### Argument Order Table

| Register | Purpose | Description |
| :--- | :--- | :--- |
| **RAX** | **System Call ID** | Identifies the specific action (e.g., `1` for write, `60` for exit). |
| **RDI** | **1st Argument** | The first detail needed (e.g., File Descriptor or Exit Status). |
| **RSI** | **2nd Argument** | The second detail needed (e.g., Memory address of a string). |
| **RDX** | **3rd Argument** | The third detail needed (e.g., Size/count of data in bytes). |

---

### How it looks in Code
```nasm
; Example: Writing to the terminal
mov rax, 1        ; System Call ID (write)
mov rdi, 1        ; 1st Arg: File Descriptor (stdout)
mov rsi, buffer   ; 2nd Arg: Address of data
mov rdx, 11       ; 3rd Arg: Count of bytes
syscall           ; Execute