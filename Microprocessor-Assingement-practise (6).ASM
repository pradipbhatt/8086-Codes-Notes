.stack 100h

.data
    List   db 1, 2, 3, 6, 7, 8
    Result db ?

.code
Main proc
    MOV AX, @data
    MOV DS, AX
    MOV SI, OFFSET List
    MOV AL, 00H
    MOV CX, 6     ; Update the counter to match the number of elements in the new array

Back:
    CMP AL, [SI]
    JNC Ahead
    MOV AL, [SI]

Ahead:
    INC SI
    LOOP Back

    MOV Result, AL
    INT 3
    MOV AH, 4CH
    INT 21H

Main endp
End Main
