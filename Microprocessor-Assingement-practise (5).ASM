; Helps to add the number provided bhy the user 1+3+5 and gives resukt in
.model small
.stack 100h
.data
    List db 1, 3, 5
    Total dw ?
.code
Main proc
    MOV AX, @data
    MOV DS, AX
    MOV AX, 0000H
    MOV CX, 0AH ; counter
    MOV DL, 00H ; to count carry
    MOV SI, offset List
Back:
    ADD AL, [SI]
    JC Lab
Back1:
    INC SI
    LOOP Back
    MOV Total, AX
    MOV BX, offset Total
    ADD BX, 2
    MOV [BX], DL
    INT 3
    MOV AH, 4CH
    INT 21H
Lab:
    INC DL
    JMP Back1
Main endp
End Main
