; Program: Block Memory Copy
; File: block_memory_copy.asm

.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC
    MOV AX, 1000H       ; Load the data segment address into AX
    MOV DS, AX           ; Move the data segment address into DS

    MOV BL, 8            ; Number of bytes to transfer

    MOV SI, 0E000H       ; Start address of the source block
    MOV DI, 0B001H       ; Start address of the destination block

LOOP_START:
    MOV AL, [SI]         ; Move the byte from the source to AL
    MOV [DI], AL         ; Move the byte from AL to the destination
    INC SI               ; Increment the source address
    INC DI               ; Increment the destination address
    DEC BL               ; Decrement the count
    JNZ LOOP_START       ; Jump to LOOP_START if count is not zero

    INT 3                ; Breakpoint for debugging purposes

    MOV AH, 4CH          ; Exit program
    INT 21H              ; Call the DOS interrupt to exit the program

MAIN ENDP

END MAIN

; Expected Output:
; The block of 8 bytes will be copied from the source address 0xE000 to the destination address 0xB001.
