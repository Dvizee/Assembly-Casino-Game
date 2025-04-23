INCLUDE Irvine32.inc
.data
   slotCharacters BYTE "0$7", 0
   randomNumber DWORD ?
   slot1 BYTE ?
   slot2 BYTE ?
   slot3 BYTE ?

   money DWORD 100

   casinoLine1 BYTE "   _____           _____ _____ _   _  ____  ", 0
   casinoLine2 BYTE "  / ____|   /\    / ____|_   _| \ | |/ __ \ ", 0
   casinoLine3 BYTE " | |       /  \  | (___   | | |  \| | |  | |", 0
   casinoLine4 BYTE " | |      / /\ \  \___ \  | | | . ` | |  | |", 0
   casinoLine5 BYTE " | |____ / ____ \ ____) |_| |_| |\  | |__| |", 0
   casinoLine6 BYTE "  \_____/_/    \_\_____/|_____|_| \_|\____/", 0

   balMsg  BYTE "Balance: ", 0
   casMsg  BYTE "Choose Your Game:", 0
   game1   BYTE "Press S for: Slots", 0
   game2   BYTE "Press R for: Roulette", 0
   game3   BYTE "Press H for: Horse Betting", 0
   endMsg  BYTE "Press L to leave Casino", 0


   topMsg  BYTE "Press ENTER to Spin for $50", 0
   bar     BYTE "+-------------------------+", 0
   line    BYTE "|                         |", 0
   pay1    BYTE "0 - 0 points", 0
   pay2    BYTE "$ - 25 points", 0
   pay3    BYTE "7 - 40 points", 0
   score   BYTE "Your Score: ", 0
   playAgainMsg BYTE "Play Again? (Play - P, Return - R): ", 0

.code
main PROC

BigLoop:
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

   mov edx, OFFSET game3
   mov ecx, 14
   call GotoxyAtLine
   call WriteString

   mov edx, OFFSET endMsg
   mov ecx, 16
   call GotoxyAtLine
   call WriteString

   WaitForGame:
      call ReadChar
      cmp al, 's'      ; lowercase s
      je SlotsLoop
      cmp al, 'S'      ; uppercase S
      je SlotsLoop
      cmp ah, 'R'       ; roulete
      je RouletteLoop
      cmp al, 'r'
      je RouletteLoop
      cmp al, 'l'
      je exitCasino
      cmp al, 'L'
      je exitCasino
      jmp WaitForGame  ; ignore all other keys


SlotsLoop:

   ; Prints header/ insturctions
   sub money, 50
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

PlayAgainPrompt:
    call ReadChar
    cmp al, 50h ; P
    je SlotsLoop
    cmp al, 70h ; p
    je SlotsLoop
    cmp al, 52h ; R
    je BigLoop
    cmp al, 72h ; r
    je BigLoop
    jmp PlayAgainPrompt


RouletteLoop:
   call Clrscr





ExitCasino:
    exit
main ENDP


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


END main
