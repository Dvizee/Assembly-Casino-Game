INCLUDE Irvine32.inc
PUBLIC RouletteBoard

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
   ; Bet Options
   choiceRed     BYTE "Red", 0
   choiceBlack   BYTE "Black", 0
   choiceEven    BYTE "Even", 0
   choiceOdd     BYTE "Odd", 0
   choice1st12   BYTE "1st 12", 0
   choice2nd12   BYTE "2nd 12", 0
   choice3rd12   BYTE "3rd 12", 0
   choice1to18   BYTE "1 to 18", 0
   choice19to36  BYTE "19 to 36", 0

   .code


RouletteBoard:
   call RowOne
   call RowTwo
   call RowThree
   call RowFour
   call RowFive
   call RowSix
   call RowSeven
   call RowEight
   call RowNine
   call RowTen
   call RowEleven
   call RowThirteen
   call RowFourteen
   ret

   RowOne:
	call SetBlack

	mov ecx, 14
	call MassWhiteSpace

	mov ecx, 87
	call MassUnderScore

	;call WhiteSpace
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
   mov edx, OFFSET choice1st12
   call WriteString
   call RightBracket

   mov ecx, 20
   call MassWhiteSpace

   call LeftBracket
   mov edx, OFFSET choice2nd12
   call WriteString
   call RightBracket

   mov ecx, 20
   call MassWhiteSpace

   call LeftBracket
   mov edx, OFFSET choice3rd12
   call WriteString
   call RightBracket

   mov ecx, 12
   call MassWhiteSpace

   call Crlf
   ret

; Option Line Two
RowFourteen:
   mov ecx, 20
   call MassWhiteSpace

   call LeftBracket
   mov edx, OFFSET choice1to18
   call WriteString
   call RightBracket

   call WhiteSpace

   call LeftBracket
   mov edx, OFFSET choiceEven
   call WriteString
   call RightBracket

   mov ecx, 14
   call MassWhiteSpace

   call LeftBracket
   mov edx, OFFSET choiceBlack
   call WriteString 
   call RightBracket

   call WhiteSpace

   call LeftBracket
   mov edx, OFFSET choiceRed
   call WriteString
   call RightBracket

   mov ecx, 17
   call MassWhiteSpace

   call LeftBracket
   mov edx, OFFSET choiceOdd
   call WriteString
   call RightBracket

   call WhiteSpace

   call LeftBracket
   mov edx, OFFSET choice19to36
   call WriteString
   call RightBracket

   mov ecx, 5
   call MassWhiteSpace

   call Crlf
   ret

;Printing Blocks of Characters
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

END
