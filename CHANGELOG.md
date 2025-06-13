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
- in enums switch -> field (for faster access)looks
- static from -> factory (Not sure if its better, but looks cool)
- display() -> toString() (now you can display using '$name' or name.toString witch means Displayable is no longer needed)
- added CardRank ( 2...A )
- added FileEncoding ( pbn, lin )
- added PairDirection ( EW, NS )
- change a few methods for more clearence

## 1.1.1(2024-12-15)
- GameType fix

## 1.1.3(2024-12-16)
- Added JsonSerialization for TournamentGameRecord and Card
- Added Score in IMPs and in MPs to TournamentGameRecord

## 1.1.4(2024-12-16)
- BoardVulnerability.pairDirections change to map

## 1.1.5(2024-12-16)
- fixed directions order

## 1.1.6(2024-12-20)
- updating TounamentGameRecords fix

## 1.1.8(2024-12-20)
- updating TounamentGameRecords fix FIX

## 1.1.9(2024-12-30)
- TournamentRank enum added
- Calculating PKL added

## 1.1.11(2024-12-30)
- TournamentType and ScoringType enums added

## 1.1.12(2025-01-16)
- Calculating CP now works for custom formulas
- formulas for CP can contain basic arithmetic operations, keywords as: participants, typeFactor, place and min and max functions

## 1.1.14(2025-01-16)
- Validator for CP formulas added
- fix to how min and max functions are evaluated in CP formula evaluator

## 1.1.15(2025-01-23)
- Game Record @JsonSerializable()

## 1.1.16(2025-02-03)
- fix to some functions in CP formulas
- Arbiter Results added
- TournamentGameRecord now can store an arbiter result

## 1.1.17/1.1.18(2025-02-03)
- fix to some TournamentGameRecord.toMap() method
- added a getter for full name od ArbiterResult

## 1.1.19(2025-02-22)
- removed dashes

## 1.1.20(2025-03-18)
- added scoring types for teams

## 1.1.22(2025-05-15)
- added CardSuit

## 1.1.23(2025-05-15)
- added TeamSitting

## 1.1.24(2025-05-16)
- chaged displaying functions for GameRecord

## 1.1.25(2025-05-17)
- added scoreMP and scoreIMP to TournamentGameRecord constructor

## 1.1.26(2025-05-19)
- added TournamentGameRecord.isNotEmpty

## 1.1.29(2025-05-26)
- added fromString method for enums: CardRank, CardSuit, ScoringType, Suit
- migration from using deprecated Parser to GrammarParser
- Card.fromString now uses CardRank.fromString and CardSuit.fromString

## 1.1.30(2025-05-26)
- added TeamGameRecord
- added Room enum

## 1.1.32(2025-05-29)
- added TournamentGameRecord.fromMatchGameRecord
- added MatchGameRecord.fromTournamentGameRecord
## 1.1.33(2025-05-29)
- small fix to TeamGameRecord.editRecord()

## 1.1.36(2025-05-31)
- fix to MatchGameRecord.fromMatchGameRecord()
- added TeamGameRecord.fromTeamGameRecord()
- added TournamentGameRecord.fromTournamentGameRecord()