.MODEL SMALL
.STACK 100H
.DATA
MSG1 DW 'Enter a character: ', 24H
MSG2 DW 'Thank you.', 24H
COUNT DW 50D
X DB ?
.CODE MAIN
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV CX, COUNT
    
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    
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
    
    START:
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    DEC CX
    CMP CX, 0D
    JNZ START
    
    MOV DX, 0AH
    MOV AH, 02H
    INT 21H
    
    MOV DX, 0AH
    MOV AH, 02H
    INT 21H
    
    MOV DX, 0DH
    MOV AH, 02H
    INT 21H
    
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H
    
    MOV AH, 0H
    INT 16H
    
    MAIN ENDP
END MAIN