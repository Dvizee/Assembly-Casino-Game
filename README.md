# Assembly Casino Game

## Features

### Casino UI (Main Menu)
- Game selection
- Option to leave casino (exit program)
- Rendered colored ASCII casino sign
  
  <img width="1487" height="764" alt="Screenshot 2025-12-13 222523" src="https://github.com/user-attachments/assets/e47b715b-4754-4d8c-870a-99516f281a59" />


### Slot Machine (Game 1)
- Slot machine rendered in ASCII art
- Spin animation and generation of 3 random characters (0, $, 7)
- Dynamic scoring/payout
  
  <img width="1470" height="680" alt="Screenshot 2025-12-13 223053" src="https://github.com/user-attachments/assets/4cf71f29-97a2-40a7-8b29-a36726f3deb9" />


### Roulette (Game 2)
- Roulette board rendered in colored ASCII art
- Allows for bets on colors, halves, thirds, even/odds, and individual numbers
- The winning number is generated randomly for each round
- Payout calculated based on odds
  
  <img width="1470" height="746" alt="Screenshot 2025-12-13 222722" src="https://github.com/user-attachments/assets/9434ed3b-28ed-4565-b4d5-cacdca6db9f0" />


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
