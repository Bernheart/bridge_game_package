import 'package:bridge_game/src/models/game/game.dart';
import 'package:bridge_game/src/models/game_record/match_game_record.dart';

class MatchGame extends Game<MatchGameRecord> {
  MatchGame({super.id, super.name, super.recordList});

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
}
