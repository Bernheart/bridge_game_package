import 'package:bridge_game/bridge_game.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team_game_record.g.dart';

@JsonSerializable()
class TeamGameRecord {
  Map<Room, MatchGameRecord> records = {
    Room.open: MatchGameRecord(isEmpty: true, boardNumber: 0),
    Room.closed: MatchGameRecord(isEmpty: true, boardNumber: 0),
  };

  Map<ScoringType, double> scores = {};

  TeamGameRecord();

  TeamGameRecord.fromGameRecords({
    required MatchGameRecord open,
    required MatchGameRecord closed,
  }) {
    records[Room.open] = open;
    records[Room.closed] = closed;
  }

  void editRecord({
    required Room room,
    required MatchGameRecord record,
  }) {
    records[room] = record;
    if (records[Room.open]!.isNotEmpty && records[Room.closed]!.isNotEmpty) {
      scores[ScoringType.IMP] = ImpTable.getIMPs(
              (records[Room.open]!.score - records[Room.closed]!.score).toInt())
          .toDouble();
      scores[ScoringType.IMP_VP] = ImpTable.getIMPs(
              (records[Room.open]!.score - records[Room.closed]!.score).toInt())
          .toDouble();
      scores[ScoringType.BAM] =
          (records[Room.open]!.score > records[Room.closed]!.score)
              ? 2
              : (records[Room.open]!.score < records[Room.closed]!.score)
                  ? 0
                  : 1;
      scores[ScoringType.Patton] =
          (records[Room.open]!.score > records[Room.closed]!.score)
              ? 2
              : (records[Room.open]!.score < records[Room.closed]!.score)
                  ? 0
                  : 1;
    } else {
      scores.clear();
    }
  }

  factory TeamGameRecord.fromJson(Map<String, dynamic> json) =>
      _$TeamGameRecordFromJson(json);

  Map<String, dynamic> toJson() => _$TeamGameRecordToJson(this);
}
