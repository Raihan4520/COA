.MODEL SMALL
.STACK 100H
.DATA
m0 DW 'I KNOW MAGIC. $'
m1 DW 'MAGICIAN FOUND $'
m2 DW 'NO.$'
m3 DW 'DO YOU KNOW MAGIC$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV AX,5H
    MOV BX,2H
    CMP AX,BX
    MOV AH,9
    LEA DX,M3
    INT 21H
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    JGE A1
    
    MOV AH,9
    LEA DX,M3
    INT 21H
    
    A1:
    MOV AH,9
    LEA DX,M2
    INT 21H
    JMP EXIT
    MOV AH,9
    LEA DX,M1
    INT 21H
    EXIT:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    MOV AH,9
    LEA DX,M0
    INT 21H
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN