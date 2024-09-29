.MODEL SMALL
.STACK 100H
.DATA
MSG1 DW 'ENTER A HEX DIGIT:', 24H
MSG2 DW 'IN DECIMAL IT IS:', 24H
A DW '10', 24H
B DW '11', 24H
C DW '12', 24H
D DW '13', 24H
E DW '14', 24H
F DW '15', 24H
.CODE MAIN
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    
    MOV AH, 01H
    INT 21H
    
    MOV BL, AL
    
    MOV DX, 0AH
    MOV AH, 02H
    INT 21H
    
    MOV DX, 0DH
    MOV AH, 02H
    INT 21H
    
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H
    
    CMP BL, 'A'
    JE A_10
    
    CMP BL, 'B'
    JE B_11
    
    CMP BL, 'C'
    JE C_12
    
    CMP BL, 'D'
    JE D_13
    
    CMP BL, 'E'
    JE E_14
    
    CMP BL, 'F'
    JE F_15
    
    A_10:
    LEA DX, A
    MOV AH, 09H
    INT 21H
    JMP EXIT
    
    B_11:
    LEA DX, B
    MOV AH, 09H
    INT 21H
    JMP EXIT
    
    C_12:
    LEA DX, C
    MOV AH, 09H
    INT 21H
    JMP EXIT
    
    D_13:
    LEA DX, D
    MOV AH, 09H
    INT 21H
    JMP EXIT
    
    E_14:
    LEA DX, E
    MOV AH, 09H
    INT 21H
    JMP EXIT
    
    F_15:
    LEA DX, F
    MOV AH, 09H
    INT 21H
    JMP EXIT
    
    EXIT:
    MOV AH, 00H
    INT 16H
    
    MAIN ENDP
END MAIN