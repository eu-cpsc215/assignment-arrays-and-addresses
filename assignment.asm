extrn ExitProcess : proc        ; Declare external function ExitProcess
extrn printf : proc             ; Declare external function printf

.DATA                           ; Directive: Enter .data section

inputNumbers BYTE 2, 15, 80, 102, 156, 215
outputNumbers WORD 3 DUP (0)
outputAddresses QWORD 3 DUP (0)
outputFmtStr BYTE "Result: %i, %i, %i",0

.CODE                           ; Directive: Enter .code section

main PROC                       ; Directive: Begin function labeled `main`

    sub rsp, 28h                ; Bump 8 bytes to ensure 16 byte alignment. Reserve 32 bytes shadow space.
    ; -------------------- /\ PROLOGUE /\ --------------------

    ; ========================================================

    ; PUT YOUR CODE HERE

    ; ========================================================

    ; The following code prints the output numbers to the console using the output addresses.
    ; You can modify or comment this code while writing and debugging your program,
    ; but it must be reverted to its original state when you submit the assignment.

    lea rcx, [outputFmtStr]             ; First parameter of printf is the format string

    mov rax, [outputAddresses]          ; Get address of first output number
    xor rdx, rdx                        ; Clear RDX
    mov dx, [rax]                       ; Second parameter of printf is the first output number

    mov rax, [outputAddresses + 8]      ; Each address is 8 bytes; skip first 8 bytes to get beginning of 2nd address)
    xor r8, r8                          ; Clear R8
    mov r8w, [rax]                      ; Third parameter of printf is the first output number

    mov rax, [outputAddresses + 16]     ; Skip 16 bytes to get to beginning of 3rd address
    xor r9, r9                          ; Clear R9
    mov r9w, [rax]                      ; Fourth parameter of printf is the first output number

    call printf                         ; Equivalent to: printf("Result: %i, %i, %i", firstOutput, secondOutput, thirdOutput)

    ; -------------------- \/ EPILOGUE \/ --------------------
    xor rcx, rcx                ; Clear RCX
    call ExitProcess            ; Use Windows API to exit the process

main ENDP                       ; Directive: End function labeled `main`

END
