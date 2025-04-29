INCLUDE Irvine32.inc
.data
   slotCharacters BYTE "0$7", 0
   randomNumber DWORD ?
   slot1 BYTE ?
   slot2 BYTE ?
   slot3 BYTE ?
   money DWORD 100
   ; Casino sign
   casinoLine1 BYTE "   _____           _____ _____ _   _  ____  ", 0
   casinoLine2 BYTE "  / ____|   /\    / ____|_   _| \ | |/ __ \ ", 0
   casinoLine3 BYTE " | |       /  \  | (___   | | |  \| | |  | |", 0
   casinoLine4 BYTE " | |      / /\ \  \___ \  | | | . ` | |  | |", 0
   casinoLine5 BYTE " | |____ / ____ \ ____) |_| |_| |\  | |__| |", 0
   casinoLine6 BYTE "  \_____/_/    \_\_____/|_____|_| \_|\____/", 0
   ; Main menu UI elements
   balMsg  BYTE "Balance: ", 0
   casMsg  BYTE "Choose Your Game:", 0
   game1   BYTE "Press S for: Slots", 0
   game2   BYTE "Press R for: Roulette", 0
   endMsg  BYTE "Press L to leave Casino", 0
   ; Slots UI
   topMsg  BYTE "Press ENTER to Spin for $50", 0
   bar     BYTE "+-------------------------+", 0
   line    BYTE "|                         |", 0
   pay1    BYTE "0 - 0 points", 0
   pay2    BYTE "$ - 25 points", 0
   pay3    BYTE "7 - 40 points", 0
   score   BYTE "Your Score: ", 0
   playAgainMsg BYTE "Play Again? (Play - P, Return - R): ", 0
   leaveMsg   BYTE "You Left the Casino with $", 0
   urBrokeMsg BYTE "You Can't Afford to Spin", 0
   ; Data for RouletteBoard
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
   ; Bet options
   sFirst12 BYTE "1st 12", 0
   sSecond12 BYTE "2nd 12", 0
   sThird12 BYTE "3rd 12", 0
   sOneTo18 BYTE "1 to 18", 0
   sNineteenTo36 BYTE "19 to 36", 0
   sEven BYTE "Even", 0
   sOdd BYTE "Odd", 0
   sRed BYTE "Red", 0
   sBlack BYTE "Black", 0
    ; Roulette betting options
    bettingMethodPrompt BYTE "What would you like to bet on?: ", 0
    MAX = 79
    bettingMethod BYTE MAX+1 DUP(?)
    choiceRed     BYTE "red", 0
    choiceBlack   BYTE "black", 0
    choiceEven    BYTE "even", 0
    choiceOdd     BYTE "odd", 0
    choice1st12   BYTE "1st 12", 0
    choice2nd12   BYTE "2nd 12", 0
    choice3rd12   BYTE "3rd 12", 0
    choice1to18   BYTE "1 to 18", 0
    choice19to36  BYTE "19 to 36", 0
    ; win/loss messages for Roulette
    win           BYTE "You Won: ", 0
    loss          BYTE "You Lost.", 0
    winningNumber DWORD ?
    currentGame DWORD ? ; Added so play again works
    ; bet messages
    invalidString BYTE "Invalid input.", 0
    returnMsg     BYTE "Enter 0 to Return", 0
    betAmountMsg  BYTE "Enter bet amount: $", 0
    invalidBetMsg BYTE "Invalid Bet Amount", 0
    currentBet DWORD ? ; saves bet

.code
BigLoop PROC
   call Clrscr
   call Randomize
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
   mov  eax, white
   call SetTextColor
   ; Prints Main Menu UI
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
   mov edx, OFFSET game1
   mov ecx, 12
   call GotoxyAtLine
   call WriteString
   mov edx, OFFSET game2
   mov ecx, 13
   call GotoxyAtLine
   call WriteString
   mov edx, OFFSET endMsg
   mov ecx, 15
   call GotoxyAtLine
   call WriteString

   ; Game selection
   WaitForGame:
      call ReadChar
      cmp al, 's'       ; Slots
      je SlotsLoop
      cmp al, 'S'       ; uppercase S
      je SlotsLoop
      cmp ah, 'R'       ; Roulete
      je RouletteLoop
      cmp al, 'r'
      je RouletteLoop
      cmp al, 'l'       ; Leave Casino
      je exitCasino
      cmp al, 'L'
      je exitCasino
      jmp WaitForGame  ; Ignore all other keys

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
; End of Slots and Start of Roulette


; This is the major loop of roulette
RouletteLoop PROC
   call Clrscr ; clear screen
   call RouletteBoard ; builds the board for user to see
   mov eax, white 
   call SetTextColor ; sets color back to white from gree
   call Crlf
   call RouletteGameplay ; calls gameplay loop
   call PlayAgainPrompt ; after gameplay calls play agains prompt
   ret
RouletteLoop ENDP
; this is the most line heavy part of our code
; skip to about line 1000 for logic
RouletteBoard:
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
   ret

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

; gameplay logic
RouletteGameplay PROC
   mov edx, OFFSET balMsg
   call WriteString
   mov eax, money ; prints out user current balance
   call WriteDec
   call Crlf

   mov edx, OFFSET returnMsg   ; "Enter 0 to Return"
   call WriteString
   call Crlf
   call Crlf

   mov edx, OFFSET betAmountMsg  ; "Enter bet amount: $"
   call WriteString
   call ReadInt      ; This value is stored in eax
   jc InvalidBet     ; If input invalid, jmp to InvalidBet
   
   cmp eax, 0
   je BigLoop        ; sends user back to main menu if they enter 0
   cmp eax, 0
   jle InvalidBet    ; Repropts if number less than 0
   cmp eax, money
   jg NotEnoughMoney ; And reprompts if user cant afford bet

   ; If bet valid than accept it and take it out of user balance
   mov currentBet, eax
   sub money, eax

   call Randomize
   ; This determines the winning number of roulette
   call RandomNumberGeneration
   ; GetBetInput gets betting method from user
   call GetBetInput 

   ret

; if user can't afford bet, tell them and reprompt bet amount
NotEnoughMoney:
   mov edx, OFFSET invalidString
   call WriteString
   call Crlf
   call Crlf
   mov eax, 2
   call PlayAgainPrompt
   ret

; if bet isnt a valid bet amount, tell them and reprompt
InvalidBet:
    mov edx, OFFSET invalidBetMsg 
    call WriteString
    call Crlf
    jmp RouletteGameplay          
RouletteGameplay ENDP


GetBetInput PROC
   ; next 2 lines asks user how they want to bet
   mov edx, OFFSET bettingMethodPrompt
   call WriteString
   mov edx, OFFSET bettingMethod
   mov ecx, MAX
   call ReadString ; reads users bet
   call CheckBettingMethod ; checks if bet type is valid
   ret
GetBetInput ENDP

; gets random number between 0 and 36 for the winning number
RandomNumberGeneration PROC
   mov eax, 37
   call RandomRange
   mov winningNumber, eax
   ret
RandomNumberGeneration ENDP

CheckBettingMethod PROC
    ; First check half-chance bets
    INVOKE Str_compare, ADDR bettingMethod, ADDR choiceRed
    je  CheckRed ; red
    INVOKE Str_compare, ADDR bettingMethod, ADDR choiceBlack
    je  CheckBlack ; black
    INVOKE Str_compare, ADDR bettingMethod, ADDR choiceEven
    je  CheckEven ; even
    INVOKE Str_compare, ADDR bettingMethod, ADDR choiceOdd
    je  CheckOdd ; odd
    INVOKE Str_compare, ADDR bettingMethod, ADDR choice1to18
    je  Check1To18 ; 1 to 18
    INVOKE Str_compare, ADDR bettingMethod, ADDR choice19to36
    je  Check19To36 ; 1 to 19

    ; Then check one-third bets
   INVOKE Str_compare, ADDR bettingMethod, ADDR choice1st12
   je CheckFirst12 ; 1st 12
   INVOKE Str_compare, ADDR bettingMethod, ADDR choice2nd12
   je CheckSecond12 ; 2nd 12
   INVOKE Str_compare, ADDR bettingMethod, ADDR choice3rd12
   je CheckThird12 ; 3rd 12

  jmp InvalidInputLoop ; if user input isnt any of these, its invalid

; Checks if winning number is a red number
CheckRed:
    call IsRed
    jc HalfChance
    jmp LostBet

; Checks if its not red ( or zero)
CheckBlack:
    call IsRed
    jnc HalfChance
    jmp LostBet

CheckEven:
    mov eax, winningNumber
    test eax, 1
    jz HalfChance    ; If the zero flag is set, its even
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
    jb LostBet
    cmp eax, 18
    ja LostBet       ; Jumps to lost bet if lost
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
    stc    ; Set the carry flag if its red
    ret
IsRed ENDP

; Checks if winning nummber is in first 12
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

; If bet is won on half chance, double their bet and return it
HalfChance PROC
   mov edx, OFFSET win   ; Prints win message
   call WriteString
   mov eax, currentBet
   call WriteDec         ; Display amount won

   add money, eax        ; Return original bet
   add money, eax        ; Add profit

   call Crlf
   call Crlf
   ; Then prompts play again
   mov edx, OFFSET playAgainMsg
   call WriteString
   mov currentGame, 2
   call PlayAgainPrompt
   ret
HalfChance ENDP

; If bet is won on a third chance, triple their bet and return it
OneThirdChance PROC
   mov edx, OFFSET win      ; Prints win message
   call WriteString
   mov eax, currentBet
   shl eax, 1               ; Doubles bet
   call WriteDec            ; Prints win
   mov ebx, currentBet
   add money, ebx           ; Returns bet
   add money, eax           ; Adds profit
   call Crlf
   mov edx, OFFSET balMsg
   call WriteString
   mov eax, money
   call WriteDec            ; Prints new balance
   call Crlf
   mov edx, OFFSET playAgainMsg
   call WriteString
   mov currentGame, 2
   call PlayAgainPrompt     ; Prompts play again
   ret
OneThirdChance ENDP

; If user types an invalid bet type, print error message and reprompts
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
   cmp al, 'P'  ; P for play again
   je PlayAgain
   cmp al, 'p'
   je PlayAgain
   cmp al, 'R'  ; R for return
   je BigLoop
   cmp al, 'r'
   je BigLoop
   jmp PlayAgainPrompt

; Before we call play again prompt we update current game
PlayAgain:
   cmp currentGame, 1
   je SlotsLoop
   cmp currentGame, 2
   je RouletteLoop
   jmp BigLoop ; If currentGame is not updated, itll just return
   ret
PlayAgainPrompt ENDP

; When user leaves casino, prints leave message and final balancce
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
