import 'package:bridge_game/bridge_game.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team_game_record.g.dart';

@JsonSerializable()
class TeamGameRecord {
  Map<Room, MatchGameRecord> records = {
    Room.open: MatchGameRecord(isEmpty: true, boardNumber: 0),
    Room.closed: MatchGameRecord(isEmpty: true, boardNumber: 0),
  };

  TeamGameRecord();

  Map<TeamSitting, Map<ScoringType, double>> scores = {};

  factory TeamGameRecord.fromTeamGameRecord(TeamGameRecord teamGameRecord) {
    return TeamGameRecord.fromGameRecords(
      open: MatchGameRecord.fromMatchGameRecord(
          teamGameRecord.records[Room.open]!),
      closed: MatchGameRecord.fromMatchGameRecord(
          teamGameRecord.records[Room.closed]!),
    )..scores =
        Map<TeamSitting, Map<ScoringType, double>>.from(teamGameRecord.scores);
  }

  TeamGameRecord.fromGameRecords({
    required MatchGameRecord open,
    required MatchGameRecord closed,
  }) {
    records[Room.open] = open;
    records[Room.closed] = closed;
    for (var sitting in TeamSitting.values) {
      scores[sitting] = {};
      for (var scoringType in ScoringType.values) {
        if (scoringType.tournamentTypes.contains(TournamentType.teams)) {
          scores[sitting]![scoringType] = 0.0;
        }
      }
    }
  }

  void editRecord({
    required Room room,
    required MatchGameRecord record,
  }) {
    records[room] = record;
    if (records[Room.open]!.isNotEmpty && records[Room.closed]!.isNotEmpty) {
      final impScore = ImpTable.getIMPs(
              (records[Room.open]!.score - records[Room.closed]!.score).toInt())
          .toDouble();
      scores[TeamSitting.home]![ScoringType.IMP] =
          impScore > 0 ? impScore : 0.0;
      scores[TeamSitting.home]![ScoringType.IMP_VP] =
          impScore > 0 ? impScore : 0.0;
      scores[TeamSitting.away]![ScoringType.IMP] =
          impScore > 0 ? 0.0 : -impScore;
      scores[TeamSitting.away]![ScoringType.IMP_VP] =
          impScore > 0 ? 0.0 : -impScore;

      for (var scoringType in [ScoringType.BAM, ScoringType.Patton]) {
        double homeScore =
            (records[Room.open]!.score > records[Room.closed]!.score)
                ? 2
                : (records[Room.open]!.score < records[Room.closed]!.score)
                    ? 0
                    : 1;
        scores[TeamSitting.home]![scoringType] = homeScore;
        scores[TeamSitting.away]![scoringType] = 2 - homeScore;
      }
    } else {
      for (var sitting in TeamSitting.values) {
        for (var scoringType in ScoringType.values) {
          if (scoringType.tournamentTypes.contains(TournamentType.teams)) {
            scores[sitting]![scoringType] = 0.0;
          }
        }
      }
    }
  }

  factory TeamGameRecord.fromJson(Map<String, dynamic> json) =>
      _$TeamGameRecordFromJson(json);

  Map<String, dynamic> toJson() => _$TeamGameRecordToJson(this);
}
