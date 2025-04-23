INCLUDE Irvine32.inc
.data
    ; Colors
    blackOnGreen DWORD 20h 
    redOnGreen DWORD 24h 
    grayOnGreen DWORD 27h

    ; Characters
    cVerticalBar BYTE '|', 0
    cPoundSign BYTE '#', 0
    cSpace BYTE ' ',0
    cUnderScore BYTE '_', 0 
    cForwardSlash BYTE '/', 0
    cBackSlash BYTE '\', 0
    cForwardBracket BYTE '[', 0
    cBackBracket BYTE ']', 0
    cDash BYTE '-', 0

    ; Strings
    sTwoToOne BYTE "2 to 1", 0
    sFirst12 BYTE "1st 12", 0
    sSecond12 BYTE "2nd 12", 0
    sThird12 BYTE "3rd 12", 0
    sOneTo18 BYTE "1 to 18", 0
    sNineteenTo36 BYTE "19 to 36", 0
    sEven BYTE "Even", 0
    sOdd BYTE "Odd", 0
    sRed BYTE "Red", 0
    sBlack BYTE "Black", 0
    

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
    ; call RowTwelve

    ; Option Line 1
    call RowThirteen

    ; Option Line 2
    call RowFourteen
    exit
main ENDP
; Major Blocks of Roulette
; Top Boundary
RowOne:
	call SetBlack
	mov ecx, 14
	call MassWhiteSpace
	mov ecx, 87
	call MassUnderScore
	call WhiteSpace

    call Crlf
    ret

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
    ret
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
    ret
RowFour:
    mov ecx, 4
    call MassWhiteSpace
    mov ecx, 6
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
    ret

; Block two of three
RowFive:
    mov ecx, 4
    call MassWhiteSpace 
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
    ret

RowSix:
    mov ecx, 4
    call MassWhiteSpace
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
    mov ecx, 4
    call MassWhiteSpace

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
    ret

RowSeven:
    ; Row Seven is the same as Row Five. We still call Row Seven in the main to avoid confusion
    call RowFive
    ret

; Block three of three
RowEight:
    mov ecx, 4
    call MassWhiteSpace
    mov ecx, 6
    call MassDash    
    call WhiteSpace 
    call BackSlash
    mov ecx, 3
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
    ret

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
    ret

RowTen:
    mov ecx, 13
    call MassWhiteSpace
    call BackSlash
    call WhiteSpace

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
    ret

; Bottom Boundary
RowEleven:
    mov ecx, 14
    call MassWhiteSpace
    mov ecx, 87
    call MassDash

    call Crlf
    ret

; Empty Row
RowTwelve:
    call Crlf
    ret

; Option Line One
RowThirteen:
    mov ecx, 25
    call MassWhiteSpace
    call SetBlack

    call LeftBracket
    mov edx, OFFSET sFirst12
    call WriteString
    call RightBracket

    mov ecx, 20
    call MassWhiteSpace

    call LeftBracket
    mov edx, OFFSET sSecond12
    call WriteString
    call RightBracket

    mov ecx, 20
    call MassWhiteSpace

    call LeftBracket
    mov edx, OFFSET sThird12
    call WriteString
    call RightBracket

    call Crlf
    ret

; Option Line Two
RowFourteen:
    mov ecx, 20
    call MassWhiteSpace

    call LeftBracket
    mov edx, OFFSET sOneTo18
    call WriteString
    call RightBracket

    call WhiteSpace

    call LeftBracket
    mov edx, OFFSET sEven
    call WriteString
    call RightBracket

    mov ecx, 14
    call MassWhiteSpace

    call LeftBracket
    mov edx, OFFSET sBlack
    call WriteString 
    call RightBracket

    call WhiteSpace

    call LeftBracket
    mov edx, OFFSET sRed
    call WriteString
    call RightBracket

    mov ecx, 17
    call MassWhiteSpace

    call LeftBracket
    mov edx, OFFSET sOdd
    call WriteString
    call RightBracket

    call WhiteSpace

    call LeftBracket
    mov edx, OFFSET sNineteenTo36
    call WriteString
    call RightBracket

    call Crlf
    ret

;Printing Blocks of Characters
TwoToOne:
    call WhiteSpace
    call LeftBracket
    mov edx, OFFSET sTwoToOne
    call WriteString
    call RightBracket
    ret
RedFill:
	call WhiteSpace
    call Divider
    call SetRed
    mov ecx, 4
    call HashFill
    call Divider
    ret
BlackFill:
	call WhiteSpace
	call Divider
    mov ecx, 4
    call HashFill
    call Divider
    ret
RedFront:
	call WhiteSpace
	call Divider
    call SetRed
    call HashTag
    ret
RedBack:
	call SetRed
    call HashTag
    call Divider
    ret
BlackFront:
	call WhiteSpace
	call Divider
	call HashTag
    ret
BlackBack:
	call SetBlack
	call HashTag
    call Divider
    ret

; Printing Loops
HashFill:
	mov edx, OFFSET cPoundSign
	call WriteString
	loop HashFill
    ret
MassWhiteSpace:
	call WhiteSpace
	loop MassWhiteSpace
    ret
MassUnderScore:
	mov edx, OFFSET cUnderScore
    call WriteString
	loop MassUnderScore
    ret
MassDash:
    call Dash
    loop MassDash
    ret

; Printing Characters
Divider:
	call SetBlack
    mov edx, OFFSET cVerticalBar
    call WriteString
    ret
HashTag:
	mov edx, OFFSET cPoundSign
	call WriteString
    ret
WhiteSpace:
    mov edx, OFFSET cSpace
    call WriteString
    ret
ForwardSlash:
    call SetBlack
	mov edx, OFFSET cForwardSlash
    call WriteString
    ret
BackSlash:
    call SetBlack
	mov edx, OFFSET cBackSlash
    call WriteString
    ret
LeftBracket:
    call SetBlack
    mov edx, OFFSET cForwardBracket
    call WriteString
    ret
RightBracket:
    
    mov edx, OFFSET cBackBracket
    call WriteString
    ret
Dash:
    mov edx, OFFSET cDash 
    call WriteString
    ret

; Setting Colors
SetBlack:
    mov eax, blackOnGreen
    call SetTextColor
    ret
SetRed:
	mov eax, redOnGreen
	call SetTextColor
    ret
SetGray:
	mov eax, grayOnGreen
	call SetTextColor
    ret

END main
