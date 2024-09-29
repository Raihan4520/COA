.MODEL SMALL
.STACK 100H
.DATA
VAL1 DB ?
VAL2 DB ?
VAL3 DB ?
VAL4 DB ?
VAL5 DB ?
RES DB ?
MSG_INP DW 'Input: ',24H
MSG_OUT DW 'Output: ',24H
MSG DW ', ',24H
.CODE MAIN
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG_INP
    MOV AH,09H
    INT 21H
    
    ;INPUT 1
    MOV AH,01H
    INT 21H
    CMP AL,'0'
    JL EXIT
    CMP AL,'9'
    JG EXIT
    SUB AL,30H
    MOV VAL1,AL
    
    LEA DX,MSG
    MOV AH,09H
    INT 21H
    
    ;INPUT 2
    MOV AH,01H
    INT 21H
    CMP AL,'0'
    JL EXIT
    CMP AL,'9'
    JG EXIT
    SUB AL,30H
    MOV VAL2,AL
    
    LEA DX,MSG
    MOV AH,09H
    INT 21H
    
    ;INPUT 3
    MOV AH,01H
    INT 21H
    CMP AL,'0'
    JL EXIT
    CMP AL,'9'
    JG EXIT
    SUB AL,30H
    MOV VAL3,AL
    
    LEA DX,MSG
    MOV AH,09H
    INT 21H
    
    ;INPUT 4
    MOV AH,01H
    INT 21H
    CMP AL,'0'
    JL EXIT
    CMP AL,'9'
    JG EXIT
    SUB AL,30H
    MOV VAL4,AL
    
    LEA DX,MSG
    MOV AH,09H
    INT 21H
    
    ;INPUT 5
    MOV AH,01H
    INT 21H
    CMP AL,'0'
    JL EXIT
    CMP AL,'9'
    JG EXIT
    SUB AL,30H
    MOV VAL5,AL
    
    MOV AL,VAL1
    MUL VAL2
    MUL VAL3
    MUL VAL4
    MUL VAL5
    MOV RES,AL
    
    MOV BX,10D
    MOV CX,0D
    MOV DX,0D
    
    START:
    DIV BX
    PUSH DX
    MOV DX, 0D
    INC CX
    CMP AX, 0D
    JE END
    JMP START
    
    END:
    ;OUTPUT
    MOV DX,0AH
    MOV AH,02H
    INT 21H
    
    MOV DX,0DH
    MOV AH,02H
    INT 21H
    
    LEA DX,MSG_OUT
    MOV AH,09H
    INT 21H
    
    MOV AH,02H
    PRINT:
    POP DX
    ADD DX,30H
    INT 21H
    LOOP PRINT
    
    EXIT:
    MOV AH,00H
    INT 16H
    
    MAIN ENDP
END MAIN