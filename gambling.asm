INCLUDE Irvine32.inc
.data
   ; Global
   money DWORD 100
   balMsg  BYTE "Balance: ", 0
   playAgainMsg BYTE "Play Again? (Play - P, Return - R): ", 0

   ;Lobby
   casinoLine1 BYTE "   _____           _____ _____ _   _  ____  ", 0
   casinoLine2 BYTE "  / ____|   /\    / ____|_   _| \ | |/ __ \ ", 0
   casinoLine3 BYTE " | |       /  \  | (___   | | |  \| | |  | |", 0
   casinoLine4 BYTE " | |      / /\ \  \___ \  | | | . ` | |  | |", 0
   casinoLine5 BYTE " | |____ / ____ \ ____) |_| |_| |\  | |__| |", 0
   casinoLine6 BYTE "  \_____/_/    \_\_____/|_____|_| \_|\____/", 0
   casMsg  BYTE "Choose Your Game:", 0
   game1   BYTE "Press S for: Slots", 0
   game2   BYTE "Press R for: Roulette", 0
   endMsg  BYTE "Press L to leave Casino", 0
   leaveMsg   BYTE "You Left the Casino with $", 0

   ; Slots
   slotCharacters BYTE "0$7", 0
   randomNumber DWORD ?
   slot1 BYTE ?
   slot2 BYTE ?
   slot3 BYTE ?
   topMsg  BYTE "Press ENTER to Spin for $50", 0
   bar     BYTE "+-------------------------+", 0
   line    BYTE "|                         |", 0
   pay1    BYTE "0 - 0 points", 0
   pay2    BYTE "$ - 25 points", 0
   pay3    BYTE "7 - 40 points", 0
   score   BYTE "Your Score: ", 0
   urBrokeMsg BYTE "You Can't Afford to Spin", 0
   
   ; Roulette
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
   ; Roulette betting options
   bettingMethodPrompt BYTE "What would you like to bet on?: ", 0
   MAX = 79
   bettingMethod BYTE MAX+1 DUP(?)
   choiceRed     BYTE "Red", 0
   lowerRed      BYTE "red", 0
   choiceBlack   BYTE "Black", 0
   lowerBlack    BYTE "black", 0
   choiceEven    BYTE "Even", 0
   lowerEven     BYTE "even", 0
   choiceOdd     BYTE "Odd", 0
   lowerOdd      BYTE "odd", 0
   choice1st12   BYTE "1st 12", 0
   choice2nd12   BYTE "2nd 12", 0
   choice3rd12   BYTE "3rd 12", 0
   choice1to18   BYTE "1 to 18", 0
   choice19to36  BYTE "19 to 36", 0
   ; Individual Numbers
   choiceZero BYTE "0", 0
   choiceOne     BYTE "1", 0
   choiceTwo BYTE "2", 0
   choiceThree BYTE "3", 0
   choiceFour BYTE "4", 0
   choiceFive BYTE "5", 0
   choiceSix BYTE "6", 0
   choiceSeven BYTE "7", 0
   choiceEight BYTE "8", 0
   choiceNine BYTE "9", 0
   choiceTen BYTE "10", 0
   choiceEleven BYTE "11", 0
   choiceTwelve BYTE "12", 0
   choiceThirteen BYTE "13", 0
   choiceFourteen BYTE "14", 0
   choiceFifteen BYTE "15", 0
   choiceSixteen BYTE "16", 0
   choiceSeventeen BYTE "17", 0
   choiceEighteen BYTE "18", 0
   choiceNineTeen BYTE "19", 0
   choiceTwenty BYTE "20", 0
   choiceTwentyOne BYTE "21", 0
   choiceTwentyTwo BYTE "22", 0
   choiceTwentyThree BYTE "23", 0
   choiceTwentyFour BYTE "24", 0
   choiceTwentyFive BYTE "25", 0
   choiceTwentySix BYTE "26", 0
   choiceTwentySeven BYTE "27", 0
   choiceTwentyEight BYTE "28", 0
   choiceTwentyNine BYTE "29", 0
   choiceThirty BYTE "30", 0
   choiceThirtyOne BYTE "31", 0
   choiceThirtyTwo BYTE "32", 0
   choiceThirtyThree BYTE "33", 0
   choiceThirtyFour BYTE "34", 0
   choiceThirtyFive BYTE "35", 0
   choiceThirtySix BYTE "36", 0
   invalidString BYTE "Invalid input.", 0
   win           BYTE "You Won: ", 0
   loss          BYTE "You Lost.", 0
   winningNumber DWORD ?
   currentGame DWORD ? ; Added so play again works
   returnMsg     BYTE "Enter 0 to Return", 0
   betAmountMsg  BYTE "Enter bet amount: $", 0
   invalidBetMsg BYTE "Invalid Bet Amount", 0
   currentBet DWORD ?
   winningNumberScript BYTE "The winning number is: ", 0

.code
BigLoop PROC
   call Clrscr
   call Randomize ; Initilizes Randomize

   ; Draws the casino sign
   mov  eax, yellow
   call SetTextColor

   mov edx, OFFSET casinoLine1
   mov ecx, 1
   call GotoxyAtLine
   call WriteString

   mov edx, OFFSET casinoLine2
   mov ecx, 2
   call GotoxyAtLine
   call WriteString

   mov edx, OFFSET casinoLine3
   mov ecx, 3
   call GotoxyAtLine
   call WriteString

   mov edx, OFFSET casinoLine4
   mov ecx, 4
   call GotoxyAtLine
   call WriteString

   mov edx, OFFSET casinoLine5
   mov ecx, 5
   call GotoxyAtLine
   call WriteString

   mov edx, OFFSET casinoLine6
   mov ecx, 6
   call GotoxyAtLine
   call WriteString

   ; Prints Main Menu UI
   mov  eax, white
   call SetTextColor

   mov edx, OFFSET balMsg
   mov ecx, 8
   call GotoxyAtLine
   call WriteString

   mov eax, money
   CALL WriteDec

   mov edx, OFFSET casMsg
   mov ecx, 10
   call GotoxyAtLine
   call WriteString

   mov edx, OFFSET game1 ; Message to play Slots
   mov ecx, 12
   call GotoxyAtLine
   call WriteString

   mov edx, OFFSET game2 ; Message to play Roulette
   mov ecx, 13
   call GotoxyAtLine
   call WriteString

   mov edx, OFFSET endMsg ; Message to leave Casino
   mov ecx, 15
   call GotoxyAtLine
   call WriteString

   WaitForGame:
      call ReadChar
      cmp al, 's'      
      je SlotsLoop
      cmp al, 'S'      
      je SlotsLoop

      cmp ah, 'R'       
      je RouletteLoop
      cmp al, 'r'
      je RouletteLoop

      cmp al, 'l'
      je exitCasino
      cmp al, 'L'
      je exitCasino

      jmp WaitForGame  ; ignore all other keys

ret
BigLoop ENDP

SlotsLoop PROC
   ; Prints header/ insturctions
   call Clrscr
   mov edx, OFFSET topMsg
   mov ecx, 2
   call GotoxyAtLine
   call WriteString

   ; Prints top of box
   mov edx, OFFSET bar
   mov ecx, 4
   call GotoxyAtLine
   call WriteString

   ; Prints sides of box
   mov edx, OFFSET line
   mov ecx, 5
   call GotoxyAtLine
   call WriteString

   mov edx, OFFSET line
   mov ecx, 6
   call GotoxyAtLine
   call WriteString

   mov edx, OFFSET line
   mov ecx, 7
   call GotoxyAtLine
   call WriteString

   ; Prints bottom of box
   mov edx, OFFSET bar
   mov ecx, 8
   call GotoxyAtLine
   call WriteString

   ; Prints score info
   mov edx, OFFSET pay1
   mov ecx, 10
   call GotoxyAtLine
   call WriteString

   mov edx, OFFSET pay2
   mov ecx, 11
   call GotoxyAtLine
   call WriteString

   mov edx, OFFSET pay3
   mov ecx, 12
   call GotoxyAtLine
   call WriteString

  ; Gets random character for slot 1
   mov eax, 3
   call RandomRange 
   mov ebx, OFFSET slotCharacters
   add ebx, eax
   mov al, [ebx]
   mov slot1, al

   ; Slot 2
   mov eax, 3
   call RandomRange
   mov ebx, OFFSET slotCharacters
   add ebx, eax
   mov al, [ebx]
   mov slot2, al

   ; Slot 3
   mov eax, 3
   call RandomRange
   mov ebx, OFFSET slotCharacters
   add ebx, eax
   mov al, [ebx]
   mov slot3, al

   ; Prints first blank slot in the box
   mov dl, 12
   mov dh, 6
   call GotoxyXY
   mov al, "-"
   call WriteChar

   ; Prints second blank slot in the box
   mov dl, 15
   mov dh, 6
   call GotoxyXY
   mov al, "-"  
   call WriteChar

   ; Prints third blank slot in the box
   mov dl, 18
   mov dh, 6
   call GotoxyXY
   mov al, "-"  
   call WriteChar

   ; Waits for user to hit Enter
   WaitForSpin:
      call ReadChar
      cmp al, 0Dh       ; Check if enter was pressed
      jne WaitForSpin   ; If not, keep waiting

   ; spin animation for slot 1
   cmp money, 50
   jl brokie
   sub money, 50
   mov ecx, 15     ; 15 loops
   SpinLoop:
      mov eax, 3
      call RandomRange
      mov ebx, OFFSET slotCharacters
      add ebx, eax
      mov al, [ebx]
      mov dl, 12
      mov dh, 6
      call GotoxyXY
      call WriteChar
      call Delay      ; Delay so animation doesn't play too quick
      loop SpinLoop
   ; Prints first slot in the box
   mov dl, 12
   mov dh, 6
   call GotoxyXY
   mov al, slot1    
   call WriteChar

   ; spin animation for slot 2
   mov ecx, 20     ; 20 loops
   SpinLoop1:
      mov eax, 3
      call RandomRange
      mov ebx, OFFSET slotCharacters
      add ebx, eax
      mov al, [ebx]
      mov dl, 15
      mov dh, 6
      call GotoxyXY
      call WriteChar
      call Delay
      loop SpinLoop1
   ; Prints second slot in the box
   mov dl, 15
   mov dh, 6
   call GotoxyXY
   mov al, slot2  
   call WriteChar

   ; spin animation for slot 3
   mov ecx, 25     ; 25 loops
   SpinLoop2:
      mov eax, 3
      call RandomRange
      mov ebx, OFFSET slotCharacters
      add ebx, eax
      mov al, [ebx]
      mov dl, 18
      mov dh, 6
      call GotoxyXY
      call WriteChar
      call Delay
      loop SpinLoop2
   ; Prints third slot in the box
   mov dl, 18
   mov dh, 6
   call GotoxyXY
   mov al, slot3  
   call WriteChar

   

   

   

   ; Prints score
   mov edx, OFFSET score
   mov ecx, 14
   call GotoxyAtLine
   call WriteString

   ; Calculates score
   ; Storing score in eax
   mov eax, 0
   ; Checks first slot
   mov bl, slot1
   cmp bl, "7"
   je AddSevenFirst
   cmp bl, "$"
   je AddDollarFirst
   jmp CalcSlot2 ; jumps to slot 2 if first slot is 0

; if first slot is 7, add 40 to score
AddSevenFirst:
   add eax, 40
   jmp CalcSlot2

; adds 25 to score if first slot is a $
AddDollarFirst:
   add eax, 25
   jmp CalcSlot2

; checks slot 2
CalcSlot2:
   mov bl, slot2
   cmp bl, "7"
   je AddSevenSecond
   cmp bl, "$"
   je AddDollarSecond
   jmp CalcSlot3

AddSevenSecond:
   add eax, 40
   jmp CalcSlot3

AddDollarSecond:
   add eax, 25
   jmp CalcSlot3
; checks slot 3

CalcSlot3:
   mov bl, slot3
   cmp bl, "7"
   je AddSevenThird
   cmp bl, "$"
   je AddDollarThird
   jmp PrintScore

AddSevenThird:
   add eax, 40
   jmp PrintScore

AddDollarThird:
   add eax, 25
; prints score

PrintScore:
   call WriteDec
   add money, eax
   mov edx, OFFSET balMsg
   mov ecx, 16
   call GotoxyAtLine
   call WriteString

   mov eax, money
   CALL WriteDec
   call Crlf
   call Crlf
   mov edx, OFFSET playAgainMsg
   mov ecx, 18
   call GotoxyAtLine
   call WriteString

   mov currentGame, 1
   call PlayAgainPrompt

   ret

brokie:
   mov edx, OFFSET urBrokeMsg
   mov ecx, 15
   call GotoxyAtLine
   call WriteString

   call Crlf
   call WaitMsg
   jmp BigLoop

SlotsLoop ENDP

RouletteLoop PROC
   call Clrscr
   call RouletteBoard

   mov eax, white
   call SetTextColor

   call Crlf
   call RouletteGameplay

   call PlayAgainPrompt

   ret
RouletteLoop ENDP

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

   ; Dash Bottom Boundary
   call RowEleven
   
   ; Empty Line
   ; call RowTwelve

   ; Option Line 1
   call RowThirteen
   ; Option Line 2
   call RowFourteen

   ret

; Major Blocks of Roulette

; Top Boundary
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

; Roulette Gameplay Logic
RouletteGameplay PROC
   mov edx, OFFSET balMsg
   call WriteString
   mov eax, money     ; prints out user current balance
   call WriteDec
   call Crlf

   mov edx, OFFSET returnMsg   ; "Enter 0 to Return"
   call WriteString
   call Crlf
   call Crlf

BetThisMuch:                     ; I had to add this so that NotEnoughMoney could jump here
   mov edx, OFFSET betAmountMsg  ; "Enter bet amount: $"
   call WriteString
   call ReadInt                  ; This value is stored in eax
   jc InvalidBet                 ; If input invalid, jmp to InvalidBet
   
   cmp eax, 0
   je BigLoop                    ; Sends user back to main menu if they enter 0
   cmp eax, 0
   jle InvalidBet                ; Reprompts if number is less than 0
   cmp eax, money
   jg NotEnoughMoney             ; And repromps if user cant afford bet

   ; If bet valid than accept it and take it out of user balance
   mov currentBet, eax
   sub money, eax

   call Randomize
   ; This determines the winning number of roulette
   call RandomNumberGeneration
   ; GetBetInput gets betting method from user
   call GetBetInput

   ret

; If user can't afford bet, tell them and reprompt bet amount
NotEnoughMoney:
   mov edx, OFFSET invalidString
   call WriteString
   call Crlf
   call Crlf
   mov eax, 2
   jmp BetThisMuch
   ret

; If bet isnt a valid bet amoount, tell them and reprompt

RouletteGameplay ENDP

InvalidBet PROC
    mov edx, OFFSET invalidBetMsg 
    call WriteString
    call Crlf
    jmp GetBetInput
InvalidBet ENDP

GetBetInput PROC
   ; Next 2 lines asks user how they want to bet
   mov edx, OFFSET bettingMethodPrompt
   call WriteString
   mov edx, OFFSET bettingMethod
   mov ecx, MAX
   call ReadString          ; reads user bet
   call CheckBettingMethod  ; Checks if bet type is valid
   ret
GetBetInput ENDP

; Gets random number between 0 and 36 for the winning number
RandomNumberGeneration PROC
   mov eax, 37
   call RandomRange
   mov winningNumber, eax
   ret
RandomNumberGeneration ENDP

CheckBettingMethod PROC
   ; First check half-chance bets
   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceRed
   je  CheckRed ; Red
   INVOKE Str_compare, ADDR bettingMethod, ADDR lowerRed
   je  CheckRed ; red

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceBlack
   je  CheckBlack ; Black
   INVOKE Str_compare, ADDR bettingMethod, ADDR lowerBlack
   je  CheckBlack ; black

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceEven
   je  CheckEven ; Even
   INVOKE Str_compare, ADDR bettingMethod, ADDR lowerEven
   je  CheckEven ; even

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceOdd
   je  CheckOdd ; Odd
   INVOKE Str_compare, ADDR bettingMethod, ADDR lowerOdd
   je  CheckOdd ; odd

   INVOKE Str_compare, ADDR bettingMethod, ADDR choice1to18
   je  Check1To18 ; 1 to 18

   INVOKE Str_compare, ADDR bettingMethod, ADDR choice19to36
   je  Check19To36 ; 19 to 36

   ; Then check one-third bets
   INVOKE Str_compare, ADDR bettingMethod, ADDR choice1st12
   je CheckFirst12 ; 1st 12

   INVOKE Str_compare, ADDR bettingMethod, ADDR choice2nd12
   je CheckSecond12 ; 2nd 12

   INVOKE Str_compare, ADDR bettingMethod, ADDR choice3rd12
   je CheckThird12 ; 3rd 12

   ; Now checks each number individually
   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceZero
   je CheckZero

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceOne
   je CheckOne

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceTwo
   je CheckTwo

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceThree
   je CheckThree

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceFour
   je CheckFour

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceFive 
   je CheckFive

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceSix
   je CheckSix

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceSeven
   je CheckSeven

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceEight 
   je CheckEight

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceNine 
   je CheckNine

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceTen
   je CheckTen

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceEleven
   je CheckEleven

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceTwelve
   je CheckTwelve

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceThirteen
   je CheckThirteen

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceFourteen
   je CheckFourteen

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceFifteen
   je CheckFifteen

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceSixteen
   je CheckSixteen

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceSeventeen
   je CheckSeventeen

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceEighteen
   je CheckEighteen

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceNineTeen
   je CheckNineteen

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceTwenty
   je CheckTwenty

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceTwentyOne
   je CheckTwentyOne

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceTwentyTwo
   je CheckTwentyTwo

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceTwentyThree
   je CheckTwentyThree

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceTwentyFour
   je CheckTwentyFour

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceTwentyFive
   je CheckTwentyFive

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceTwentySix 
   je CheckTwentySix

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceTwentySeven
   je CheckTwentySeven

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceTwentyEight
   je CheckTwentyEight

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceTwentyNine
   je CheckTwentyNine

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceThirty
   je CheckThirty

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceThirtyOne
   je CheckThirtyOne

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceThirtyTwo
   je CheckThirtyTwo

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceThirtyThree
   je CheckThirtyThree

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceThirtyFour
   je CheckThirtyFour

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceThirtyFive
   je CheckThirtyFive

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceThirtySix
   je CheckThirtySix

  jmp InvalidBet

CheckZero:
   mov eax, 0
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckOne:
   mov eax, 1
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckTwo:
   mov eax, 2
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckThree:
   mov eax, 3
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckFour:
   mov eax, 4
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckFive:
   mov eax, 5
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckSix:
   mov eax, 6
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckSeven:
   mov eax, 7
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckEight:
   mov eax, 8
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckNine:
   mov eax, 9
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckTen:
   mov eax, 10
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckEleven:
   mov eax, 11
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckTwelve:
   mov eax, 12
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckThirteen:
   mov eax, 13
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckFourteen:
   mov eax, 14
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckFifteen:
   mov eax, 15
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckSixteen:
   mov eax, 16
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckSeventeen:
   mov eax, 17
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckEighteen:
   mov eax, 18
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckNineteen:
   mov eax, 19
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckTwenty:
   mov eax, 20
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckTwentyOne:
   mov eax, 21
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckTwentyTwo:
   mov eax, 22
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckTwentyThree:
   mov eax, 23
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckTwentyFour:
   mov eax, 24
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckTwentyFive:
   mov eax, 25
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckTwentySix:
   mov eax, 26 
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckTwentySeven:
   mov eax, 27
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckTwentyEight:
   mov eax, 28
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckTwentyNine:
   mov eax, 29
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckThirty:
   mov eax, 30
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckThirtyOne:
   mov eax, 31
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckThirtyTwo:
   mov eax, 32
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckThirtyThree:
   mov eax, 33
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckThirtyFour:
   mov eax, 34
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckThirtyFive:
   mov eax, 35
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet
CheckThirtySix:
   mov eax, 36
   cmp eax, winningNumber
   je OneInThirtySevenChange
   call LostBet

; Checks if winning number is a red number
CheckRed:
   call IsRed
   jc HalfChance
   jmp LostBet

; Checks if winning number is a black number
CheckBlack:
   call IsRed
   jnc HalfChance
   jmp LostBet

CheckEven:
   mov eax, winningNumber
   test eax, 1
   jz HalfChance    ; If the zero flag set, its even
   jmp LostBet

CheckOdd:
   mov eax, winningNumber
   test eax, 1
   jnz HalfChance   ; If the zero flag is not set, its odd
   jmp LostBet

; Checks if winning number is between 1 and 18
Check1To18:
   mov eax, winningNumber
   cmp eax, 1
   jb LostBet       ; Jumps to won half chance bet if won
   cmp eax, 18
   ja LostBet       ; Jumps to lost bet if won
   jmp HalfChance   ; Jumps to won half chance bet if won

; Checks if winning number is between 19 and 36
Check19To36:
   mov eax, winningNumber
   cmp eax, 19
   jb LostBet
   cmp eax, 36
   ja LostBet
   jmp HalfChance

CheckBettingMethod ENDP

IsRed PROC
   mov eax, winningNumber
   ; Roulette red numbers: 1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36
   cmp eax, 1
   je IsRedTrue
   cmp eax, 3
   je IsRedTrue
   cmp eax, 5
   je IsRedTrue
   cmp eax, 7
   je IsRedTrue
   cmp eax, 9
   je IsRedTrue
   cmp eax, 12
   je IsRedTrue
   cmp eax, 14
   je IsRedTrue
   cmp eax, 16
   je IsRedTrue
   cmp eax, 18
   je IsRedTrue
   cmp eax, 19
   je IsRedTrue
   cmp eax, 21
   je IsRedTrue
   cmp eax, 23
   je IsRedTrue
   cmp eax, 25
   je IsRedTrue
   cmp eax, 27
   je IsRedTrue
   cmp eax, 30
   je IsRedTrue
   cmp eax, 32
   je IsRedTrue
   cmp eax, 34
   je IsRedTrue
   cmp eax, 36
   je IsRedTrue
   clc    ; Clears the carry flag if its not red
   ret
    
IsRedTrue:
   stc    ; Sets the carry flag if its red
   ret
IsRed ENDP

; Checks if winning number is in first 12
CheckFirst12 PROC
   mov eax, winningNumber
   cmp eax, 1
   jb LostBet
   cmp eax, 12
   ja LostBet
   call OneThirdChance
   ret
CheckFirst12 ENDP

; Checks if winning number is in second 12
CheckSecond12 PROC
   mov eax, winningNumber
   cmp eax, 13
   jb LostBet
   cmp eax, 24
   ja LostBet
   call OneThirdChance
   ret
CheckSecond12 ENDP

; Checks if winning number is in third 12
CheckThird12 PROC
   mov eax, winningNumber
   cmp eax, 25
   jb LostBet
   cmp eax, 36
   ja LostBet
   call OneThirdChance
   ret
CheckThird12 ENDP

; If the bet is lost, tell user and prompt to play again
LostBet PROC
   call WinningNumberOutput

   mov edx, OFFSET loss
   call WriteString
   call Crlf
   call Crlf
   mov edx, OFFSET playAgainMsg
   call WriteString
   mov currentGame, 2
   call PlayAgainPrompt
   ret
LostBet ENDP

HalfChance PROC
   call WinningNumberOutput

   mov edx, OFFSET win
   call WriteString
   ;mov eax, currentBet
   ;call WriteDec       ; Display amount won

   mov ebx, currentBet ; Moves the betting amount into ebx
   imul ebx, ebx, 2    ; Multiplies the bet by ten
   add money, ebx      ; Adds it to the balance
   mov eax, ebx
   call WriteDec

   call Crlf
   call Crlf

   mov edx, OFFSET playAgainMsg
   call WriteString
   mov currentGame, 2
   call PlayAgainPrompt

   ret

HalfChance ENDP

OneThirdChance PROC
   call WinningNumberOutput

   mov edx, OFFSET win
   call WriteString

   mov ebx, currentBet
   mov ebx, currentBet ; Moves the betting amount into ebx
   imul ebx, ebx, 3    ; Multiplies the bet by fifteen
   add money, ebx      ; Adds it to the balance
   mov eax, ebx
   call WriteDec

   call Crlf
   mov edx, OFFSET balMsg
   call WriteString
   mov eax, money
   call WriteDec
   call Crlf

   mov edx, OFFSET playAgainMsg
   call WriteString
   mov currentGame, 2
   call PlayAgainPrompt

   ret
OneThirdChance ENDP


OneInThirtySevenChange PROC
   call WinningNumberOutput

   mov edx, OFFSET win
   call WriteString

   mov ebx, currentBet
   mov ebx, currentBet ; Moves the betting amount into ebx
   imul ebx, ebx, 37    ; Multiplies the bet by ThirtySeven
   add money, ebx      ; Adds it to the balance
   mov eax, ebx
   call WriteDec

   call Crlf
   mov edx, OFFSET balMsg
   call WriteString
   mov eax, money
   call WriteDec
   call Crlf

   mov edx, OFFSET playAgainMsg
   call WriteString
   mov currentGame, 2
   call PlayAgainPrompt

   ret

OneInThirtySevenChange ENDP
WinningNumberOutput:
   mov edx, OFFSET winningNumberScript
   call WriteString
   mov eax, [winningNumber]
   call WriteDec
   call Crlf
   ret

; If user types an invalid bet type, print error message and reprompt
InvalidInputLoop PROC
   mov edx, OFFSET invalidString
   call WriteString
   call Crlf
   call Crlf
   jmp GetBetInput
   ret
InvalidInputLoop ENDP


; Play again prompt used for both slots and roulette
PlayAgainPrompt PROC
   call ReadChar
   cmp al, 'P'   ; P for play again
   je PlayAgain
   cmp al, 'p'
   je PlayAgain
   cmp al, 'R'   ; R for return
   je BigLoop
   cmp al, 'r'
   je BigLoop
   jmp PlayAgainPrompt

; Before we call play again prompt, we update currentGame
PlayAgain:
   cmp currentGame, 1
   je SlotsLoop
   cmp currentGame, 2
   je RouletteLoop
   jmp BigLoop ; If currentGame is nott updated, itll just return
   ret
PlayAgainPrompt ENDP

; When user leaves casino, print leave message and final balance
ExitCasino:
   call Crlf
   call Crlf
   mov edx, OFFSET leaveMsg
   call WriteString
   mov eax, money
   call WriteDec
   call Crlf
   exit

GotoxyAtLine PROC
   ; Assumes that edx = message and ecx = row
   push dx
   mov dh, cl        ; row
   mov dl, 2         ; column
   call Gotoxy
   pop dx
   ret
GotoxyAtLine ENDP

GotoxyXY PROC
   ; Assumes that dl = column (x) and dh = row (y)
   call Gotoxy
   ret
GotoxyXY ENDP

END BigLoop
