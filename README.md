# bumtsibum

```
git clone <this repo> ./bumtsibum
cd bumtsibum
qmake # or qmake-qt5 if qt6 is installed
make
./bumtsibum words1.txt words2.txt ...
```

## Preparing

Word files should be formatted similarly to the example words.txt file, i.e. 5 words of a song per line. Each line should contain words from a different song.

The number of lines in a file is equal to the number of rounds that are played in a single game.

Multiple files can be specified. If multiple word files are specified, pressing "n" or enter at the end game dialog starts a new game. The program exits when there are no more files.

Files and lines will be shown in the order specified, and two red cards are randomly chosen.

## Running the game

Run the program as described previously. The controls are as follows:

| key     | function                                      |
| ------- | --------------------------------------------- |
| 1-5:    | toggles the card's state (shown/hidden)       |
| R/C:    | hides all cards (does not change words)       |
| N:      | hides all cards and changes words and colours |
| A:      | shows all cards                               |
| Ctrl+q: | exits the program                             |

During the game, status messages are printed to console. These contain information such as the current words, their colours, as well as their states.

A card's state is useful, if you wish to open the remaining cards in sync with the singing and cannot see the game screen.
