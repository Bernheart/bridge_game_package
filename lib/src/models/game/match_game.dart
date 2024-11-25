import 'package:bridge_game/bridge_game.dart';

class MatchGame extends Game<MatchGameRecord> {
  List<MatchGameRecord> secondTableRecordList;
  List<int> boardNumbers;
  Map<Direction, String> table1 = {}, table2 = {};
  String team1Name;
  String team2Name;
  MatchGame(
      {super.id,
      super.name,
      super.recordList,
      required this.secondTableRecordList,
      required this.boardNumbers,
      this.team1Name = "",
      this.team2Name = ""});

  int findRecordByBoardNumber(int boardNumber) {
    for (int i = 0; i < recordList.length; i++) {
      if (recordList[i].boardNumber == boardNumber) {
        return i;
      }
    }
    return -1;
  }

  int setBoardNumber(int nextBoardNumber) {
    int firstEmptyRecordBoardNumber = 0;
    for (MatchGameRecord gameRecord in recordList) {
      if (firstEmptyRecordBoardNumber == 0 && gameRecord.isEmpty) {
        firstEmptyRecordBoardNumber = gameRecord.boardNumber;
      }
      if (gameRecord.boardNumber >= nextBoardNumber && gameRecord.isEmpty) {
        return gameRecord.boardNumber;
      }
      if (gameRecord.boardNumber == nextBoardNumber) nextBoardNumber++;
    }
    return (firstEmptyRecordBoardNumber != 0
        ? firstEmptyRecordBoardNumber
        : nextBoardNumber);
  }

  void insertRecord(MatchGameRecord record) {
    if (recordList.isEmpty || record.boardNumber == 0) {
      recordList.add(record);
      return;
    }
    if (!recordList.last.isEmpty &&
        recordList.last.boardNumber < record.boardNumber) {
      recordList.add(record);
      return;
    }
    for (int i = 0; i < recordList.length; i++) {
      if (recordList[i].boardNumber > record.boardNumber) {
        recordList.insert(i, record);
        if (recordList.last.isEmpty) recordList.removeLast();
        break;
      }
      if (recordList[i].boardNumber == 0 ||
          recordList[i].boardNumber == record.boardNumber) {
        recordList[i] = record;
        break;
      }
    }
  }

  int removeRecord(int boardNumber) {
    int index = findRecordByBoardNumber(boardNumber);
    if (index != -1) recordList.removeAt(index);
    return index;
  }

  void setSecondTableRecordList(List<MatchGameRecord> recordListSecondTable) {
    secondTableRecordList = recordListSecondTable;

    recalculateBoardNumbers();
  }

  void recalculateBoardNumbers() {
    boardNumbers.clear();

    boardNumbers.addAll(recordList.map((g) => g.boardNumber));
    boardNumbers.addAll(
      secondTableRecordList
          .map((g) => g.boardNumber)
          .where((boardNumber) => !boardNumbers.contains(boardNumber)),
    );
    boardNumbers.sort();
  }

  void setPlayers(bool myTable, Map<Direction, String> players) {
    if (myTable) {
      table1 = players;
    } else {
      table2 = players;
    }
  }

  Map<Direction, String> getPlayers(bool myTable) {
    return myTable ? table1 : table2;
  }

  String getDirectionString(bool myTable, String playerName) {
    return ifPlayerExists(myTable, playerName)
        ? getDirectionByPlayerName(myTable, playerName).name
        : " ";
  }

  bool ifPlayerExists(bool myTable, String playerName) {
    return (myTable ? table1 : table2).values.contains(playerName);
  }

  Direction getDirectionByPlayerName(bool myTable, String playerName) {
    Map<Direction, String> map = myTable ? table1 : table2;
    Direction d = Direction.north;
    map.forEach((key, value) {
      if (value == playerName) d = key;
    });
    return d;
  }

  Map<Direction, String> getPlayersInTeam(bool isTeam1) {
    Map<Direction, String> map = {};
    if (isTeam1) {
      map[Direction.north] = table1.keys.contains(Direction.north)
          ? table1[Direction.north]!
          : "\u2014";
      map[Direction.south] = table1.keys.contains(Direction.south)
          ? table1[Direction.south]!
          : "\u2014";
      map[Direction.east] = table2.keys.contains(Direction.east)
          ? table2[Direction.east]!
          : "\u2014";
      map[Direction.west] = table2.keys.contains(Direction.west)
          ? table2[Direction.west]!
          : "\u2014";
    } else {
      map[Direction.north] = table2.keys.contains(Direction.north)
          ? table2[Direction.north]!
          : "\u2014";
      map[Direction.south] = table2.keys.contains(Direction.south)
          ? table2[Direction.south]!
          : "\u2014";
      map[Direction.east] = table1.keys.contains(Direction.east)
          ? table1[Direction.east]!
          : "\u2014";
      map[Direction.west] = table1.keys.contains(Direction.west)
          ? table1[Direction.west]!
          : "\u2014";
    }
    return map;
  }
}
