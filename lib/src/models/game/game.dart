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
}
