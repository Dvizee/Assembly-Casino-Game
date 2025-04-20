INCLUDE Irvine32.inc
.data
    ; Colors
    blackOnGreen BYTE 20h 
    redOnGreen BYTE 24h 
    grayOnGreen BYTE 27h

    ; Characters
    verticalBar BYTE '|', 0
    poundSign BYTE '#', 0
    space BYTE ' ',0
    underScore BYTE '_', 0 
    forwardSlash BYTE '/', 0
    backSlash BYTE '\', 0
    forwardBracket BYTE '[', 0
    backBracket BYTE ']', 0
    dash BYTE '-', 0

    ; Strings
    twoToOne BYTE "2 to 1", 0
    first12 BYTE "1st 12", 0
    second12 BYTE "2nd 12", 0
    third12 BYTE "3rd 12", 0
    oneTo18 BYTE "1 to 18", 0
    nineteenTo36 BYTE "19 to 36", 0
    even BYTE "Even", 0
    odd BYTE "Odd", 0
    red BYTE "Red", 0
    black BYTE "Black", 0
    

.code
main PROC
Roulette:
    ; Underscore Top Boundary
	call RowOne

    ; Number Line One
    call RowTwo
    call RowThree
    call RowFour

    ; Number Line Two
    call RowFive
    call RowSix
    call RowSeven

    ; Number Line Three:
    call RowEight
    call RowNine
    call RowTen

    ; Dash Bottom Boundary
    call RowEleven

    ; Empty Line
    call RowTwelve

    ; Option Line 1
    call RowThirteen

    ; Option Line 2
    call RowFourteen

main ENDP
; Major Blocks of Roulette
; Top Boundary
RowOne:
	call SetBlack
	mov ecx, 15
	call MassWhiteSpace
	mov ecx, 79
	call MassUnderScore
	call WhiteSpace

    call Crlf

; Block one of three
RowTwo:
    mov ecx, 13
	call MassWhiteSpace
    call ForwardSlash
    call WhiteSpace
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

    call Crlf

RowThree:
    mov ecx, 12
    call MassWhiteSpace
    call ForwardSlash
    mov ecx, 2
    call MassWhiteSpace

    call RedFront
    call SetGray
    mov al, '0'
    call WriteChar
    mov al, '3'
    call WriteChar
    call RedBack

    call BlackFront
    call SetGray
    mov al, '0'
    call WriteChar
    mov al, '6'
    call WriteChar
    call BlackBack

    call RedFront
    call SetGray
    mov al, '0'
    call WriteChar
    mov al, '9'
    call WriteChar
    call RedBack

    call RedFront
    call SetGray
    mov al, '1'
    call WriteChar
    mov al, '2'
    call WriteChar
    call RedBack

    call BlackFront
    call SetGray
    mov al, '1'
    call WriteChar
    mov al, '5'
    call WriteChar
    call BlackBack

    call RedFront
    call SetGray
    mov al, '1'
    call WriteChar
    mov al, '8'
    call WriteChar
    call RedBack

    call RedFront
    call SetGray
    mov al, '2'
    call WriteChar
    mov al, '1'
    call WriteChar
    call RedBack

    call BlackFront
    call SetGray
    mov al, '2'
    call WriteChar
    mov al, '4'
    call WriteChar
    call BlackBack

    call RedFront
    call SetGray
    mov al, '2'
    call WriteChar
    mov al, '7'
    call WriteChar
    call RedBack

    call RedFront
    call SetGray
    mov al, '3'
    call WriteChar
    mov al, '0'
    call WriteChar
    call RedBack

    call BlackFront
    call SetGray
    mov al, '3'
    call WriteChar
    mov al, '3'
    call WriteChar
    call BlackBack

    call RedFront
    call SetGray
    mov al, '3'
    call WriteChar
    mov al, '6'
    call WriteChar
    call RedBack

    call WhiteSpace
    call Divider
    call TwoToOne

    call Crlf

RowFour:
    mov ecx, 10
    call MassUnderScore
    call WhiteSpace
    call ForwardSlash
    mov ecx, 3
    call MassWhiteSpace
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

    call Crlf

; Block two of three
RowFive:
    call Divider
    mov ecx, 4
    call HashFill
    call Divider
    call Divider
    mov ecx, 4
    call MassWhiteSpace

    call BlackFill
    call RedFill
    call BlackFill
    call BlackFill
    call RedFill
    call BlackFill
    call BlackFill
    call RedFill
    call BlackFill
    call BlackFill
    call RedFill
    call BlackFill

    call WhiteSpace
    call Divider

    call Crlf
    
RowSix:
    call Divider
    call HashTag
    call SetGray
    mov al, '0'
    call WriteChar
    call WriteChar
    call SetBlack
    call HashTag
    call Divider
    call Divider

    call BlackFront
    call SetGray
    mov al, '0'
    call WriteChar
    mov al, '2'
    call WriteChar
    call BlackBack
    
    call RedFront
    call SetGray
    mov al, '0'
    call WriteChar
    mov al, '5'
    call WriteChar
    call RedBack

    call BlackFront
    call SetGray
    mov al, '0'
    call WriteChar
    mov al, '8'
    call WriteChar
    call BlackBack

    call BlackFront
    call SetGray
    mov al, '1'
    call WriteChar
    mov al, '1'
    call WriteChar
    call BlackBack
    
    call RedFront
    call SetGray
    mov al, '1'
    call WriteChar
    mov al, '4'
    call WriteChar
    call RedBack

    call BlackFront
    call SetGray
    mov al, '1'
    call WriteChar
    mov al, '7'
    call WriteChar
    call BlackBack

    call BlackFront
    call SetGray
    mov al, '2'
    call WriteChar
    mov al, '0'
    call WriteChar
    call BlackBack
    
    
    call RedFront
    call SetGray
    mov al, '2'
    call WriteChar
    mov al, '3'
    call WriteChar
    call RedBack

    call BlackFront
    call SetGray
    mov al, '2'
    call WriteChar
    mov al, '6'
    call WriteChar
    call BlackBack

    call BlackFront
    call SetGray
    mov al, '2'
    call WriteChar
    mov al, '9'
    call WriteChar
    call BlackBack
    
    call RedFront
    call SetGray
    mov al, '3'
    call WriteChar
    mov al, '2'
    call WriteChar
    call RedBack
    
    
    call BlackFront
    call SetGray
    mov al, '3'
    call WriteChar
    mov al, '5'
    call WriteChar
    call BlackBack

    call WhiteSpace
    call Divider
    call TwoToOne

    call Crlf

RowSeven:
    ; Row Seven is the same as Row Five. We still call Row Seven in the main to avoid confusion
    call RowFive

    call Crlf

; Block three of three
RowEight:
    mov ecx, 10
    call MassWhiteSpace
    call BackSlash
    mov ecx, 5
    call MassWhiteSpace

    call RedFill
    call BlackFill
    call RedFill
    call BlackFill
    call BlackFill
    call RedFill
    call RedFill
    call BlackFill
    call RedFill
    call BlackFill
    call BlackFill
    call RedFill

    call WhiteSpace
    call Divider

    call Crlf

RowNine:
    mov ecx, 12
    call MassWhiteSpace
    call BackSlash
    mov ecx, 2
    call MassWhiteSpace


    call RedFront
    call SetGray
    mov al, '0'
    call WriteChar
    mov al, '1'
    call WriteChar
    call RedBack

    call BlackFront
    call SetGray
    mov al, '0'
    call WriteChar
    mov al, '4'
    call WriteChar
    call BlackBack

    call RedFront
    call SetGray
    mov al, '0'
    call WriteChar
    mov al, '7'
    call WriteChar
    call RedBack

    call BlackFront
    call SetGray
    mov al, '1'
    call WriteChar
    mov al, '0'
    call WriteChar
    call BlackBack

    call BlackFront
    call SetGray
    mov al, '1'
    call WriteChar
    mov al, '3'
    call WriteChar
    call BlackBack

    call RedFront
    call SetGray
    mov al, '1'
    call WriteChar
    mov al, '6'
    call WriteChar
    call RedBack

    call RedFront
    call SetGray
    mov al, '1'
    call WriteChar
    mov al, '9'
    call WriteChar
    call RedBack

    call BlackFront
    call SetGray
    mov al, '2'
    call WriteChar
    mov al, '2'
    call WriteChar
    call BlackBack

    call RedFront
    call SetGray
    mov al, '2'
    call WriteChar
    mov al, '5'
    call WriteChar
    call RedBack

    call BlackFront
    call SetGray
    mov al, '2'
    call WriteChar
    mov al, '8'
    call WriteChar
    call BlackBack

    call BlackFront
    call SetGray
    mov al, '3'
    call WriteChar
    mov al, '1'
    call WriteChar
    call BlackBack

    call RedFront
    call SetGray
    mov al, '3'
    call WriteChar
    mov al, '4'
    call WriteChar
    call RedBack


    call WhiteSpace
    call Divider
    call TwoToOne

    call Crlf

RowTen:
    mov ecx, 14
    call MassWhiteSpace
    call BackSlash

    call RedFill
    call BlackFill
    call RedFill
    call BlackFill
    call BlackFill
    call RedFill
    call RedFill
    call BlackFill
    call RedFill
    call BlackFill
    call BlackFill
    call RedFill

    call WhiteSpace
    call Divider

    call Crlf

; Bottom Boundary
RowEleven:
    mov ecx, 16
    call MassWhiteSpace
    mov ecx, 99
    call MassDash

    call Crlf

; Empty Row
RowTwelve:
    call Crlf

; Option Line One
RowThirteen:
    mov ecx, 33
    call MassWhiteSpace
    call SetBlack

    call LeftBracket
    mov edx, OFFSET first12
    call WriteString
    call RightBracket

    mov ecx, 32
    call MassWhiteSpace

    call LeftBracket
    mov edx, OFFSET second12
    call WriteString
    call RightBracket

    mov ecx, 32
    call MassWhiteSpace

    call LeftBracket
    mov edx, OFFSET third12
    call WriteString
    call RightBracket

    call Crlf

; Option Line Two
RowFourteen:
    mov ecx, 25
    call MassWhiteSpace

    call LeftBracket
    mov edx, OFFSET oneTo18
    call WriteString
    call RightBracket

    call WhiteSpace

    call LeftBracket
    mov edx, OFFSET even
    call WriteString
    call RightBracket

    mov ecx, 22
    call MassWhiteSpace

    call LeftBracket
    mov edx, OFFSET 
    call WriteString black
    call RightBracket

    call WhiteSpace

    call LeftBracket
    mov edx, OFFSET red
    call WriteString
    call RightBracket

    mov ecx, 25
    call MassWhiteSpace

    call LeftBracket
    mov edx, OFFSET odd
    call WriteString
    call RightBracket

    call WhiteSpace

    call LeftBracket
    mov edx, OFFSET nineteenTo36
    call WriteString
    call RightBracket

    call Crlf

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
	loop MassUnderScore
MassDash:
    call Dash
    loop MassDash

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
BackSlash:
    call SetBlack
	mov edx, OFFSET backSlash
    call WriteChar
LeftBracket:
    call SetBlack
    mov edx, OFFSET forwardBracket
    call WriteChar
RightBracket:
    mov edx, OFFSET backBracket
    call WriteChar
Dash:
    mov edx, OFFSET dash 
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
