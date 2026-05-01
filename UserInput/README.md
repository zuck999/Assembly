# 64-bit Assembly: User Input & Output

This project demonstrates how to perform basic I/O (Input/Output) operations using **x86_64 Linux System Calls**. It prompts the user for their name and waits for keyboard input before exiting.

---

## 🏗 Program Structure

The code is divided into three functional segments:

### 1. `.text` (Code Section)
This section contains the logic and instructions for the CPU.
*   **`_start`**: The entry point. It calls `sys_write` (1) to display the prompt.
*   **`user_input`**: Calls `sys_read` (0) to pause the program and wait for the user to type into the `input` buffer.
*   **`exitting_program`**: Calls `sys_exit` (60) to terminate the process cleanly.

### 2. `.data` (Initialized Data)
Used for data known at compile time.
*   **`hello`**: The string "Enter your name : ".
*   **`hello_length`**: A constant that automatically calculates the byte length of the string.

### 3. `.bss` (Uninitialized Data)
Used for data that will be populated while the program is running.
*   **`input`**: Reserves **100 bytes** of memory to store whatever the user types.

---

## 🛠 Register Mapping (x86_64 ABI)

In 64-bit Linux, system calls require arguments to be placed in specific registers. 

| Register | Purpose | Value in this Program |
| :--- | :--- | :--- |
| **RAX** | **System Call ID** | 1 (Write), 0 (Read), 60 (Exit) |
| **RDI** | **1st Argument** | 1 (Stdout), 0 (Stdin), 22 (Exit Status) |
| **RSI** | **2nd Argument** | Memory address of `hello` or `input` |
| **RDX** | **3rd Argument** | Byte count (e.g., `hello_length` or 100) |

---

## 🚀 How to Run

### On Linux (x86_64)
Use the following commands in your terminal:
```bash
# 1. Assemble
nasm -f elf64 -o main.o main.asm

# 2. Link
ld -o main main.o

# 3. Run
./main