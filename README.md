# Assembly Casino Game

## Features

### Casino UI (Main Menu)
- Game selection
- Option to leave casino (exit program)
- Rendered colored ASCII casino sign

### Slot Machine (Game 1)
- Slot machine rendered in ASCII art
- Spin animation and generation of 3 random characters (0, $, 7)
- Dynamic scoring/payout

### Roulette (Game 2)
- Roulette board rendered in colored ASCII art
- Allows for bets on colors, halves, thirds, even/odds, and individual numbers
- The winning number is generated randomly for each round
- Payout calculated based on odds 

## How to Run

### Prerequisites
- Windows OS
- MASM installed
- Irvine32 library is installed and set up

### Steps
- Download the repo
- Open project in Visual Studio (recommended) or build via command lines:
  ```bash
  ml /c /coff Casino.asm
  ml /c /coff RouletteBoard.asm
  link /subsystem:console Casino.obj RouletteBoard.obj Irvine32.lib
  ```
- Run the executable to start the game!
