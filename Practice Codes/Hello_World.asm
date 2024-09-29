.MODEL SMALL
.STACK 100H
.DATA
MSG DW 'HELLO WORLD!', 24H
.CODE MAIN
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG
    MOV AH, 09H
    INT 21H
    
    MOV DX, 0AH
    MOV AH, 02H
    INT 21H
    
    MOV DX, 0DH
    MOV AH, 02H
    INT 21H
    
    MOV AH, 0H
    INT 16H
    
    MAIN ENDP
END MAIN