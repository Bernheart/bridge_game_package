import 'dart:math';

import 'package:bridge_game/src/models/game_record/game_record.dart';

abstract class Game<T extends GameRecord> {
  int? id;
  String? name;
  List<T> recordList;

  Game({this.id, this.name, List<T>? recordList})
      : recordList = recordList ?? [];

  void addRecord(T record) {
    recordList.add(record);
  }

  void getRecordList(List<T> records) {
    recordList = records;
  }

  void removeLastRecord() {
    recordList.removeLast();
  }

  String displayName() {
    return name ?? "Game $id";
  }

  // GamesCompanion toCompanion() {
  //   return GamesCompanion(
  //       gameName: Value.absentIfNull(name), date: Value.absent());
  // }
}

class SingleTableGame extends Game<SingleTableGameRecord> {
  int scoreNS;
  int scoreEW;

  // Constructor with named parameters and initializer list
  SingleTableGame({
    super.id,
    super.name,
    this.scoreNS = 0,
    this.scoreEW = 0,
    super.recordList,
  });

  void updateScore(int impNS, bool increase) {
    if (increase) {
      scoreNS += max(0, impNS);
      scoreEW += max(0, -impNS);
    } else {
      scoreNS -= max(0, impNS);
      scoreEW -= max(0, -impNS);
    }
  }

  @override
  void addRecord(SingleTableGameRecord record) {
    super.addRecord(record);
    updateScore(record.impNS, true);
  }

  @override
  void getRecordList(List<SingleTableGameRecord> records) {
    super.getRecordList(records);

    scoreNS = scoreEW = 0;
    for (var record in records) {
      updateScore(record.impNS, true);
    }
  }

  @override
  void removeLastRecord() {
    updateScore(-recordList.last.impNS, false);
    super.removeLastRecord();
  }

  int getScore() {
    return scoreNS - scoreEW;
  }
}

class MatchGame extends Game<MatchGameRecord> {
  MatchGame({super.id, super.name, super.recordList});
}
