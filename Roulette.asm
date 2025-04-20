INCLUDE Irvine32.inc
.data
    blackOnGreen BYTE 20h 
    verticalBar BYTE '|', 0
    redOnGreen BYTE 24h 
    poundSign BYTE '#', 0
    space BYTE ' ',0
    grayOnGreen BYTE 27h
    underScore BYTE “_”, 0 
    forwardSlash BYTE "/", 0
    forwardBracket BYTE "[", 0
    backBracket BYTE "]". 0
    twoToOne BYTE "2 to 1", 0
.code
main PROC
Roulette:
	call RowOne
    call RowTwo
main ENDP
; Major Blocks of Roulette
RowOne:
	call SetBlack
	mov ecx, 15
	call MassWhiteSpace
	mov ecx, 79
	call MassUnderScore
	call WhiteSpace
RowTwo:
    mov ecx, 13
	call MassWhiteSpace
    call ForwardSlash
    call RedFill
    call BlackFill
    call RedFill
    call RedFill
    call BlackFill
    call RedFill
    call RedFill
    call BlackFill
    call RedFill
    call RedFill
    call BlackFill
    call RedFill
    call WhiteSpace
    call Divider
    call TwoToOne
;Printing Blocks of Characters
TwoToOne:
    call WhiteSpace
    call LeftBracket
    mov edx, OFFSET twoToOne
    call WriteString
    call RightBracket
RedFill:
	call WhiteSpace
    call Divider
    call SetRed
    mov ecx, 3
    call HashFill
    call Divider
BlackFill:
	call WhiteSpace
	call Divider
    mov ecx, 3
    call HashFill
    call Divider
RedFront:
	call WhiteSpace
	call Divider
    call SetRed
    call HashTag
RedBack:
	call SetRed
    call HashTag
    call Divider
BlackFront:
	call WhiteSpace
	call Divider
	call HashTag
BlackBack:
	call SetBlack
	call HashTag
call Divider

; Printing Loops
HashFill:
	call HashTag
	loop HashFill
MassWhiteSpace:
	call WhiteSpace
	loop MassWhiteSpace
MassUnderScore:
	call UnderScore
	loop UnderScore

; Printing Characters
Divider:
	call SetBlack
    mov edx, OFFSET VerticleBar
    call WriteString
HashTag:
	mov edx, OFFSET poundSign
	call WriteString
UnderScore:
	mov edx, OFFSET underScore
	call WriteString
WhiteSpace:
    mov edx, OFFSET space
    call WriteString
ForwardSlash:
    call SetBlack
	mov edx, OFFSET forwardSlash
    call WriteChar
LeftBracket:
    call SetBlack
    mov edx, OFFSET forwardBracket
    call WriteChar
RightBracket:
    mov edx, OFFSET backBracket
    call WriteChar

; Setting Colors
SetBlack:
    mov eax, blackOnGreen
    call SetTextColor
SetRed:
	move eax, redOnGreen
	call SetTextColor
SetGray:
	mov eax, grayOnGreen
	call SetTextColor

END main




