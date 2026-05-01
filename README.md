## Images
insstructor pointer (point to memory why runs next) this register only store next codes memory.
<img width="1311" height="451" alt="Screenshot 2026-05-01 at 2 35 04 PM" src="https://github.com/user-attachments/assets/0de9a27d-9908-4dac-b57d-8f60137feda2" />


# Understanding the Registers (x86_64 ABI)

In this project, we follow the **System V AMD64 ABI** convention. In 64-bit Assembly, registers act as high-speed storage locations within the CPU. Before triggering a `syscall`, we must load specific values into these registers so the Kernel knows exactly what task to perform.

---

### 📊 Register Reference Table

| Register | Name | Role in this Program | Description |
| :--- | :--- | :--- | :--- |
| **RAX** | **Accumulator** | **System Call ID** | Tells the kernel which operation to run (0=Read, 1=Write, 60=Exit). |
| **RDI** | **Destination Index** | **1st Argument** | Defines the file descriptor (0=Keyboard, 1=Monitor). |
| **RSI** | **Source Index** | **2nd Argument** | A memory pointer to the string or input buffer. |
| **RDX** | **Data Register** | **3rd Argument** | Specifies the number of bytes to read or write. |

---

### 🔍Deep Dive into the Code Logic



#### 1. The Print Operation (`sys_write`)
When the code executes `syscall` to display the prompt, the Kernel inspects the registers as follows:
*   **RAX = 1**: The ID for the `write` operation.
*   **RDI = 1**: Directed to `stdout` (Standard Output/Monitor).
*   **RSI = hello**: Points to the memory address of our "Enter your name" string.
*   **RDX = 18**: Instruction to stop reading after 18 bytes.

#### 2. The Input Operation (`sys_read`)
When the program pauses for user input:
*   **RAX = 0**: The ID for the `read` operation.
*   **RDI = 0**: Directed to `stdin` (Standard Input/Keyboard).
*   **RSI = input**: Points to the reserved space in the `.bss` section.
*   **RDX = 100**: Limits the input to 100 bytes to prevent buffer overflows.

#### 3. The Exit Operation (`sys_exit`)
*   **RAX = 60**: The ID for the `exit` operation.
*   **RDI = 22**: A custom exit status code returned to the Operating System.

---

> **Tip:** When debugging, look for these specific register values right before the `syscall` instruction to verify that your arguments are being passed correctly to the Kernel.

<img width="1311" height="821" alt="Screenshot 2026-05-01 at 2 34 45 PM" src="https://github.com/user-attachments/assets/4f540ff3-b922-4917-85c6-042e205ff2f3" />
###################################################################################
<img width="1311" height="821" alt="Screenshot 2026-05-01 at 2 34 13 PM" src="https://github.com/user-attachments/assets/8c7a636e-6a1a-433d-8c5e-ffd4238ca20f" />
###################################################################################
<img width="1311" height="821" alt="Screenshot 2026-05-01 at 2 33 48 PM" src="https://github.com/user-attachments/assets/4baccf08-620f-42f2-8fca-c54f9c4b3efd" />
###################################################################################
<img width="1311" height="821" alt="Screenshot 2026-05-01 at 2 33 38 PM" src="https://github.com/user-attachments/assets/12c47c6c-c92f-442f-bd1a-b583f784b814" />


