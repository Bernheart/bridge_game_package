import 'package:bridge_game/bridge_game.dart';

class Game<T extends GameRecord> {
  int? id;
  String? name;
  List<T> recordList;
  GameType? gameType;

  Game({this.id, this.name, List<T>? recordList, this.gameType})
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
}
