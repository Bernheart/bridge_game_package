import 'package:bridge_game/src/models/card.dart';
import 'package:bridge_game/src/models/game_record/game_record.dart';
import 'package:bridge_game/src/enums/index.dart';
import 'package:bridge_game/src/models/game_record/tournament_game_record.dart';
import 'package:json_annotation/json_annotation.dart';

part 'match_game_record.g.dart';

@JsonSerializable()
class MatchGameRecord extends GameRecord {
  bool isEmpty;
  bool get isNotEmpty => !isEmpty;

  Card? lead;
  late int tableNumber;

  MatchGameRecord({
    required this.isEmpty,
    required super.boardNumber,
    int? level,
    Suit? suit,
    ContractType? contractType,
    Direction? declarer,
    int? tricksTaken,
    this.lead,
  }) : super(
          level: isEmpty ? -1 : level!,
          suit: isEmpty ? Suit.clubs : suit!,
          contractType: isEmpty ? ContractType.pass : contractType!,
          declarer: isEmpty ? Direction.north : declarer!,
          tricksTaken: isEmpty ? 0 : tricksTaken!,
        );

  MatchGameRecord.fromGameRecord(GameRecord gameRecord, int givenTableNumber)
      : isEmpty = false,
        tableNumber = givenTableNumber,
        super(
            boardNumber: gameRecord.boardNumber,
            level: gameRecord.level,
            suit: gameRecord.suit,
            contractType: gameRecord.contractType,
            declarer: gameRecord.declarer,
            tricksTaken: gameRecord.tricksTaken);

  factory MatchGameRecord.fromMatchGameRecord(TournamentGameRecord tgr) {
    return MatchGameRecord(
      isEmpty: tgr.isEmpty,
      boardNumber: tgr.boardNumber,
      level: tgr.level,
      suit: tgr.suit,
      contractType: tgr.contractType,
      declarer: tgr.declarer,
      tricksTaken: tgr.tricksTaken,
      lead: tgr.lead,
    );
  }

  @override
  Map<String, String> toMap() {
    if (!isEmpty) {
      Map<String, String> gameRecordMap = super.toMap();
      gameRecordMap['lead'] = lead?.toString() ?? '';
      return gameRecordMap;
    } else {
      return {
        'board': (boardNumber > 0) ? boardNumber.toString() : '?',
        'contract': '',
        'lead': '',
        'score': '',
      };
    }
  }

  factory MatchGameRecord.fromJson(Map<String, dynamic> json) =>
      _$MatchGameRecordFromJson(json);

  // To JSON
  @override
  Map<String, dynamic> toJson() => _$MatchGameRecordToJson(this);
}
