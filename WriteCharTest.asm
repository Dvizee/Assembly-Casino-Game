INCLUDE Irvine32.inc
.data
   cVerticalBar BYTE '|', 0
   cPoundSign BYTE '#', 0
   cForwardSlash BYTE '/', 0

   blackOnGreen DWORD 20h

.code
main PROC
   call ForwardSlash
   exit
main ENDP
ForwardSlash:
   call SetBlack
   mov edx, OFFSET cForwardSlash
   call WriteString
   ret
SetBlack:
   mov eax, blackOnGreen
   call SetTextColor
   ret

END main
