.MODEL SMALL
.STACK 100H
.DATA
MSG1 DW 'ENTER NUM1:', 24H
MSG2 DW 'ENTER NUM2:', 24H
MSG3 DW 'AVERAGE:', 24H
MSG4 DW 'REMINDER:', 24H
NUM1 DB ?
NUM2 DB ?
AVG DB ?
REM DB ?
.CODE MAIN
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    
    MOV AH, 01H
    INT 21H
    
    SUB AL, 30H
    MOV NUM1, AL
    
    MOV DX, 0AH
    MOV AH, 02H
    INT 21H
    
    MOV DX, 0DH
    MOV AH, 02H
    INT 21H
    
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H
    
    MOV AH, 01H
    INT 21H
    
    SUB AL, 30H
    MOV NUM2, AL
    
    MOV AL, NUM1
    ADD AL, NUM2
    
    MOV AH, 0H
    
    MOV BL, 2D
    DIV BL
    
    ADD AL, 48
    ADD AH, 48
    
    MOV AVG, AL
    MOV REM, AH
    
    MOV DX, 0AH
    MOV AH, 02H
    INT 21H
    
    MOV DX, 0DH
    MOV AH, 02H
    INT 21H
    
    LEA DX, MSG3
    MOV AH, 09H
    INT 21H
    
    MOV DL, AVG
    MOV AH, 02H
    INT 21H
    
    MOV DX, 0AH
    MOV AH, 02H
    INT 21H
    
    MOV DX, 0DH
    MOV AH, 02H
    INT 21H
    
    LEA DX, MSG4
    MOV AH, 09H
    INT 21H
    
    MOV DL, REM
    MOV AH, 02H
    INT 21H
    
    MOV AH, 0H
    INT 16H
    
    MAIN ENDP
END MAIN    