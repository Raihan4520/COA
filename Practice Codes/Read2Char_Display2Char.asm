.MODEL SMALL
.STACK 100H
.DATA
X DB ?
.CODE MAIN
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 01H
    INT 21H
    
    MOV X, AL
    
    MOV DX, 0AH
    MOV AH, 02H
    INT 21H
    
    MOV DX, 0DH
    MOV AH, 02H
    INT 21H
    
    MOV AL, X
    
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    
    MOV AH, 0H
    INT 16H
    
    MAIN ENDP
END MAIN