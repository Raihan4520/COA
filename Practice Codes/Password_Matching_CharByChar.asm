.MODEL SMALL
.STACK 100H
.DATA
MSG1 DW 'Enter your password: ', 24H
MSG2 DW 'Password Matched', 24H
MSG3 DW 'Password Not Matched', 24H
PASS DW 'mypassword', 24H
COUNT DW 10
.CODE MAIN
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV CX, COUNT
    
    LEA BX, PASS
    
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    
    AGAIN:
    MOV AH, 01H
    INT 21H
    
    CMP AL, [BX]
    JNE NMATCHED
    INC BX
    LOOP AGAIN
    
    MOV DX, 0AH
    MOV AH, 02H
    INT 21H
    
    MOV DX, 0DH
    MOV AH, 02H
    INT 21H
    
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H
    JMP CLOSE
    
    NMATCHED:
    MOV DX, 0AH
    MOV AH, 02H
    INT 21H
    
    MOV DX, 0DH
    MOV AH, 02H
    INT 21H
    
    LEA DX, MSG3
    MOV AH, 09H
    INT 21H
    
    CLOSE:    
    MOV AH, 0H
    INT 16H
    
    MAIN ENDP
END MAIN