.MODEL SMALL
.STACK 100H
.DATA
VAL1 DB ?
VAL2 DB ?
MSG1 DW 'THE DIFFERENCE OF ', 24H
MSG2 DW ' AND ', 24H
MSG3 DW ' IS ', 24H
.CODE MAIN
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV DX, '?'
    MOV AH, 02H
    INT 21H
    
    MOV AH, 01H
    INT 21H       
    MOV VAL1, AL
    
    MOV AH, 01H
    INT 21H       
    MOV VAL2, AL
    
    MOV DX, 0AH
    MOV AH, 02H
    INT 21H
    
    MOV DX, 0DH
    MOV AH, 02H
    INT 21H
    
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    
    MOV DL, VAL1
    MOV AH, 02H
    INT 21H
    
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H
    
    MOV DL, VAL2
    MOV AH, 02H
    INT 21H
    
    LEA DX, MSG3
    MOV AH, 09H
    INT 21H
    
    MOV AL, VAL1
    MOV BL, VAL2
    SUB AL,BL
    ADD AL, 30H
    
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    
    MOV AH, 00H
    INT 16H
    
    MAIN ENDP
END MAIN