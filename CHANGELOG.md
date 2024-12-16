## 1.0.0 (2024-11-18)
- Updated version for public release.
- Added detailed documentation and examples.
- Minor improvements and bug fixes.

## 1.0.5 (2024-11-22)
- Added support for empty match records
- Improved adding and removing records in match game

## 1.0.7 (2024-11-23)
- Added support for players names in match game
- Added Direction.fromString

## 1.0.9 (2024-11-24)
- Added support for match name in match game
- Added support for teams name in match game
- fixes with players names in match game

## 1.0.10 (2024-11-25)
- Added tableNumber to the MatchGameRecord
- Added GameType enum

## 1.0.11 (2024-11-25)
- updated MatchGameRecord.fromGameRecord to put table number

## 1.0.12 (2024-11-25)
- deleted name from MatchGame bc it's in Game
- added GameType.fromGame()

## 1.0.13 (2024-11-25)
- GameType.fromGame() into factory

## 1.0.14 (2024-11-25)
- Game not abstract

## 1.0.15 (2024-11-25)
- added factories to STGame and MGame from Game

## 1.0.16 (2024-11-26)
- removed pass from Suit enum

## 1.0.18(2024-12-02)
- added BoardVulnerability enum

## 1.0.19(2024-12-08)
- added Card
- added TournamentGameRecord

## 1.1.0(2024-12-15)
- in enums switch -> field (for faster access)
- static from -> factory (Not sure if its better, but looks cool)
- display() -> toString() (now you can display using '$name' or name.toString witch means Displayable is no longer needed)
- added CardRank ( 2...A )
- added FileEncoding ( pbn, lin )
- added PairDirection ( EW, NS )
- change a few methods for more clearence

## 1.1.0(2024-12-15)
- GameType fix

## 1.1.3(2024-12-16)
- Added JsonSerialization for TournamentGameRecord and Card
- Added Score in IMPs and in MPs to TournamentGameRecord