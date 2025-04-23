; PLEASE REMEMBER TO GO BACK AND CHECK TO SEE IF THE BETTING AMOUNT
; IS A NUMBER AND LESS THAN OR EQUAL TO THE BALANCE


INCLUDE Irvine32.inc
.data
   winningNumber DWORD ? 
   
   bettingMethodPrompt BYTE "What would you like to bet on?: ", 0
   
   MAX = 79
   bettingMethod BYTE MAX+1 DUP(?)

   ; all your “named” bets here:
   choiceRed     BYTE "red",0
   choiceBlack   BYTE "black",0
   choiceEven    BYTE "even",0
   choiceOdd     BYTE "odd",0
   choice1st12   BYTE "1st 12",0
   choice2nd12   BYTE "2nd 12",0
   choice3rd12   BYTE "3rd 12",0
   choice1to18   BYTE "1 to 18",0
   choice19to36  BYTE "19 to 36",0

   invalidString BYTE "Invalid String", 0
   nullString BYTE "There are no strings here", 0
   numberMatch BYTE "Number Matched", 0
   
   matchResult DWORD ?, 0

   zero BYTE "0", 0
   one BYTE "1", 0
   two BYTE "2", 0
   three BYTE "3", 0
   four BYTE "4", 0
   five BYTE "5", 0
   six BYTE "6", 0
   seven BYTE "7", 0
   eight BYTE "8", 0
   nine BYTE "9", 0


   win BYTE "You Won:", 0
   loss BYTE "You Lost", 0

   numberPrize BYTE "$80,000", 0
   halfChancePrize BYTE '$5000', 0
   thirdChancePrize BYTE '$15000', 0
   
.code 
main PROC
   ; Generates Winning number for the round
   call Randomize
   call RandomNumberGeneration
   call TakeInput
   call CheckBettingMethod

   exit
main ENDP
RandomNumberGeneration: 
   mov eax, 37
   call RandomRange
   mov winningNumber, eax
   ret
TakeInput:
   ; IMPROVMENTNEEDED
   ; If you can fix ReadString, think about implementing a player set betting amount
   mov edx, OFFSET bettingMethodPrompt
   call WriteString

   mov edx, OFFSET winningNumber
   call WriteInt
   ; IMPROVMENTNEEDED
   ; ReadString is only reading the first letter of the input
   mov   edx, OFFSET bettingMethod
   mov ecx, MAX
   call  ReadString
   ret
CheckBettingMethod:
   Invoke Str_compare, ADDR winningNumber, ADDR bettingMethod
   je CheckLength
   ; If the player guessed wrong
   mov edx, OFFSET loss
   call WriteString
   call PlayAgainPrompt
CheckLength:
   mov esi, OFFSET bettingMethod
   xor ecx, ecx
   call CountLoop
   ret
CountLoop:
   mov al, [esi + ecx]
   cmp al, 0
   je LengthDone
   inc ecx
   jmp CountLoop
LengthDone:
   cmp ecx, 1
   jl LessThanOne
   cmp ecx, 2
   jl LessThanTwo 
   cmp ecx, 3
   jl LessThanThree

   call CheckValidString
CheckValidString:

   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceRed
   je HalfChance
   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceBlack
   je HalfChance
   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceEven
   je HalfChance
   INVOKE Str_compare, ADDR bettingMethod, ADDR choiceOdd
   je HalfChance
   INVOKE Str_compare, ADDR bettingMethod, ADDR choice1to18
   je HalfChance
   INVOKE Str_compare, ADDR bettingMethod, ADDR choice19to36
   je HalfChance
   INVOKE Str_compare, ADDR bettingMethod, ADDR choice1st12
   je OneThirdChance
   INVOKE Str_compare, ADDR bettingMethod, ADDR choice2nd12
   je OneThirdChance
   INVOKE Str_compare, ADDR bettingMethod, ADDR choice3rd12
   je OneThirdChance

   call InvalidInputLoop
   
; Winning Results


NumberedSlotWin:
   mov edx, OFFSET win
   call WriteString
   call Crlf
   mov edx, OFFSET numberPrize
   call WriteString
   ; Implement the "do you want to play again" loop here
   call PlayAgainPrompt

HalfChance:
   mov edx, OFFSET win
   call WriteString
   call Crlf
   mov edx, OFFSET halfChancePrize
   call WriteString
   ; Implement the "do you want to play again" loop here
   call PlayAgainPrompt

OneThirdChance:
   mov edx, OFFSET win
   call WriteString
   call Crlf
   mov edx, OFFSET thirdChancePrize
   call WriteString
   ; Implement the "do you want to play again" loop here
   call PlayAgainPrompt




; Checks the length of the string
LessThanOne:
   mov edx, OFFSET nullString
   call WriteString

   call InvalidInputLoop
; I found this method when looking for ways to compare what part of the string
; at a time. It looks a lot better than what I do for the LessThanTwo function
LessThanThree:
   mov al, [bettingMethod]

   cmp al, [zero]
   je ValidFirstDigit
   cmp al, [one]
   je ValidFirstDigit
   cmp al, [two]
   je ValidFirstDigit
   cmp al, [three]
   je ValidFirstDigit

   call InvalidInputLoop
   
ValidFirstDigit:
   mov al, [bettingMethod + 1]

   cmp al, [zero]
   je NumberedSlotWin
   cmp al, [one]
   je NumberedSlotWin
   cmp al, [two]
   je NumberedSlotWin
   cmp al, [three]
   je NumberedSlotWin
   cmp al, [four]
   je NumberedSlotWin
   cmp al, [five]
   je NumberedSlotWin
   cmp al, [six]
   je NumberedSlotWin
   cmp al, [seven]
   je NumberedSlotWin
   cmp al, [eight]
   je NumberedSlotWin
   cmp al, [nine]
   je NumberedSlotWin

   call InvalidInputLoop

LessThanTwo:
   mov edx, OFFSET choiceRed
   call ZeroWinConditions
   call MatchCall

   call OneWinConditions
   call MatchCall

   call TwoWinConditions
   call MatchCall


   call ThreeWinConditions
   call MatchCall

   call FourWinConditions
   call MatchCall

   call FiveWinConditions	
   call MatchCall

   call SixWinConditions
   call MatchCall

   call SevenWinConditions
   call MatchCall

   call EightWinConditions
   call MatchCall

   call NineWinConditions
   call MatchCall

   ; It is not a valid character
   call InvalidInputLoop

ZeroWinConditions:
   INVOKE Str_compare, ADDR bettingMethod, ADDR zero
   je NumberMatched
   ret
OneWinConditions:
   INVOKE Str_compare, ADDR bettingMethod, ADDR one
   je NumberMatched
   ret
TwoWinConditions:
   INVOKE Str_compare, ADDR bettingMethod, ADDR two
   je NumberMatched
   ret
ThreeWinConditions:
   INVOKE Str_compare, ADDR bettingMethod, ADDR three
   je NumberMatched
   ret
FourWinConditions:
   INVOKE Str_compare, ADDR bettingMethod, ADDR four
   je NumberMatched
   ret
FiveWinConditions:
   INVOKE Str_compare, ADDR bettingMethod, ADDR five
   je NumberMatched
   ret
SixWinConditions:
   INVOKE Str_compare, ADDR bettingMethod, ADDR six
   je NumberMatched
   ret
SevenWinConditions:
   INVOKE Str_compare, ADDR bettingMethod, ADDR seven
   je NumberMatched
   ret
EightWinConditions:
   INVOKE Str_compare, ADDR bettingMethod, ADDR eight
   je NumberMatched
   ret
NineWinConditions:
   INVOKE Str_compare, ADDR bettingMethod, ADDR nine
   je NumberMatched
   ret

; Matching Logic
MatchCall:
   INVOKE Str_compare, ADDR matchResult, ADDR numberMatch
   je NumberedSlotWin
   ret
NumberMatched:
   mov edx, OFFSET numberMatch      ; Load address of numberMatch
   mov ecx, OFFSET matchResult
   mov esi, edx                    ; Source address
   mov edi, ecx
   call CopyLoop
   ret
CopyLoop:
   mov al, [esi]
   mov [edi], al
   inc esi
   inc edi
   cmp al, 0
   je CopyDone
   jmp CopyLoop
CopyDone:
   ret




; Input Errors, loop back to ask for input again
InvalidMSG:
   mov edx, OFFSET invalidString
   call WriteString
   ; Temperary Exit for debugging
   exit

; IMPROVMENTNEEDED
InvalidInputLoop:
   ; This needs to tell them it is an invalid input, wait for them to press a key 
   ; And prompt that it is waiting, and then loop to asking for input if it is 
   ; Not a valid input
   call InvalidMSG
   ; Temperary exit for debugging
   exit



END main
